package com.animo.dao;

import com.animo.pojo.Bz;

public interface BzMapper {
    int deleteByPrimaryKey(Integer bzid);

    int insert(Bz record);

    int insertSelective(Bz record);

    Bz selectByPrimaryKey(Integer bzid);

    int updateByPrimaryKeySelective(Bz record);

    int updateByPrimaryKey(Bz record);
}