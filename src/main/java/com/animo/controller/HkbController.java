package com.animo.controller;

import com.animo.common.Pager;
import com.animo.service.HkbService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * Created by Animo on 2018-01-06.
 */
@RestController
@RequestMapping("/hkb/data/json")
public class HkbController {

    @Autowired
    private HkbService hkbService;

    @GetMapping("pager")
    public Pager pager(Integer pageNumber, Integer pageSize,Integer baid){
        return hkbService.pager(pageNumber,pageSize,baid);
    }

}
