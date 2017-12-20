package com.animo.dao;

import com.animo.pojo.Option;

public interface OptionMapper {
    int deleteByPrimaryKey(Integer opid);

    int insert(Option record);

    int insertSelective(Option record);

    Option selectByPrimaryKey(Integer opid);

    int updateByPrimaryKeySelective(Option record);

    int updateByPrimaryKey(Option record);
}