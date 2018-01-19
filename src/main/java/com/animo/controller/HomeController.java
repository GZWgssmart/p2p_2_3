package com.animo.controller;

import com.animo.common.Pager;
import com.animo.common.ServerResponse;
import com.animo.pojo.Home;
import com.animo.service.HomeService;
import com.animo.utils.PathUtils;
import com.animo.utils.UploadUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by Administrator on 2018/1/17.
 */
@RestController
@RequestMapping("/home/data/json")
public class HomeController {

    @Autowired
    private HomeService homeService;

/*
* 首页轮播图片上传
* */
    @RequestMapping("upload")
    //    @RequiresPermissions("home:upload")
    public Object upload(MultipartFile file, HttpServletRequest request){
        Map<String, Object> map = new HashMap<>();
        String path = PathUtils.mkUploads();
        try {
            String image = UploadUtil.uploadFile(file,path);
            map.put("code",0);
            map.put("image",image);
        } catch (IOException e) {
            map.put("code",1);
            e.printStackTrace();
        }
        return map;
    }

    /**
     *
     * @param home
     * @return
     * 首页图片保存
     *
     */
    @RequestMapping("save")
    //    @RequiresPermissions("home:save")
    public ServerResponse save (Home home){
        home.setEwm("kong");
        home.setPhone("000");
        home.setStatus(0);
        return homeService.save(home);
    }


    /*
* 表格查询分页
* */
    @RequestMapping("pager")
    //    @RequiresPermissions("home:pager")
    public Pager pagerRole(Integer page, Integer limit){
        System.out.print(page);System.out.print(limit);

        return homeService.listPager(page,limit);
    }

/*
* 首页图片修改
* */
    @RequestMapping("update")
    //    @RequiresPermissions("home:update")
    public ServerResponse updateFriend(Home home){
        return homeService.update(home);
    }
/*
* 首页图片前台查询
*
* */
    @RequestMapping("listhome")
    //    @RequiresPermissions("home:listhome")
    public Home listhome(){
        return homeService.listhome();
    }
/*
*
* 首页图片修改状态可用或不可用
* */
    @RequestMapping("updhid")
    //    @RequiresPermissions("home:updhid")
    public Integer updhid(Integer id){
        homeService.updhid(id);
        homeService.updhids(id);
        return 0;
    }



}
