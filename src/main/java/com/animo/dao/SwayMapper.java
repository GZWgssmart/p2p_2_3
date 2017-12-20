package com.animo.dao;

import com.animo.pojo.Sway;

public interface SwayMapper {
    int deleteByPrimaryKey(Integer sid);

    int insert(Sway record);

    int insertSelective(Sway record);

    Sway selectByPrimaryKey(Integer sid);

    int updateByPrimaryKeySelective(Sway record);

    int updateByPrimaryKey(Sway record);
}