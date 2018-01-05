package com.animo.dao;

import com.animo.common.Pager;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface LogMoneyMapper extends BaseMapper{
    List<Object> listPagerCriteria(@Param("pager") Pager pager, @Param("query") Object obj);

    Long countCriteria(@Param("query") Object obj);
}