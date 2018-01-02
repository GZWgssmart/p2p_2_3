package com.animo.controller;

import com.animo.common.Pager;
import com.animo.common.ServerResponse;
import com.animo.pojo.Role;
import com.animo.pojo.Rolejur;
import com.animo.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * @author ye
 * 角色的crud
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
    public ServerResponse saveRole(Role role, String jurString){
        System.out.println(jurString);
        return roleService.save(role, jurString);
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
        return roleService.deleteByRoleKey(role.getRid());
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
     * 添加角色时指定属于某个部门
     * 所有部门
     * @param role
     * @return
     */
    @RequestMapping("dep")
    public List<Role> listByPid(Role role) {
        return roleService.listByPid(role.getPid());
    }
}
