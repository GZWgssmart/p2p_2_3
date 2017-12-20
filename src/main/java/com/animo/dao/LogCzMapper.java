package com.animo.dao;

import com.animo.pojo.LogCz;

public interface LogCzMapper {
    int deleteByPrimaryKey(Integer czid);

    int insert(LogCz record);

    int insertSelective(LogCz record);

    LogCz selectByPrimaryKey(Integer czid);

    int updateByPrimaryKeySelective(LogCz record);

    int updateByPrimaryKey(LogCz record);
}