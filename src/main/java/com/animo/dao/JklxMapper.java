package com.animo.dao;

import org.springframework.stereotype.Repository;

@Repository
public interface JklxMapper extends BaseMapper{

    int updateStatus(Integer lxid,Integer status);

}