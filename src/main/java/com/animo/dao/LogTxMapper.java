package com.animo.dao;

import com.animo.pojo.LogTx;

public interface LogTxMapper {
    int deleteByPrimaryKey(Integer txid);

    int insert(LogTx record);

    int insertSelective(LogTx record);

    LogTx selectByPrimaryKey(Integer txid);

    int updateByPrimaryKeySelective(LogTx record);

    int updateByPrimaryKey(LogTx record);
}