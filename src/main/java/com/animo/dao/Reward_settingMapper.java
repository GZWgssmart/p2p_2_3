package com.animo.dao;

import com.animo.pojo.Reward_setting;

public interface Reward_settingMapper {
    int deleteByPrimaryKey(Integer rwsid);

    int insert(Reward_setting record);

    int insertSelective(Reward_setting record);

    Reward_setting selectByPrimaryKey(Integer rwsid);

    int updateByPrimaryKeySelective(Reward_setting record);

    int updateByPrimaryKey(Reward_setting record);
}