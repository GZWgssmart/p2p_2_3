package com.animo.dao;

import com.animo.pojo.Shborrow;

public interface ShborrowMapper {
    int deleteByPrimaryKey(Integer shid);

    int insert(Shborrow record);

    int insertSelective(Shborrow record);

    Shborrow selectByPrimaryKey(Integer shid);

    int updateByPrimaryKeySelective(Shborrow record);

    int updateByPrimaryKey(Shborrow record);
}