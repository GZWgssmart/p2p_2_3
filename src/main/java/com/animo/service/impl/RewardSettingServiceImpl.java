package com.animo.service.impl;

import com.animo.dao.RewardMapper;
import com.animo.dao.RewardSettingMapper;
import com.animo.service.RewardService;
import com.animo.service.RewardSettingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;

/**
 * Created by Animo on 2017-12-28.
 */
@Service
public class RewardSettingServiceImpl extends AbstractServiceImpl implements RewardSettingService{


   private RewardSettingMapper rewardSettingMapper;

   @Autowired
    public void setRewardSettingMapper(RewardSettingMapper rewardSettingMapper) {
        super.setBaseMapper(rewardSettingMapper);
        this.rewardSettingMapper = rewardSettingMapper;
    }

    @Override
    public Double selectpercent(BigDecimal money) {
        return rewardSettingMapper.selectpercent(money);
    }
}
