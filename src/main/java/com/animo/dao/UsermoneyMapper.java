package com.animo.dao;

import com.animo.pojo.Usermoney;

public interface UsermoneyMapper {
    int deleteByPrimaryKey(Integer umid);

    int insert(Usermoney record);

    int insertSelective(Usermoney record);

    Usermoney selectByPrimaryKey(Integer umid);

    int updateByPrimaryKeySelective(Usermoney record);

    int updateByPrimaryKey(Usermoney record);
}