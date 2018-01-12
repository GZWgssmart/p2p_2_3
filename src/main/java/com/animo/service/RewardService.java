package com.animo.service;

import com.animo.pojo.Reward;

import java.util.List;

/**
 * Created by Animo on 2017-12-28.
 */
public interface RewardService extends BaseService{

    List<Reward> selectByStatus(String status);

    Reward selectByUid(Integer uid);

}
