package com.animo.dao;

import com.animo.pojo.Bankcard;
import org.springframework.stereotype.Repository;

/**
 * Created by Animo on 2017-12-21.
 */
@Repository
public interface BaseMapper {

    int deleteByPrimaryKey(Integer id);

    int insert(Object object);

    int insertSelective(Object object);

    Bankcard selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Object object);

    int updateByPrimaryKey(Object object);

}
