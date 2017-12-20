package com.animo.dao;

import com.animo.pojo.Tx_ckeck;

public interface Tx_ckeckMapper {
    int deleteByPrimaryKey(Integer tcid);

    int insert(Tx_ckeck record);

    int insertSelective(Tx_ckeck record);

    Tx_ckeck selectByPrimaryKey(Integer tcid);

    int updateByPrimaryKeySelective(Tx_ckeck record);

    int updateByPrimaryKey(Tx_ckeck record);
}