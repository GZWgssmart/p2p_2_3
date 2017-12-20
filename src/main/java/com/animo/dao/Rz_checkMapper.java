package com.animo.dao;

import com.animo.pojo.Rz_check;

public interface Rz_checkMapper {
    int deleteByPrimaryKey(Integer rcid);

    int insert(Rz_check record);

    int insertSelective(Rz_check record);

    Rz_check selectByPrimaryKey(Integer rcid);

    int updateByPrimaryKeySelective(Rz_check record);

    int updateByPrimaryKey(Rz_check record);
}