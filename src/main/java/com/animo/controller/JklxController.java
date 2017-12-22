package com.animo.controller;

import com.animo.common.ServerResponse;
import com.animo.pojo.Jklx;
import com.animo.service.JklxService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * Created by Animo on 2017-12-22.
 */
@RestController
@RequestMapping("jklx/data/json")
public class JklxController {

    @Autowired
    private JklxService jklxService;

    private ServerResponse serverResponse;

    @PostMapping("save")
    public ServerResponse save(Jklx jklx){
        return jklxService.save(jklx);
    }
}
