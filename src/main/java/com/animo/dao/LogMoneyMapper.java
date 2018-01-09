package com.animo.dao;

import com.animo.common.Pager;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface LogMoneyMapper extends BaseMapper {
    List<Object> listPagerByTypeAndUid(@Param("pager") Pager pager, @Param("type") Integer type, @Param("uid") Integer uid);

    Long countByTypeAndUid(@Param("type") Integer type, @Param("uid") Integer uid);
}