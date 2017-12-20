package com.animo.dao;

import com.animo.pojo.Letter;

public interface LetterMapper {
    int deleteByPrimaryKey(Integer lid);

    int insert(Letter record);

    int insertSelective(Letter record);

    Letter selectByPrimaryKey(Integer lid);

    int updateByPrimaryKeySelective(Letter record);

    int updateByPrimaryKey(Letter record);
}