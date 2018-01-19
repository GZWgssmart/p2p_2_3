package com.animo.controller;

import com.animo.common.Pager;
import com.animo.common.ServerResponse;
import com.animo.pojo.Dynamic;
import com.animo.service.DynamicService;
import com.animo.utils.ImageUtils;
import com.animo.utils.StringUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created by Administrator on 2017/12/25.
 */
@RestController
@RequestMapping("/dyna/data/json")
public class DynamicController {
    @Autowired
    private DynamicService dynamicService;

    /**
     * 添加公司动态
     * @param dynamic
     * @return
     * 说明：动态中可能包含多张图片，选择一张图片作为封面
     */
    @RequestMapping("save")
//    @RequiresPermissions("dynamic:save")
    public ServerResponse save (Dynamic dynamic){
        List<String> stringList = ImageUtils.getImageSrc(dynamic.getContent());
        if(stringList.size()!=0) {
            String imgSrc = stringList.get(0);//选择第一张作为封面
//        String imgSrc = StringUtils.listToString(stringList,',');//不需要分开存多张图（若需要可使用该方法）
            dynamic.setPic(imgSrc);
        }
        dynamic.setCreatedTime(new Date());
        return dynamicService.save(dynamic);
    }
/*
* 修改
* */
    @RequestMapping("updatedync")
//    @RequiresPermissions("dynamic:updatedync")
    public ServerResponse updatedync (Dynamic dynamic)throws  Exception{
        List<String> stringList = ImageUtils.getImageSrc(dynamic.getContent());
        if(stringList.size()!=0) {
            String imgSrc = stringList.get(0);//选择第一张作为封面
//        String imgSrc = StringUtils.listToString(stringList,',');//不需要分开存多张图（若需要可使用该方法）
            dynamic.setPic(imgSrc);
        }
        dynamic.setCreatedTime(new Date());
        return dynamicService.update(dynamic);
    }
/*
* 删除
* */
    @RequestMapping("removedyna")
//    @RequiresPermissions("dynamic:removedyna")
    public ServerResponse removedyna(Integer id){

        return dynamicService.removeById(id);
    }


    @RequestMapping("savepic")
    public ServerResponse savepic(Dynamic dynamic, MultipartFile file){
        dynamic.setCreatedTime(new Date());
        return dynamicService.save(dynamic,file);
    }




/*
* 表格查询分页
* */
    @RequestMapping("pager")
    //    @RequiresPermissions("dynamic:pager")
    public Pager pagerRole(Integer page, Integer limit){
        System.out.print(page);System.out.print(limit);

        return dynamicService.listPager(page,limit);
    }

/*
* 根据id查
* */
    @RequestMapping("byiddync")
    //    @RequiresPermissions("dynamic:byiddync")
    public ServerResponse byIddync(Integer id)throws Exception{
        System.out.println(id);
        return  dynamicService.getById(id);

    }
/*
* 前台分页查询
* */
    @GetMapping("PagerCriteria")
    //    @RequiresPermissions("dynamic:PagerCriteria")
    public Pager PagerCriteria(Integer pageNumber, Integer pageSize){
        return dynamicService.listPagers(pageNumber,pageSize);
    }
}
