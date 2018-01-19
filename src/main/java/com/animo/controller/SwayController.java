package com.animo.controller;

import com.animo.common.Pager;
import com.animo.common.ServerResponse;
import com.animo.pojo.Sway;
import com.animo.service.SwayService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * Created by CHEN JX on 2017/12/25.
 */
@RestController
@RequestMapping("/sway/data/json")
public class SwayController {

    @Autowired
    private SwayService swayService;

    /**
     * 还款方式添加
     * @param sway
     * @return
     */
    @RequestMapping("save")
    public ServerResponse save(Sway sway) {
        return swayService.save(sway);
    }

    /**
     * 还款方式删除
     * @param sway
     * @return
     */
    @RequestMapping("remove")
    public ServerResponse<Sway> removeById(Sway sway){
     return swayService.removeById(sway.getSid());
    }


    /**
     * 还款方式修改
     * @return
     */
    @RequestMapping("update")
    public ServerResponse<Sway> update(Sway sway) {
        return swayService.update(sway);
    }

    /**
     * 分页查询还款方式
     * @param page
     * @param limit
     * @return
     */
    @RequestMapping("pager")
    public Pager pager(int page,int limit) {
        return swayService.listPager(page,limit);
    }
}
