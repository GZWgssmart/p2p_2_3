package com.animo.controller;

import com.animo.common.Pager;
import com.animo.common.ServerResponse;
import com.animo.pojo.Jklx;
import com.animo.service.JklxService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * Created by Animo on 2017-12-22.
 * 借款类型
 */
@RestController
@RequestMapping("/jklx/data/json")
public class JklxController {

    @Autowired
    private JklxService jklxService;


    /**
     * 添加借款类型
     * @param jklx
     * @return
     */
    @PostMapping("save")
    public ServerResponse save(Jklx jklx){
        return jklxService.save(jklx);
    }

    /**
     * 修改借款类型
     * @param jklx
     * @return
     */
    @RequestMapping("update")
    public ServerResponse update(Jklx jklx) {
        return jklxService.update(jklx);
    }
    @GetMapping("updateStatus/{lxid}/{status}")
    public ServerResponse updateStatus(Integer lxid,Integer status){
        return jklxService.updateStatus(lxid,status);
    }

    /**
     * 借款类型分页
     * @param page
     * @param limit
     * @return
     */
    @GetMapping("pager")
    public Pager pager(int page, int limit){
        return jklxService.listPager(page,limit);
    }
}
