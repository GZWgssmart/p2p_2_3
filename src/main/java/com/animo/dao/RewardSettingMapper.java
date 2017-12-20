package com.animo.dao;

import com.animo.pojo.RewardSetting;

public interface RewardSettingMapper {
    int deleteByPrimaryKey(Integer rwsid);

    int insert(RewardSetting record);

    int insertSelective(RewardSetting record);

    RewardSetting selectByPrimaryKey(Integer rwsid);

    int updateByPrimaryKeySelective(RewardSetting record);

    int updateByPrimaryKey(RewardSetting record);
}