package com.animo.dao;

import com.animo.pojo.Role;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface RoleMapper extends BaseMapper{
    //查询所有角色及部门
    List<Role> listAll();
    //查询所有部门
    List<Role> listByPid(Integer pid);
}