package com.animo.dao;

import com.animo.pojo.RzCheck;

public interface RzCheckMapper {
    int deleteByPrimaryKey(Integer rcid);

    int insert(RzCheck record);

    int insertSelective(RzCheck record);

    RzCheck selectByPrimaryKey(Integer rcid);

    int updateByPrimaryKeySelective(RzCheck record);

    int updateByPrimaryKey(RzCheck record);
}