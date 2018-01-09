package com.animo.dao;

import com.animo.common.Pager;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface LogCzMapper extends BaseMapper {

    List<Object> listPagerByUid(@Param("pager") Pager pager, @Param("uid") Integer uid);

    Long countByUid(Integer uid);

}