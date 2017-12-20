package com.animo.dao;

import com.animo.pojo.Rolejur;

public interface RolejurMapper {
    int deleteByPrimaryKey(Integer rjid);

    int insert(Rolejur record);

    int insertSelective(Rolejur record);

    Rolejur selectByPrimaryKey(Integer rjid);

    int updateByPrimaryKeySelective(Rolejur record);

    int updateByPrimaryKey(Rolejur record);
}