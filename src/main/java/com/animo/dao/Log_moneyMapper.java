package com.animo.dao;

import com.animo.pojo.Log_money;

public interface Log_moneyMapper {
    int deleteByPrimaryKey(Integer lmid);

    int insert(Log_money record);

    int insertSelective(Log_money record);

    Log_money selectByPrimaryKey(Integer lmid);

    int updateByPrimaryKeySelective(Log_money record);

    int updateByPrimaryKey(Log_money record);
}