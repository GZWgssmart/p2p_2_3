package com.animo.dao;

import com.animo.pojo.Bankcard;

/**
 * Created by Animo on 2017-12-22.
 */
public interface BaseMapper {

    int deleteByPrimaryKey(Integer id);

    int insert(Object object);

    int insertSelective(Object object);

    Bankcard selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Object object);

    int updateByPrimaryKey(Object object);

}
