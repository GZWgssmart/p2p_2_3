package com.animo.dao;

import com.animo.pojo.Tzb;

public interface TzbMapper {
    int deleteByPrimaryKey(Integer tzid);

    int insert(Tzb record);

    int insertSelective(Tzb record);

    Tzb selectByPrimaryKey(Integer tzid);

    int updateByPrimaryKeySelective(Tzb record);

    int updateByPrimaryKey(Tzb record);
}