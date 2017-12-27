package com.animo.service.impl;

import com.animo.common.Pager;
import com.animo.common.ServerResponse;
import com.animo.dao.RoleMapper;
import com.animo.pojo.Role;
import com.animo.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RoleServiceImpl extends AbstractServiceImpl implements RoleService{


    private RoleMapper roleMapper;

    @Autowired
    public void setRoleMapper(RoleMapper roleMapper) {
        super.setBaseMapper(roleMapper);
        this.roleMapper = roleMapper;
    }

    @Override
    public List<Role> listAll() {
        return roleMapper.listAll();
    }

    @Override
    public List<Role> listByPid(Integer pid) {
        return roleMapper.listByPid(pid);
    }
}