package com.animo.controller;

import com.animo.common.Pager;
import com.animo.common.ServerResponse;
import com.animo.pojo.Role;
import com.animo.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

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

    private Integer pageNo;
    private Integer pageSize;

    /**
     * 添加角色
     * @return
     */
    @RequestMapping("save")
    public ServerResponse saveRole(){
        role = new Role();
        role.setRname("财务经理");
        role.setContent("公司资金管理者");
        return roleService.save(role);
    }

    /**
     * 修改
     * @return
     */
    @RequestMapping("update")
    public ServerResponse updateRole(){
        role = new Role();
        role.setRname("CEO");
        role.setContent("我是CEO");
        role.setRid(3);
        return roleService.update(role);
    }

    /**
     * 删除
     * @return
     */
    @RequestMapping("delete")
    public ServerResponse deleteRole(){
        role = new Role();
        role.setRid(3);
        return roleService.removeById(role.getRid());
    }

    /**
     * 分页测试
     */
    @RequestMapping
    public Pager pagerRole(){
        return roleService.listPager(pageNo,pageSize);
    }

    public Role getRole() {
        return role;
    }

    public void setRole(Role role) {
        this.role = role;
    }

    public void setPageNo(Integer pageNo) {
        this.pageNo = pageNo;
    }

    public void setPageSize(Integer pageSize) {
        this.pageSize = pageSize;
    }
}
