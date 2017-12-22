package com.animo.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface JklxMapper extends BaseMapper{

    @Override
    int updateStatus(@Param("id")Integer id, @Param("status") Integer status);

}