package com.animo.dao;

import com.animo.common.Pager;
import com.animo.pojo.Hkb;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface HkbMapper extends BaseMapper{


    Integer saveList(List hkbList);

    List<Object> listPagerByBaid(@Param("pager")Pager pager,@Param("baid") Integer baid);

    Long countByBaid(Integer baid);

    List<Hkb> getSkTime(Integer baid);

    int updateByBaid(Object object);
}