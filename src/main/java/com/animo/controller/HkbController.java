package com.animo.controller;

import com.animo.common.Pager;
import com.animo.common.ServerResponse;
import com.animo.pojo.Hkb;
import com.animo.pojo.Skb;
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
    public Pager pager(Integer page, Integer limit,Integer baid){
        return hkbService.pager(page,limit,baid);
    }

    /**
     * 确认收款
     * @param hkid
     * @return
     */
    @GetMapping("confirm")
    public ServerResponse confirm(Integer hkid){
        return hkbService.confirm((Hkb)hkbService.getById(hkid).getData());
    }

}
