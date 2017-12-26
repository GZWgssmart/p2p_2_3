package com.animo.dao;

import com.animo.pojo.User;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface UserMapper extends BaseMapper{

    User getByTzm(Integer tzm);
    int saveUser(@Param("phone") String phone, @Param("upwd") String upwd);
    int getByPhone(String phone);
    User getByPhonePwd(@Param("phone") String phone, @Param("upwd") String upwd);

}