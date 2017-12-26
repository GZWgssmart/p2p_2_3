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
public class RoleServiceImpl implements RoleService{

    @Autowired
    private RoleMapper roleMapper;

    @Override
    public ServerResponse save(Object object) {
        if (object != null){
            Integer integer = roleMapper.insertSelective(object);
            if (integer == 1){
                return ServerResponse.createBySuccess("添加成功");
            }else {
                return ServerResponse.createByError("添加失败");
            }
        }
        return ServerResponse.createByError("请输入内容");
    }

    @Override
    public ServerResponse getById(Integer id) {
        return null;
    }

    @Override
    public ServerResponse updateStatus(Integer id, Integer sataus) {
        return null;
    }

    @Override
    public ServerResponse update(Object object) {
        roleMapper.updateByPrimaryKey(object);
        return ServerResponse.createBySuccess("更新成功");
    }

    @Override
    public ServerResponse removeById(Integer id) {
        roleMapper.deleteByPrimaryKey(id);
        return ServerResponse.createBySuccess("删除成功");
    }

    @Override
    public Pager listPager(int pageNo, int pageSize) {
        Pager pager = new Pager(pageNo, pageSize);
        pager.setRows(roleMapper.listPager(pager));
        pager.setTotal(roleMapper.count());
        return pager;
    }

    @Override
    public List<Role> listAll() {
        return roleMapper.listAll();
    }
}