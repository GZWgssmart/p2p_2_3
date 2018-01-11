package com.animo.dao;

import com.animo.common.Pager;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;

public interface BorrowapplyMapper extends BaseMapper{

    int updateTime (@Param("baid") Integer baid,@Param("ckstatus") Integer ckstatus,@Param("cktime") Date cktime);

    List<Object> three(Integer bzid);

    List<Object> listPagerCriteria(@Param("pager") Pager pager, @Param("query") Object obj);

    Long countCriteria(@Param("query") Object obj);

    Object getById(Integer baid);


   Object getByIdVo(Integer baid);

    int updateStatusAndTime(@Param("id") Integer id,@Param("status") Integer status, @Param("ckTime") Date ckTime);

}