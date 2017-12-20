package com.animo.dao;

import com.animo.pojo.Reward;

public interface RewardMapper {
    int deleteByPrimaryKey(Integer rwid);

    int insert(Reward record);

    int insertSelective(Reward record);

    Reward selectByPrimaryKey(Integer rwid);

    int updateByPrimaryKeySelective(Reward record);

    int updateByPrimaryKey(Reward record);
}