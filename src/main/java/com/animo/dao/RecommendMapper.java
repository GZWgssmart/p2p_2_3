package com.animo.dao;

import com.animo.pojo.Recommend;

public interface RecommendMapper {
    int deleteByPrimaryKey(Integer rmid);

    int insert(Recommend record);

    int insertSelective(Recommend record);

    Recommend selectByPrimaryKey(Integer rmid);

    int updateByPrimaryKeySelective(Recommend record);

    int updateByPrimaryKey(Recommend record);
}