package com.animo.dao;

import com.animo.pojo.Ydata;

public interface YdataMapper {
    int deleteByPrimaryKey(Integer yid);

    int insert(Ydata record);

    int insertSelective(Ydata record);

    Ydata selectByPrimaryKey(Integer yid);

    int updateByPrimaryKeySelective(Ydata record);

    int updateByPrimaryKey(Ydata record);
}