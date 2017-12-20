package com.animo.dao;

import com.animo.pojo.Huser;

public interface HuserMapper {
    int deleteByPrimaryKey(Integer huid);

    int insert(Huser record);

    int insertSelective(Huser record);

    Huser selectByPrimaryKey(Integer huid);

    int updateByPrimaryKeySelective(Huser record);

    int updateByPrimaryKey(Huser record);
}