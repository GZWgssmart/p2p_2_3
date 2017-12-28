package com.animo.service.impl;

import com.animo.dao.RewardMapper;
import com.animo.service.RewardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by Animo on 2017-12-28.
 */
@Service
public class RewardSettingServiceImpl extends AbstractServiceImpl implements RewardService{


    private RewardMapper rewardMapper;

    @Autowired
    public void setRewardMapper(RewardMapper rewardMapper) {
        super.setBaseMapper(rewardMapper);
        this.rewardMapper = rewardMapper;
    }
}
