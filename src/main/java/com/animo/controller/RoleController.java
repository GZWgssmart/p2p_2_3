package com.animo.controller;

import com.animo.common.Pager;
import com.animo.common.ServerResponse;
import com.animo.pojo.Role;
import com.animo.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * @author 叶小鹏
 * 测试角色的crud
 */
@RestController
@RequestMapping("/role/data/json")
public class RoleController {

    @Autowired
    private RoleService roleService;

    private Role role;

    /**
     * 添加角色
     * @return
     */
    @PostMapping("save")
    public ServerResponse saveRole(Role role){
        return roleService.save(role);
    }

    /**
     * 修改
     * @return
     */
    @RequestMapping("update")
    public ServerResponse updateRole(Role role){
        return roleService.update(role);
    }

    /**
     * 删除
     * @return
     */
    @RequestMapping("delete")
    public ServerResponse deleteRole(Role role){
        return roleService.removeById(role.getRid());
    }

    /**
     * 角色分页
     * @return
     */
    @RequestMapping("pager")
    public Pager pagerRole(Integer pageNo, Integer pageSize){
        return roleService.listPager(pageNo,pageSize);
    }

    @RequestMapping("all")
    public List<Role> listAll(){
        return roleService.listAll();
    }


    /**
     * 所有部门
     * @param role
     * @return
     */
    @RequestMapping("dep")
    public List<Role> listByPid(Role role) {
        return roleService.listByPid(role.getPid());
    }
}
