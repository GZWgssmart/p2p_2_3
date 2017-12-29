package com.animo.service.impl;

import com.animo.common.Pager;
import com.animo.common.ServerResponse;
import com.animo.dao.*;
import com.animo.pojo.*;
import com.animo.service.RewardService;
import com.animo.service.TzbService;
import com.animo.service.UserMoneyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;

/**
 * Created by Animo on 2017-12-25.
 */
@Service
public class TzbServiceImpl extends AbstractServiceImpl implements TzbService{

    private TzbMapper tzbMapper;


    private UsermoneyMapper usermoneyMapper;


    private RewardMapper rewardMapper;


    private RewardSettingMapper rewardSettingMapper;


    private BorrowdetailMapper borrowdetailMapper;

    @Override
    @Transactional
    public ServerResponse save(Object object) {
        Tzb tzb = (Tzb) object;
        //用户id
        Integer userId= tzb.getUid();
        //获取用户全部资金
        Usermoney usermoney =(Usermoney)usermoneyMapper.selectByPrimaryKey(userId);
        //用户可用金额
        BigDecimal kymoney = usermoney.getKymoney();
        //用户投资金额
        BigDecimal money = tzb.getMoney();
        //如果投资金额大于可用余额 提示可用余额不足
        if(kymoney.compareTo(money)==-1){
            return ServerResponse.createByError("可用余额不足");
        }
        //总金额减去投出去的钱
        usermoney.setZmoney(usermoney.getZmoney().subtract(money));
        //可用余额减去投出去的钱
        usermoney.setKymoney(kymoney.subtract(money));
        //更新用户资金表
        usermoneyMapper.updateByPrimaryKeySelective(usermoney);
        //根据用户id去查询用户投资奖励表
        Object object1 =rewardMapper.selectByUid(userId);
        //如果查询结果等于空就保存  则更新
        if(object1==null){
            Reward reward  = new Reward();
            reward.setUid(userId);
            //奖励金额
            Double percent = rewardSettingMapper.selectpercent(money);
            reward.setMoney(money.multiply(BigDecimal.valueOf(percent)));
            //投资金额
            reward.setTmoney(money);
            rewardMapper.insertSelective(reward);
            tzbMapper.insertSelective(tzb);
            borrowdetailMapper.updateMoney(borrowdetailMapper.selectMoney(tzb.getBaid()).add(money),tzb.getBaid());
            return ServerResponse.createBySuccess("投资成功");
        }
        //查询用户投资奖励表
        Reward reward  = (Reward) rewardMapper.selectByUid(userId);
        BigDecimal ztzmoney = reward.getTmoney().add(money);
        //查询用户总投资的奖励比例 原始金额加上当前投资金额
        Double percent = rewardSettingMapper.selectpercent(ztzmoney);
        //重新设置当前用户总投资额的奖励
        reward.setMoney(ztzmoney.multiply(BigDecimal.valueOf(percent)));
        //设置当前用户总投资额度
        reward.setTmoney(ztzmoney);
        //更新用户投资奖励表
        rewardMapper.updateByPrimaryKeySelective(reward);
        //添加用户投资表
        Integer integer = tzbMapper.insertSelective(tzb);
        if(integer==0){
            return ServerResponse.createByError("服务器出错");
        }
        borrowdetailMapper.updateMoney(borrowdetailMapper.selectMoney(tzb.getBaid()).add(money),tzb.getBaid());
        return ServerResponse.createBySuccess("投资成功");
    }

    @Override
    public Pager listPagerByBaid(Integer pageNumber, Integer pageSize, Integer baid) {
        Pager pager = new Pager(pageNumber, pageSize);
        pager.setRows(tzbMapper.listPagerByBaid(pager,baid));
        pager.setTotal(tzbMapper.countByBaid(baid));
        return pager;
    }

    @Autowired
    public void setTzbMapper(TzbMapper tzbMapper) {
        super.setBaseMapper(tzbMapper);
        this.tzbMapper = tzbMapper;
    }

    @Autowired
    public void setUsermoneyMapper(UsermoneyMapper usermoneyMapper) {
        this.usermoneyMapper = usermoneyMapper;
    }

    @Autowired
    public void setRewardMapper(com.animo.dao.RewardMapper rewardMapper) {
        this.rewardMapper = rewardMapper;
    }

    @Autowired
    public void setRewardSettingMapper(RewardSettingMapper rewardSettingMapper) {
        this.rewardSettingMapper = rewardSettingMapper;
    }

    @Autowired
    public void setBorrowdetailMapper(BorrowdetailMapper borrowdetailMapper) {
        this.borrowdetailMapper = borrowdetailMapper;
    }
}
