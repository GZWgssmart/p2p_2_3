package com.animo.RoleService;

import com.animo.BaseTest;
import com.animo.common.Pager;
import com.animo.pojo.Role;
import com.animo.service.RoleService;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * @author 叶小鹏
 * 角色测试类
 */
public class RoleServiceTest extends BaseTest {

    @Autowired
    private RoleService roleService;

    private Role role;

    //添加角色
    @Test
    public void saveRole(){
        role = new Role();
        role.setRname("副总经理");
        role.setContent("大家好！我是副总经理。");
        roleService.save(role);
    }

    //更新角色
    @Test
    public void updateRole(){
        role = new Role();
        role.setRid(3);
        role.setRname("CEO");
        role.setContent("我是CEO");
        roleService.update(role);
    }

    //角色删除
    @Test
    public void deleteRole(){
        role = new Role();
        role.setRid(3);
        roleService.removeById(role.getRid());
    }

    @Test
    public void pagerRole(){
        Pager pager = new Pager();
        pager.setPageNo(1);
        pager.setPageSize(5);
        roleService.listPager(pager.getPageNo(),pager.getPageSize());
    }
}
