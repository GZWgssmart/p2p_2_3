package com.animo.dao;

import com.animo.common.Pager;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface NoticeMapper extends BaseMapper{
    List<Object> listPagers(@Param("pager") Pager pager);

    Long counts();
}