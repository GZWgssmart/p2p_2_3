package com.animo.dao;

import com.animo.common.ServerResponse;
import com.animo.pojo.Jur;
import com.animo.vo.RoleJurVO;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface JurMapper extends BaseMapper{
    //查询所有权限
    List<Jur> listAll();
    //查询某个角色的权限
    List<RoleJurVO> listByRid(Integer rid);
    //批量插入，初始化所有权限
    ServerResponse saveJurList(List<Jur> jurList);
    //初始化前，清空表数据
    int deleteAll();
}