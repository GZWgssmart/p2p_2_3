package com.animo.dao;

import com.animo.pojo.Roleuser;

public interface RoleuserMapper {
    int deleteByPrimaryKey(Integer ruid);

    int insert(Roleuser record);

    int insertSelective(Roleuser record);

    Roleuser selectByPrimaryKey(Integer ruid);

    int updateByPrimaryKeySelective(Roleuser record);

    int updateByPrimaryKey(Roleuser record);
}