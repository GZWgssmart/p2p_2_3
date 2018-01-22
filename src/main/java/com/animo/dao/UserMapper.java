package com.animo.dao;

import com.animo.common.Pager;
import com.animo.pojo.User;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserMapper extends BaseMapper{

    User getByTzm(Integer tzm);
    int getByPhone(String phone);
    User getByPhonePwd(@Param("phone") String phone, @Param("upwd") String upwd);


    List<Object> listPagerCriteria(@Param("pager") Pager pager,@Param("resstr2") String resstr2);

    Long countCriteria(@Param("resstr2") String resstr2);

    int getByEmail(String email);

}