package com.animo.dao;

import com.animo.pojo.Log_tx;

public interface Log_txMapper {
    int deleteByPrimaryKey(Integer txid);

    int insert(Log_tx record);

    int insertSelective(Log_tx record);

    Log_tx selectByPrimaryKey(Integer txid);

    int updateByPrimaryKeySelective(Log_tx record);

    int updateByPrimaryKey(Log_tx record);
}