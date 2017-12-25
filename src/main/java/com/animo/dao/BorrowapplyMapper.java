package com.animo.dao;

import org.apache.ibatis.annotations.Param;

import java.util.Date;

public interface BorrowapplyMapper extends BaseMapper{

    int updateTime (@Param("baid") Integer baid,@Param("ckstatus") Integer ckstatus,@Param("cktime") Date cktime);


}