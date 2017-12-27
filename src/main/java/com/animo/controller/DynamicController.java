package com.animo.controller;

import com.animo.common.Pager;
import com.animo.common.ServerResponse;
import com.animo.pojo.Dynamic;
import com.animo.service.DynamicService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import java.util.Date;

/**
 * Created by Administrator on 2017/12/25.
 */
@RestController
@RequestMapping("dyna/data/json")
public class DynamicController {
    @Autowired
    private DynamicService dynamicService;
    @RequestMapping("save")
    public ServerResponse save (Dynamic dynamic)throws Exception{
        dynamic.setCreatedTime(new Date());
        return dynamicService.save(dynamic);

    }
/*
* 修改
* */
    @RequestMapping("updatedync")
    public ServerResponse updatedync (Dynamic dynamic)throws  Exception{
        System.out.print("1231212123123221231231");
        dynamic.setCreatedTime(new Date());
    return dynamicService.update(dynamic);
    }
/*
* 删除
* */
    @RequestMapping("removedyna")
    public ServerResponse removedyna(Integer id){

        return dynamicService.removeById(id);
    }


    @RequestMapping("savepic")
    public ServerResponse savepic(Dynamic dynamic, MultipartFile file){
        dynamic.setCreatedTime(new Date());
        return dynamicService.save(dynamic,file);
    }




/*
* 查询分页
* */
    @RequestMapping("pager")
    public Pager pagerRole(Integer pageNo, Integer pageSize){
        System.out.print(pageNo);System.out.print(pageSize);

        return dynamicService.listPager(pageNo,pageSize);
    }


/*
* 根据id查
* */
    @RequestMapping("byiddync")
    public ServerResponse byIddync(Integer id)throws Exception{
        System.out.println(id);
        return  dynamicService.getById(id);

    }







}
