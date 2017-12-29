package com.animo.dao;

import com.animo.common.Pager;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface TzbMapper extends BaseMapper{

    List<Object> listPagerByBaid(@Param("pager") Pager pager,@Param("baid") Integer baid);

    Long countByBaid(Integer baid);

}