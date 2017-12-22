package com.animo.service.impl;

import com.animo.common.ServerResponse;
import com.animo.dao.RoleMapper;
import com.animo.pojo.Role;
import com.animo.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class RoleServiceImpl implements RoleService{

    @Autowired
    private RoleMapper roleMapper;

    @Override
    public ServerResponse<String> save(Role role) {
        if (role != null){
            Integer integer = roleMapper.insertSelective(role);
            if (integer == 1){
                return ServerResponse.createBySuccess("添加成功");
            }else {
                return ServerResponse.createByError("添加失败");
            }
        }
        return ServerResponse.createByError("请输入内容");
    }
}