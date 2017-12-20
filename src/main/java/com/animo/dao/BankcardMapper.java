package com.animo.dao;

import com.animo.pojo.Bankcard;

public interface BankcardMapper {
    int deleteByPrimaryKey(Integer bcid);

    int insert(Bankcard record);

    int insertSelective(Bankcard record);

    Bankcard selectByPrimaryKey(Integer bcid);

    int updateByPrimaryKeySelective(Bankcard record);

    int updateByPrimaryKey(Bankcard record);
}