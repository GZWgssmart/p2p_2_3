package com.animo.dao;

import com.animo.pojo.Jur;

public interface JurMapper {
    int deleteByPrimaryKey(Integer jid);

    int insert(Jur record);

    int insertSelective(Jur record);

    Jur selectByPrimaryKey(Integer jid);

    int updateByPrimaryKeySelective(Jur record);

    int updateByPrimaryKey(Jur record);
}