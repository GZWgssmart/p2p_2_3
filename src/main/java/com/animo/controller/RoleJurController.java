package com.animo.controller;

import com.animo.common.ServerResponse;
import com.animo.pojo.Rolejur;
import com.animo.service.RoleJurService;
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

    @RequestMapping("saveRoleJur")
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
        return roleJurService.saveRolejur(rolejurList);
    }

    @RequestMapping("delete")
    public ServerResponse removeRolejur(Integer rjid){
        return roleJurService.removeById(rjid);
    }
}
