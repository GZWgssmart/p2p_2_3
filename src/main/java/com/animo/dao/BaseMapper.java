package com.animo.dao;

import com.animo.common.Pager;
import com.animo.pojo.Bankcard;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by Animo on 2017-12-22.
 */
@Repository
public interface BaseMapper {

    int deleteByPrimaryKey(Integer id);

    int insert(Object object);

    int insertSelective(Object object);

    Object selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Object object);

    int updateByPrimaryKey(Object object);

    List<Object> listPager(Pager pager);

    Long count();

    int updateStatus(Integer id,Integer status);

}
