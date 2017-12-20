package com.animo.dao;

import com.animo.pojo.Dynamic;

public interface DynamicMapper {
    int deleteByPrimaryKey(Integer dyid);

    int insert(Dynamic record);

    int insertSelective(Dynamic record);

    Dynamic selectByPrimaryKey(Integer dyid);

    int updateByPrimaryKeySelective(Dynamic record);

    int updateByPrimaryKey(Dynamic record);
}