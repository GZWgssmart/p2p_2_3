package com.animo.controller;

import com.animo.common.Pager;
import com.animo.common.ServerResponse;
import com.animo.pojo.Role;
import com.animo.pojo.Rolejur;
import com.animo.service.RoleJurService;
import com.animo.service.RoleService;
import com.animo.utils.ShiroAuthorizationUtil;
import com.animo.vo.RoleJurVO;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
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
    @Autowired
    private RoleJurService roleJurService;
    /**
     * 添加角色
     * @return
     */
    @PostMapping("save")
    @RequiresPermissions("role:add")
    public ServerResponse saveRole(RoleJurVO roleJurVO){
        Role role = new Role();
        role.setPid(roleJurVO.getPid());
        role.setRname(roleJurVO.getRname());
        role.setContent(roleJurVO.getContent());
        return roleService.save(role, roleJurVO.getJurString());
    }

    /**
     * 修改
     * @return
     */
    @RequestMapping("update")
    @RequiresPermissions("role:update")
    public ServerResponse updateRole(RoleJurVO roleJurVO){
        String jurString = roleJurVO.getJurString();
        Role role = new Role();
        role.setRname(roleJurVO.getRname());
        role.setRid(roleJurVO.getRid());
        role.setContent(roleJurVO.getContent());
        role.setPid(roleJurVO.getPid());
        if (jurString != null && jurString.length() > 0){
            String [] jurList = jurString.split(",");
            List<Rolejur> rolejurList = new ArrayList<>();
            Rolejur rolejur;
            for (int i = 0; i < jurList.length; i++){
                rolejur = new Rolejur();
                rolejur.setRid(role.getRid());
                rolejur.setJid(Integer.valueOf(jurList[i]));
                rolejurList.add(rolejur);
            }
            roleJurService.saveRolejur(rolejurList);
        }
        ShiroAuthorizationUtil.clearAuthAndCache();
        return roleService.update(role);
    }

    /**
     * 删除
     * @return
     */
    @RequestMapping("delete")
    @RequiresPermissions("role:delete")
    public ServerResponse deleteRole(Role role){
        ShiroAuthorizationUtil.clearAuthAndCache();
        return roleService.deleteByRoleKey(role.getRid());
    }

    /**
     * 角色分页
     * @return
     */
    @RequestMapping("pager")
    @RequiresPermissions("role:pager")
    public Pager pagerRole(Integer pageNo, Integer pageSize){
        return roleService.listPager(pageNo,pageSize);
    }

    /**
     * 所有角色，分配权限时
     * @return
     */
    @RequestMapping("all")
    @RequiresPermissions("role:all")
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
    @RequiresPermissions("role:dep")
    public List<Role> listByPid(Role role) {
        return roleService.listByPid(role.getPid());
    }
}
