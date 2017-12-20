package com.animo.dao;

import com.animo.pojo.TxCkeck;

public interface TxCkeckMapper {
    int deleteByPrimaryKey(Integer tcid);

    int insert(TxCkeck record);

    int insertSelective(TxCkeck record);

    TxCkeck selectByPrimaryKey(Integer tcid);

    int updateByPrimaryKeySelective(TxCkeck record);

    int updateByPrimaryKey(TxCkeck record);
}