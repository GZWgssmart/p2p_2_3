package com.animo.job;

import com.animo.enums.BorrowStatusEnum;
import com.animo.pojo.Reward;
import com.animo.pojo.Usermoney;
import com.animo.service.*;
import com.animo.utils.RateUtils;
import com.animo.vo.BorrowApplyDetail;
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

    private Integer ckstatus=2;


    /**
     * 投资表 需要加状态
     */
    public void execute() {
        //查询所有在投标中的借款
        List<BorrowApplyDetail> list = borrowapplyService.getByCkstaus(ckstatus);
        for (BorrowApplyDetail borrowapply : list) {
            if (borrowapply.getDeadline().compareTo(Calendar.getInstance().getTime()) == -1) {
                //更新借款状态为已流标
                borrowapplyService.updateTime(borrowapply.getBaid(), BorrowStatusEnum.BORROW_FAIL.getCode(), borrowapply.getCktime());
                BigDecimal zmoney = null;
                List<TzCountVO> tzCountVOList = tzbService.getTotalTzMoney(borrowapply.getBaid());
                for (TzCountVO tzCountVO : tzCountVOList) {
                    BigDecimal syMoney = RateUtils.getSyMoney(borrowapply.getWay(), tzCountVO.getTotalMoney(), borrowapply.getTerm(), borrowapply.getNprofit());
                    Usermoney userMoney1 = (Usermoney) userMoneyService.selectByUid(tzCountVO.getUid()).getData();
                    Double percent = rewardSettingService.selectpercent(userMoney1.getTzmoney());
                    userMoney1.setTzmoney(userMoney1.getTzmoney().subtract(tzCountVO.getTotalMoney()));
                    userMoney1.setDsmoney(userMoney1.getDsmoney().subtract(syMoney.add(tzCountVO.getTotalMoney())));
                    userMoney1.setKymoney(userMoney1.getKymoney().add(tzCountVO.getTotalMoney()));
                    userMoney1.setZmoney(userMoney1.getZmoney().subtract(syMoney));
                    userMoney1.setSymoney(userMoney1.getSymoney().subtract(syMoney));
                    userMoneyService.update(userMoney1);
                    // 减去投资奖励
                    Reward reward = rewardService.selectByUid(tzCountVO.getUid());
                    reward.setTmoney(reward.getTmoney().subtract(tzCountVO.getTotalMoney()));
                    BigDecimal rewardMoney = reward.getTmoney().multiply(BigDecimal.valueOf(percent / 100))
                            .setScale(2, BigDecimal.ROUND_HALF_UP);
                    reward.setMoney(rewardMoney);
                    rewardService.update(reward);
                }
                Usermoney juserMoney = (Usermoney) userMoneyService.selectByUid(borrowapply.getUid()).getData();
                juserMoney.setDjmoney(juserMoney.getDjmoney().subtract(zmoney));
                juserMoney.setZmoney(juserMoney.getZmoney().subtract(zmoney));
                userMoneyService.update(juserMoney);
            }
        }

    }
}
