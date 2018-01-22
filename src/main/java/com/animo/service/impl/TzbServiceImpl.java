package com.animo.service.impl;

import com.animo.calculate.ACMLoanCalculator;
import com.animo.calculate.ACPIMLoanCalculator;
import com.animo.calculate.LoanByMonth;
import com.animo.calculate.LoanUtil;
import com.animo.common.Pager;
import com.animo.common.ServerResponse;
import com.animo.dao.*;
import com.animo.enums.BorrowStatusEnum;
import com.animo.enums.HKStatusEnum;
import com.animo.enums.WayEnum;
import com.animo.pojo.*;
import com.animo.service.RewardService;
import com.animo.service.TzbService;
import com.animo.service.UserMoneyService;
import com.animo.utils.BeanCopyUtils;
import com.animo.utils.RateUtils;
import com.animo.vo.BorrowApplyDetail;
import com.animo.vo.TzCountVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

/**
 * Created by Animo on 2017-12-25.
 */
@Service
public class TzbServiceImpl extends AbstractServiceImpl implements TzbService{

    private TzbMapper tzbMapper;

    private BorrowapplyMapper borrowApplyMapper;

    private BorrowdetailMapper borrowDetailMapper;

    private UsermoneyMapper userMoneyMapper;

    private RewardMapper rewardMapper;

    private RewardSettingMapper rewardSettingMapper;

    private HkbMapper hkbMapper;

    private ShborrowMapper shborrowMapper;

    private UserTicketMapper userTicketMapper;

    private TicketMapper ticketMapper;

    private UserMapper userMapper;

    @Override
    @Transactional
    public ServerResponse save(Object obj) {
        Tzb tzb = (Tzb)obj;
        BorrowApplyDetail bAD = (BorrowApplyDetail)borrowApplyMapper.getByIdVo(tzb.getBaid());
        if(bAD.getUid().equals(tzb.getUid())) {
            return ServerResponse.createByError("投资失败！不能给自己投资");
        }
        //如果已经满标
        if(bAD.getMoneyCount().compareTo(bAD.getMoney()) == 0) {
            return ServerResponse.createByError("已满标");
        }
        // 查出投资人的资产
        Usermoney userMoney = userMoneyMapper.selectByUid(tzb.getUid());
        //可用余额小于投资金额
        if(userMoney.getKymoney().compareTo(tzb.getMoney()) == -1) {
            return ServerResponse.createByError("余额不足！请充值");
        }
        // 查出借款人的资产
        Usermoney juserMoney = userMoneyMapper.selectByUid(bAD.getUid());
        BigDecimal syMoney = BigDecimal.valueOf(0);
        // 如果投标时间超过截止时间,则流标
        if(bAD.getDeadline().compareTo(Calendar.getInstance().getTime()) == -1) {
            //更新借款状态为已流标
            borrowApplyMapper.updateTime(tzb.getBaid(), BorrowStatusEnum.BORROW_FAIL.getCode(),bAD.getCktime());
            // 将借款人的冻结金额减去已筹金额，总资产减去已筹金额
            juserMoney.setDjmoney(juserMoney.getDjmoney().subtract(bAD.getMoneyCount()));
            juserMoney.setZmoney(juserMoney.getZmoney().subtract(bAD.getMoneyCount()));
            userMoneyMapper.updateByPrimaryKeySelective(juserMoney);
            // 将原先所有投资人的投资金额减去投资金额，待收总额减去收益，可用余额增加投资金额，总资产减利息，收益总额减去利息
            List<TzCountVO> tzCounts = tzbMapper.getTotalTzMoney(tzb.getBaid());
            for(TzCountVO tzCount : tzCounts) {
                syMoney = RateUtils.getSyMoney(bAD.getWay(), tzCount.getTotalMoney(), bAD.getTerm(), bAD.getNprofit());
                Usermoney userMoney1 = userMoneyMapper.selectByUid(tzCount.getUid());
                Double percent = rewardSettingMapper.selectpercent(userMoney1.getTzmoney());
                userMoney1.setTzmoney(userMoney1.getTzmoney().subtract(tzCount.getTotalMoney()));
                userMoney1.setDsmoney(userMoney1.getDsmoney().subtract(syMoney.add(tzCount.getTotalMoney())));
                userMoney1.setKymoney(userMoney1.getKymoney().add(tzCount.getTotalMoney()));
                userMoney1.setZmoney(userMoney1.getZmoney().subtract(syMoney));
                userMoney1.setSymoney(userMoney1.getSymoney().subtract(syMoney));
                userMoneyMapper.updateByPrimaryKeySelective(userMoney1);
                // 减去投资奖励
                Reward reward = (Reward)rewardMapper.selectByUid(tzb.getUid());
                reward.setTmoney(reward.getTmoney().subtract(tzCount.getTotalMoney()));
                BigDecimal rewardMoney = reward.getTmoney().multiply(BigDecimal.valueOf(percent / 100))
                        .setScale(2, BigDecimal.ROUND_HALF_UP);
                reward.setMoney(rewardMoney);
                rewardMapper.updateByPrimaryKeySelective(reward);
            }
            return ServerResponse.createByError("投标已截止");
        }
        tzb.setJuid(bAD.getUid());
        tzb.setNprofit(bAD.getNprofit());
        tzb.setCpname(bAD.getCpname());
        tzb.setTztime(Calendar.getInstance().getTime());
        tzbMapper.insertSelective(tzb);
        // tzb.getResint1()为还款期数
        Integer month = tzb.getResint1();
        //用户券id 用户如果使用券，则把券删除
        Integer ukid = tzb.getResint3();
        BigDecimal ticketMoney = BigDecimal.valueOf(0);
        if(ukid != null && ukid != 0) {
            UserTicket userTicket = (UserTicket) userTicketMapper.selectByPrimaryKey(ukid);
            Ticket ticket = (Ticket)ticketMapper.selectByPrimaryKey(userTicket.getKid());
            ticketMoney = ticket.getTkmoney();
            userTicketMapper.deleteByPrimaryKey(ukid);
        }
        //修改投资人的资产
        userMoney.setTzmoney(userMoney.getTzmoney().add(tzb.getMoney()));
        //获取投资总额所对应的投资奖励百分比
        Double percent = rewardSettingMapper.selectpercent(userMoney.getTzmoney());
        //添加投资奖励记录
        Reward reward = (Reward)rewardMapper.selectByUid(tzb.getUid());
        if(userMoney.getTzmoney().compareTo(new BigDecimal(10000))==1){
            User user = new User();
            user.setUid(userMoney.getUid());
            user.setIsvip(1);
            userMapper.updateByPrimaryKeySelective(user);
        }
        if(reward == null) {
            reward = new Reward();
            reward.setTmoney(tzb.getMoney());
            BigDecimal rewardMoney = reward.getTmoney().multiply(BigDecimal.valueOf(percent / 100))
                    .setScale(2, BigDecimal.ROUND_HALF_UP);
            reward.setMoney(rewardMoney);
            reward.setUid(tzb.getUid());
            rewardMapper.insertSelective(reward);
        } else {
            reward.setTmoney(reward.getTmoney().add(tzb.getMoney()));
            BigDecimal rewardMoney = reward.getTmoney().multiply(BigDecimal.valueOf(percent / 100))
                    .setScale(2, BigDecimal.ROUND_HALF_UP);
            reward.setMoney(rewardMoney);
            rewardMapper.updateByPrimaryKeySelective(reward);
        }
        // 更新用户资产 可用余额减（投资总额减券价值）
        userMoney.setKymoney(userMoney.getKymoney().subtract(tzb.getMoney().subtract(ticketMoney)));
        //初始化收益
        Float yearNpro = bAD.getNprofit();
        //月利率
        Float monthNpro = yearNpro / 12;
        // 获取用户总利息
        syMoney = RateUtils.getSyMoney(bAD.getWay(), tzb.getMoney(), month, yearNpro);
        //用户待收总额等于原待收加（投资加用户利息收益）   .setScale(2, BigDecimal.ROUND_HALF_UP)设置精度为两位小数点
        userMoney.setDsmoney(userMoney.getDsmoney().add(tzb.getMoney().add(syMoney)));
        //用户收益总额等于原收益总额加（用户利息）
        userMoney.setSymoney(userMoney.getSymoney().add(syMoney));
        // 用户总资产等于原先总资产加投资利息
        userMoney.setZmoney(userMoney.getZmoney().add(syMoney).add(ticketMoney));
        userMoneyMapper.updateByPrimaryKeySelective(userMoney);
        // 如果已筹金额等于目标金额,则更新借款表中的状态为还款中、更新借款人冻结金额为可用余额
        Borrowdetail borrowDetail = new Borrowdetail();
        //修改借款人的资产
        juserMoney.setZmoney(juserMoney.getZmoney().add(tzb.getMoney()));
        juserMoney.setDjmoney(juserMoney.getDjmoney().add(tzb.getMoney()));
        //如果已经满标
        if((bAD.getMoneyCount().add(tzb.getMoney())).compareTo(bAD.getMoney()) == 0) {
            Borrowapply borrowApply = new Borrowapply();
            borrowApply.setBaid(tzb.getBaid());
            borrowApply.setCkstatus(BorrowStatusEnum.REPAYMENT.getCode());
            borrowApplyMapper.updateByPrimaryKeySelective(borrowApply);
            //满标时将借款人的冻结金额变成可用余额
            juserMoney.setDjmoney(juserMoney.getDjmoney().subtract(bAD.getMoney()));
            juserMoney.setKymoney(juserMoney.getKymoney().add(bAD.getMoney()));
            // 生成还款清单
            //查找贷后负责人id
            Integer huid = shborrowMapper.getIdByBaid(tzb.getBaid());
            //一次还清的还款清单
            Calendar calendar = Calendar.getInstance();
            calendar.setTime(Calendar.getInstance().getTime());
            if(bAD.getWay().equals(WayEnum.PAYOFF_ONCE.getCode())) {
                Hkb hkb = new Hkb();
                try {
                    BeanCopyUtils.copy(hkb, bAD);
                    hkb.setYbj(bAD.getMoney());
                    hkb.setYlx(syMoney);
                    hkb.setYbx(bAD.getMoney().add(syMoney));
                    hkb.setTnum(1);
                    calendar.add(Calendar.MONTH, month);
                    hkb.setYtime(calendar.getTime());
                    hkb.setHuid(huid);
                    hkb.setBaid(tzb.getBaid());
                    hkbMapper.insertSelective(hkb);
                } catch (Exception e) {
                    e.printStackTrace();
                }
            } else {
                List<Hkb> hkbList = new ArrayList<>();
                for(int i = 1; i <= month; i++) {
                    Hkb hkb = new Hkb();
                    try {
                        //拷贝uid,cpname,rname,bzname字段的值
                        BeanCopyUtils.copy(hkb, bAD);
                        hkb.setStatus(HKStatusEnum.UNREPAY.getCode());
                        hkb.setHuid(huid);
                        hkb.setTnum(month);
                        calendar.add(Calendar.MONTH, 1);
                        hkb.setYtime(calendar.getTime());
                        //每月利息金额
                        BigDecimal bigMonthNpro = BigDecimal.valueOf(monthNpro/100);
                        //先息后本还款表
                        System.out.println(bAD.getWay().equals(1));
                        if(bAD.getWay().equals(WayEnum.XIAN_XI.getCode())) {
                            //每月利息等于总借款乘以月利率
                            hkb.setYlx(bAD.getMoney().multiply(bigMonthNpro));
                            hkb.setYbj(BigDecimal.valueOf(0));
                            //最后一个月还本金加利息
                            if(i == month) {
                                //应还本金
                                hkb.setYbj(bAD.getMoney());
                            }
                        }
                        // 等额本金还款算法
                        else if(bAD.getWay().equals(WayEnum.EQUAL_BJ.getCode())) {
                            LoanByMonth loanByMonth = new ACMLoanCalculator().calLoan(bAD.getMoney(), month, yearNpro, LoanUtil.RATE_TYPE_YEAR)
                                    .getAllLoans().get(i-1);
                            // 月还本金
                            hkb.setYbj(loanByMonth.getPayPrincipal());
                            // 月利息
                            hkb.setYlx(loanByMonth.getInterest());

                        }
                        // 等额本息还款算法
                        else if(bAD.getWay().equals(WayEnum.EQUAL_BX.getCode())) {
                            LoanByMonth loanByMonth = new ACPIMLoanCalculator().calLoan(bAD.getMoney(), month, yearNpro, LoanUtil.RATE_TYPE_YEAR)
                                    .getAllLoans().get(i-1);
                            //每月利息
                            hkb.setYlx(loanByMonth.getInterest());
                            //每月还款本金
                            hkb.setYbj(loanByMonth.getPayPrincipal());
                        }
                        hkb.setYbx(hkb.getYlx().add(hkb.getYbj()));
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                    hkb.setBaid(tzb.getBaid());
                    hkbList.add(hkb);
                }
                //批量保存
                hkbMapper.saveList(hkbList);
            }
        }
        userMoneyMapper.updateByPrimaryKeySelective(juserMoney);
        //修改借款详情里的已筹金额
        borrowDetail.setBaid(tzb.getBaid());
        borrowDetail.setMoney(bAD.getMoneyCount().add(tzb.getMoney()));
        borrowDetailMapper.updateByPrimaryKeySelective(borrowDetail);
        return ServerResponse.createBySuccess("投资成功");
    }

    /**
     * 计算用户投资利息
     * @param way 计息方式
     * @param tzMoney 投资金额
     * @param month 回款月数
     * @param yearNpro 年利率
     * @return 利息
     */
    public static BigDecimal getSyMoney(String way, BigDecimal tzMoney, Integer month, Float yearNpro) {
        //一次还清和先息后本的用户收益计息方式
        if(way.equals(WayEnum.PAYOFF_ONCE.getCode())|| way.equals(WayEnum.XIAN_XI.getCode())) {
            //投资金额乘以年利率
            return tzMoney.multiply(BigDecimal.valueOf(yearNpro/100))
                    .setScale(2, BigDecimal.ROUND_HALF_UP);
        }
        // 等额本金的用户收益计息
        if(way.equals(WayEnum.EQUAL_BJ.getCode())) {
            return new ACMLoanCalculator().calLoan(tzMoney, month, yearNpro, LoanUtil.RATE_TYPE_YEAR).getTotalInterest();
        }
        //等额本息的用户收益计息
        if(way.equals(WayEnum.EQUAL_BX.getCode())) {
            return new ACPIMLoanCalculator().calLoan(tzMoney, month,yearNpro,LoanUtil.RATE_TYPE_YEAR).getTotalInterest();
        }
        return BigDecimal.valueOf(0);
    }


    @Override
    public List<Tzb> getByBaid(Integer baid) {
        return tzbMapper.getByBaid(baid);
    }

    @Autowired
    public void setUserMapper(UserMapper userMapper) {
        this.userMapper = userMapper;
    }

    @Override
    public Pager listPagerByBaid(Integer pageNumber, Integer pageSize, Integer baid,Integer uid) {
        Pager pager = new Pager(pageNumber, pageSize);
        pager.setRows(tzbMapper.listPagerByBaid(pager,baid,uid));
        pager.setTotal(tzbMapper.countByBaid(baid,uid));
        return pager;
    }

    @Override
    public List<TzCountVO> getTotalTzMoney(Integer baid) {
        return tzbMapper.getTotalTzMoney(baid);
    }

    @Override
    public Pager listInvestByUid(int pageNo, int pageSize, int uid) {
        Pager pager = new Pager(pageNo, pageSize);
        pager.setRows(tzbMapper.listInvestByUid(pager, uid));
        pager.setTotal(tzbMapper.countByUid(uid));
        return pager;
    }

    @Autowired
    public void setTzbMapper(TzbMapper tzbMapper) {
        super.setBaseMapper(tzbMapper);
        this.tzbMapper = tzbMapper;
    }

    @Autowired
    public void setBorrowApplyMapper(BorrowapplyMapper borrowApplyMapper) {
        this.borrowApplyMapper = borrowApplyMapper;
    }

    @Autowired
    public void setBorrowDetailMapper(BorrowdetailMapper borrowDetailMapper) {
        this.borrowDetailMapper = borrowDetailMapper;
    }

    @Autowired
    public void setUserMoneyMapper(UsermoneyMapper userMoneyMapper) {
        this.userMoneyMapper = userMoneyMapper;
    }

    @Autowired
    public void setRewardMapper(RewardMapper rewardMapper) {
        this.rewardMapper = rewardMapper;
    }

    @Autowired
    public void setRewardSettingMapper(RewardSettingMapper rewardSettingMapper) {
        this.rewardSettingMapper = rewardSettingMapper;
    }

    @Autowired
    public void setHkbMapper(HkbMapper hkbMapper) {
        this.hkbMapper = hkbMapper;
    }

    @Autowired
    public void setShborrowMapper(ShborrowMapper shborrowMapper) {
        this.shborrowMapper = shborrowMapper;
    }

    @Autowired
    public void setUserTicketMapper(UserTicketMapper userTicketMapper) {
        this.userTicketMapper = userTicketMapper;
    }

    @Autowired
    public void setTicketMapper(TicketMapper ticketMapper) {
        this.ticketMapper = ticketMapper;
    }
}
