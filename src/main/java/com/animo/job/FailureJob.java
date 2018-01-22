package com.animo.job;

import com.animo.enums.BorrowStatusEnum;
import com.animo.pojo.Reward;
import com.animo.pojo.Usermoney;
import com.animo.service.*;
import com.animo.service.impl.TzbServiceImpl;
import com.animo.utils.RateUtils;
import com.animo.vo.BorrowApplyDetail;
import com.animo.vo.BorrowingVO;
import com.animo.vo.TzCountVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.math.BigDecimal;
import java.util.Calendar;
import java.util.List;

/**
 * Created by Animo on 2018-01-11.
 * 流标定时任务
 */
@Component(value = "FailureJob")
public class FailureJob {

    @Autowired
    private BorrowapplyService  borrowapplyService;

    @Autowired
    private TzbService tzbService;

    @Autowired
    private UserMoneyService userMoneyService;

    @Autowired
    private RewardSettingService rewardSettingService;

    @Autowired
    private RewardService rewardService;


    /**
     * 投资表 需要加状态
     */
    public void execute() {
        // 查出所有投标中的标
        List<BorrowingVO> borrowingVOS = borrowapplyService.borrowingList();
        BigDecimal syMoney = BigDecimal.valueOf(0);
        if(borrowingVOS != null && borrowingVOS.size() > 0) {
            for(BorrowingVO borrowingVO : borrowingVOS) {
                // 如果标的截止时间小于当前时间，则流标
                if(borrowingVO.getDeadline().compareTo(Calendar.getInstance().getTime()) == -1) {
                    //更新借款状态为已流标
                    borrowapplyService.updateStatus(borrowingVO.getBaid(), BorrowStatusEnum.BORROW_FAIL.getCode());
                    // 将借款人的冻结金额减去已筹金额，总资产减去已筹金额
                    Usermoney juserMoney = (Usermoney) userMoneyService.selectByUid(borrowingVO.getJuid()).getData();
                    juserMoney.setDjmoney(juserMoney.getDjmoney().subtract(borrowingVO.getMoneyCount()));
                    juserMoney.setZmoney(juserMoney.getZmoney().subtract(borrowingVO.getMoneyCount()));
                    userMoneyService.update(juserMoney);
                    // 将原先所有投资人的投资金额减去投资金额，待收总额减去收益，可用余额增加投资金额，总资产减利息，收益总额减去利息
                    List<TzCountVO> tzCounts = tzbService.getTotalTzMoney(borrowingVO.getBaid());
                    if(tzCounts != null && tzCounts.size() > 0) {
                        for(TzCountVO tzCount : tzCounts) {
                            // 算出投资利息
                            syMoney = TzbServiceImpl.getSyMoney(borrowingVO.getWay(), tzCount.getTotalMoney(), borrowingVO.getTerm(), borrowingVO.getNprofit());
                            Usermoney userMoney1 = (Usermoney) userMoneyService.selectByUid(tzCount.getUid()).getData();
                            // 获取投资总额对应的投资奖励额度
                            Double percent = rewardSettingService.selectpercent(userMoney1.getTzmoney());
                            userMoney1.setTzmoney(userMoney1.getTzmoney().subtract(tzCount.getTotalMoney()));
                            userMoney1.setDsmoney(userMoney1.getDsmoney().subtract(syMoney.add(tzCount.getTotalMoney())));
                            userMoney1.setKymoney(userMoney1.getKymoney().add(tzCount.getTotalMoney()));
                            userMoney1.setZmoney(userMoney1.getZmoney().subtract(syMoney));
                            userMoney1.setSymoney(userMoney1.getSymoney().subtract(syMoney));
                            userMoneyService.update(userMoney1);
                            // 减去投资奖励
                            Reward reward = rewardService.selectByUid(tzCount.getUid());
                            reward.setTmoney(reward.getTmoney().subtract(tzCount.getTotalMoney()));
                            // 重新计算投资奖励
                            BigDecimal rewardMoney = reward.getTmoney().multiply(BigDecimal.valueOf(percent / 100))
                                    .setScale(2, BigDecimal.ROUND_HALF_UP);
                            reward.setMoney(rewardMoney);
                            rewardService.update(reward);
                        }
                    }
                }
            }
        }
        System.out.println("流标任务");
    }
}
