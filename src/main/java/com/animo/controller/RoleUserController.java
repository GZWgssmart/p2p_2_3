package com.animo.controller;

import com.animo.common.ServerResponse;
import com.animo.service.RoleuserService;
import com.animo.utils.ShiroAuthorizationUtil;
import com.animo.vo.RoleUserVO;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/roleUser/data/json")
public class RoleUserController {

    @Autowired
    private RoleuserService roleuserService;

    /**
     * 用户角色分配
     * 批量添加角色用户
     * @param roleUserVO
     * @return
     */
    @RequestMapping("saveRoleUser")
    @RequiresPermissions("roleUser:saveRoleUser")
    public ServerResponse saveRoleUser(RoleUserVO roleUserVO){
        ShiroAuthorizationUtil.clearAuthAndCache();
        return roleuserService.save(roleUserVO.getRoleString(),roleUserVO.getUserString());
    }
}
