package com.animo.controller;

import com.animo.common.Pager;
import com.animo.common.ServerResponse;
import com.animo.pojo.Jur;
import com.animo.service.JurService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * @author ye
 * 描述：权限的crud
 */


@RestController
@RequestMapping("/jur/data/json")
public class JurController {

    @Autowired
    private JurService jurService;

    /**
     * 添加角色时，分配权限
     * @return
     */
    @RequestMapping("all")
    public List<Jur> listAll(){
        return jurService.listAll();
    }

    /**
     * 权限分页
     * @param page
     * @param limit
     * @return
     */
    @RequestMapping("pager")
    public Pager pagerJur(Integer page, Integer limit){
        return jurService.listPager(page, limit);
    }

    /**
     * 更新权限
     * @param jur
     * @return
     */
    @RequestMapping("updateJur")
    public ServerResponse updateJur(Jur jur){
        return jurService.update(jur);
    }

}
