package com.animo.dao;

import com.animo.pojo.Rzvip;

public interface RzvipMapper {
    int deleteByPrimaryKey(Integer rzid);

    int insert(Rzvip record);

    int insertSelective(Rzvip record);

    Rzvip selectByPrimaryKey(Integer rzid);

    int updateByPrimaryKeySelective(Rzvip record);

    int updateByPrimaryKey(Rzvip record);
}