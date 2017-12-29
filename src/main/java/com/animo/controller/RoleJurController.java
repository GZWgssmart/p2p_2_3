package com.animo.controller;

import com.animo.common.ServerResponse;
import com.animo.pojo.Rolejur;
import com.animo.service.RoleJurService;
import com.animo.vo.RoleJurVO;
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
    public int saveRoleJur(){
        RoleJurVO roleJurVO = new RoleJurVO();
        Rolejur rolejur = new Rolejur();
        rolejur.setRid(2);
        rolejur.setJid(2);
        List<Rolejur> rolejurList = new ArrayList<>();
        rolejurList.add(rolejur);
        roleJurVO.setRolejurList(rolejurList);
        return roleJurService.saveRolejur(roleJurVO.getRolejurList());
    }

}
