package com.animo.dao;

import com.animo.pojo.Log_cz;

public interface Log_czMapper {
    int deleteByPrimaryKey(Integer czid);

    int insert(Log_cz record);

    int insertSelective(Log_cz record);

    Log_cz selectByPrimaryKey(Integer czid);

    int updateByPrimaryKeySelective(Log_cz record);

    int updateByPrimaryKey(Log_cz record);
}