package com.animo.dao;

import com.animo.common.ServerResponse;
import com.animo.pojo.Role;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface RoleMapper extends BaseMapper{
    //查询所有角色及部门
    List<Role> listAll();
    //查询所有部门
    List<Role> listByPid(Integer pid);
    //删除角色，及与该角色有关联的数据
    int deleteByRoleKey(Integer id);
    //重写save方法，添加角色时需要分配权限，需要提供角色id
    ServerResponse save(Object object, String jurList);
}