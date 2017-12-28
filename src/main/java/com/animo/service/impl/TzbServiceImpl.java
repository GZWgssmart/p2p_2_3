package com.animo.service.impl;

import com.animo.common.ServerResponse;
import com.animo.dao.RewardMapper;
import com.animo.dao.RewardSettingMapper;
import com.animo.dao.TzbMapper;
import com.animo.dao.UsermoneyMapper;
import com.animo.pojo.Reward;
import com.animo.pojo.Tzb;
import com.animo.pojo.User;
import com.animo.pojo.Usermoney;
import com.animo.service.RewardService;
import com.animo.service.TzbService;
import com.animo.service.UserMoneyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;

/**
 * Created by Animo on 2017-12-25.
 */
@Service
public class TzbServiceImpl extends AbstractServiceImpl implements TzbService{

    private TzbMapper tzbMapper;


    private UsermoneyMapper usermoneyMapper;


    private RewardMapper rewardMapper;

    private ServerResponse serverResponse;

    private RewardSettingMapper rewardSettingMapper;


    @Autowired
    public void setTzbMapper(TzbMapper tzbMapper) {
        super.setBaseMapper(tzbMapper);
        this.tzbMapper = tzbMapper;
    }

    @Override
    public ServerResponse save(Object object) {
        Tzb tzb = (Tzb) object;
        Integer userId= tzb.getUid();
        Usermoney usermoney =(Usermoney)usermoneyMapper.selectByPrimaryKey(userId);
        //用户可用金额
        BigDecimal kymoney = usermoney.getKymoney();
        //用户投资金额
        BigDecimal money = tzb.getMoney();
        if(kymoney.compareTo(money)==-1){
            return ServerResponse.createByError("可用余额不足");
        }
        usermoney.setZmoney(kymoney.subtract(money));
        usermoney.setKymoney(usermoney.getKymoney().subtract(money));
        usermoneyMapper.updateByPrimaryKeySelective(usermoney);
        Object object1 =rewardMapper.selectByPrimaryKey(userId);
        if(object1==null){
            Reward reward  = new Reward();
            reward.setUid(userId);
            //奖励金额
            reward.setMoney(new BigDecimal(0));
            //投资金额
            reward.setTmoney(new BigDecimal(0));
            rewardMapper.insertSelective(reward);
        }
        //查询用户投资奖励表
        Reward reward  = (Reward) rewardMapper.selectByPrimaryKey(userId);
        //查询
        Double percent = rewardSettingMapper.selectpercent(reward.getTmoney().add(money));
        reward.setMoney(reward.getMoney().multiply(BigDecimal.valueOf(percent)));
        Integer integer = rewardMapper.updateByPrimaryKeySelective(reward);
        if(integer==0){
            return ServerResponse.createByError("服务器出错");
        }
        return ServerResponse.createBySuccess("投资成功");
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
}
