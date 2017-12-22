package com.animo.RoleService;

import com.animo.pojo.Role;
import com.animo.service.RoleService;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * @author 叶小鹏
 * 角色测试类
 */
public class RoleServiceTest  {

    @Autowired
    private RoleService roleService;

    //添加角色
    @Test
    public void saveRole(){
        Role role = new Role();
        role.setRname("总经理");
        role.setContent("大家好！我是总经理。");
        roleService.save(role);
    }
}
