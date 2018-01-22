package com.animo.controller;

import com.animo.common.ServerResponse;
import com.animo.pojo.Rolejur;
import com.animo.service.RoleJurService;
import com.animo.utils.ShiroAuthorizationUtil;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.List;

@RestController
@RequestMapping("/roleJur/data/json")
public class RoleJurController {

    @Autowired
    private RoleJurService roleJurService;

    /**
     * 角色权限分配
     * @param nodeList
     * @return
     */
    @RequestMapping("saveRoleJur")
    @RequiresPermissions("roleJur:saveRoleJur")
    public int saveRoleJur(String nodeList){
        List<Rolejur> rolejurList = new ArrayList<>();
        String [] nodeString = nodeList.split(",");
        Rolejur rolejur;
        for (int i = 1; i <nodeString.length; i++){
            rolejur = new Rolejur();
            rolejur.setJid(Integer.valueOf(nodeString[0]));
            rolejur.setRid(Integer.valueOf(nodeString[i]));
            rolejurList.add(rolejur);
        }
        ShiroAuthorizationUtil.clearAuthAndCache();
        return roleJurService.saveRolejur(rolejurList);
    }

    /**
     * 删除角色的权限
     * @param rjid
     * @return
     */
    @RequestMapping("delete")
    @RequiresPermissions("roleJur:delete")
    public ServerResponse removeRolejur(Integer rjid){
        ShiroAuthorizationUtil.clearAuthAndCache();
        return roleJurService.removeById(rjid);
    }
}
