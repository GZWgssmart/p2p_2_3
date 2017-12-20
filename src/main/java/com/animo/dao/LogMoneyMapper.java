package com.animo.dao;

import com.animo.pojo.LogMoney;

public interface LogMoneyMapper {
    int deleteByPrimaryKey(Integer lmid);

    int insert(LogMoney record);

    int insertSelective(LogMoney record);

    LogMoney selectByPrimaryKey(Integer lmid);

    int updateByPrimaryKeySelective(LogMoney record);

    int updateByPrimaryKey(LogMoney record);
}