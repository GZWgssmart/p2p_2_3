package com.animo.service.impl;

import com.animo.dao.RewardMapper;
import com.animo.pojo.Reward;
import com.animo.service.RewardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Animo on 2017-12-28.
 */
@Service
public class RewardServiceImpl extends AbstractServiceImpl implements RewardService{


    private RewardMapper rewardMapper;

    @Autowired
    public void setRewardMapper(RewardMapper rewardMapper) {
        super.setBaseMapper(rewardMapper);
        this.rewardMapper = rewardMapper;
    }

    @Override
    public List<Reward> selectByStatus(String status) {
        return rewardMapper.selectByStatus(status);
    }

    @Override
    public Reward selectByUid(Integer uid) {
        return rewardMapper.selectByUid(uid);
    }
}
