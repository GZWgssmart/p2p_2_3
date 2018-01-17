package com.animo.dao;

import com.animo.common.Pager;
import com.animo.pojo.Skb;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface SkbMapper extends BaseMapper{

    List<Object> list(@Param("pager") Pager pager, @Param("uid") Integer uid,@Param("baid") Integer baid);

    long countUid(@Param("uid") Integer uid,@Param("baid") Integer baid);

    int saveList(List<Skb> list);

    Long getByUidAndBaid(@Param("uid") Integer uid,@Param("baid") Integer baid);

    int updateByBaid(Object object);

}