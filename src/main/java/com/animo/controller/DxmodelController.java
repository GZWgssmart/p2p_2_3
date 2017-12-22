package com.animo.controller;

import com.animo.common.ServerResponse;
import com.animo.pojo.Dxmodel;
import com.animo.service.DxmodelService;
import com.animo.service.JklxService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by CHEN JX on 2017/12/22.
 */
@Controller
@RequestMapping("/dxmodel/data/json")
public class DxmodelController {

    @Autowired
    private DxmodelService dxmodelService;

    private ServerResponse serverResponse;

    @PostMapping("save")
    public ServerResponse save(Dxmodel dxmodel) {

        return dxmodelService.save(dxmodel);
    }
    @RequestMapping("remove")
    public ServerResponse removeById(Integer dxid) {
        return dxmodelService.removeById(dxid);
    }
    @RequestMapping("update")
    public ServerResponse update(Dxmodel dxmodel) {
     return dxmodelService.update(dxmodel);
    }
}
