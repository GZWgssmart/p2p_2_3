package com.animo.controller;

import com.animo.common.Pager;
import com.animo.common.ServerResponse;
import com.animo.pojo.Bz;
import com.animo.service.BzService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * Created by CHEN JX on 2017/12/24.
 */
@RestController
@RequestMapping("/bz/data/json")
public class BzController {

    @Autowired
    private BzService bzService;

    /**
     * 标种添加
     * @return
     */
    @RequestMapping("save")
    public ServerResponse save(Bz bz) {
       return bzService.save(bz);
    }

    /**
     * 标种移除
     * @param bzid
     * @return
     */
    @RequestMapping("remove")
    public ServerResponse removeById(Integer bzid) {
        return bzService.removeById(bzid);
    }

    /**
     * 标种修改
     * @param bz
     * @return
     */
    @RequestMapping("update")
    public ServerResponse update(Bz bz) {
        return bzService.update(bz);
    }

    /**
     * 标种分页
     * @param pageNo
     * @param pageSize
     * @return
     */
    @RequestMapping("pager")
    public Pager pager(int pageNo, int pageSize) {
        return bzService.listPager(pageNo,pageSize);
    }
}
