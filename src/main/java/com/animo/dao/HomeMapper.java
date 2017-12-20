package com.animo.dao;

import com.animo.pojo.Home;

public interface HomeMapper {
    int deleteByPrimaryKey(Integer hid);

    int insert(Home record);

    int insertSelective(Home record);

    Home selectByPrimaryKey(Integer hid);

    int updateByPrimaryKeySelective(Home record);

    int updateByPrimaryKey(Home record);
}