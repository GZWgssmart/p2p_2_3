package com.animo.controller;

import com.animo.common.ServerResponse;
import com.animo.pojo.Rzvip;
import com.animo.pojo.User;
import com.animo.service.RzCheckService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * Created by qm on 2018/1/3.
 *
 * @author qm
 * @date 2018-01-03 10:49
 */
@RestController
@RequestMapping("/rzcheck/data/json")
public class RzCheckController {

    @Autowired
    private RzCheckService rzCheckService;


}
