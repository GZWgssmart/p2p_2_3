package com.animo.controller;

import com.animo.common.Pager;
import com.animo.common.ServerResponse;
import com.animo.pojo.Skb;
import com.animo.service.SkbService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * Created by Animo on 2018-01-02.
 * 收款表
 */
@RestController
@RequestMapping("/skb/data/json")
public class SkbController {

    @Autowired
    private SkbService skbService;

    /**
     * 查询个人用户收款
     */
    @GetMapping("list")
    public Pager list(Integer page, Integer limit, Integer uid, Integer baid){
        return skbService.skblist(page,limit,uid,baid);
    }

    /**
     * 确认收款
     * @param skid
     * @return
     */
    @GetMapping("confirm")
    public ServerResponse confirm(Integer skid){
        return skbService.confirm((Skb)skbService.getById(skid).getData());
    }

}
