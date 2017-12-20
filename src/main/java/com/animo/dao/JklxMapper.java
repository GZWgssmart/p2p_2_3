package com.animo.dao;

import com.animo.pojo.Jklx;

public interface JklxMapper {
    int deleteByPrimaryKey(Integer lxid);

    int insert(Jklx record);

    int insertSelective(Jklx record);

    Jklx selectByPrimaryKey(Integer lxid);

    int updateByPrimaryKeySelective(Jklx record);

    int updateByPrimaryKey(Jklx record);
}