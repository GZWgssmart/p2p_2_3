package com.animo.dao;

import com.animo.pojo.Jur;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface JurMapper extends BaseMapper{
    //查询所有权限
    List<Jur> listAll();
}