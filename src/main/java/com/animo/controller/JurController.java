package com.animo.controller;

import com.animo.common.Pager;
import com.animo.common.ServerResponse;
import com.animo.pojo.Jur;
import com.animo.service.JurService;
import com.animo.utils.ShiroAuthorizationUtil;
import com.animo.vo.RoleJurVO;
import org.apache.ibatis.annotations.Param;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.ArrayList;
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
     * 初始化权限
     * @param jur
     * @return
     */
    @RequestMapping("initJur")
    @RequiresPermissions("jur:initJur")
    public ServerResponse initJur(Jur jur){
        return jurService.insertJurList(jur.getJurl());
    }

    /**
     * 根据角色id查看角色的权限
     * @param rid
     * @return
     */
    @RequestMapping("listJurByRid")
    @RequiresPermissions("jur:listJurByRid")
    public List<RoleJurVO> listByRid(Integer rid){
        return jurService.listByRid(rid);
    }

    /**
     * 添加角色时，列出所有权限
     * @return
     */
    @RequestMapping("all")
    @RequiresPermissions("jur:all")
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
    @RequiresPermissions("jur:pager")
    public Pager pagerJur(Integer page, Integer limit){
        return jurService.listPager(page, limit);
    }

    /**
     * 更新权限
     * @param jur
     * @return
     */
    @RequestMapping("updateJur")
    @RequiresPermissions("jur:updateJur")
    public ServerResponse updateJur(Jur jur){
        ShiroAuthorizationUtil.clearAuthAndCache();
        return jurService.update(jur);
    }

}
