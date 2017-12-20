package com.animo.dao;

import com.animo.pojo.T_user;

public interface T_userMapper {
    int deleteByPrimaryKey(Integer uid);

    int insert(T_user record);

    int insertSelective(T_user record);

    T_user selectByPrimaryKey(Integer uid);

    int updateByPrimaryKeySelective(T_user record);

    int updateByPrimaryKey(T_user record);
}