package com.animo.dao;

import com.animo.pojo.Media;

public interface MediaMapper {
    int deleteByPrimaryKey(Integer mid);

    int insert(Media record);

    int insertSelective(Media record);

    Media selectByPrimaryKey(Integer mid);

    int updateByPrimaryKeySelective(Media record);

    int updateByPrimaryKey(Media record);
}