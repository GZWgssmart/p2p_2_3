package com.animo.service;

import com.animo.common.ServerResponse;
import com.animo.pojo.Role;
import com.animo.pojo.Rolejur;

import java.util.List;

public interface RoleService extends BaseService{
    List<Role> listAll();
    List<Role> listByPid(Integer pid);
    ServerResponse deleteByRoleKey(Integer id);
    ServerResponse save(Role role, String jurString);
}