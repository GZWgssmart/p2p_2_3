package com.animo.controller;

import com.animo.common.Pager;
import com.animo.common.ServerResponse;
import com.animo.pojo.Dynamic;
import com.animo.pojo.Media;
import com.animo.service.DynamicService;
import com.animo.service.MediaService;
import com.animo.utils.ImageUtils;
import com.animo.utils.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import java.util.Date;
import java.util.List;

/**
 * Created by Administrator on 2017/12/25.
 */
@RestController
@RequestMapping("/media/data/json")
public class MediaController {
    @Autowired
    private MediaService mediaService;
/*
* 媒体报道保存
* */
    @RequestMapping("save")
    //    @RequiresPermissions("media:save")
    public ServerResponse save(Media media) throws Exception {
        List<String> stringList = ImageUtils.getImageSrc(media.getContent());
       if(stringList.size()!=0){
        String imgSrc = stringList.get(0);//选择第一张作为封面
//        String imgSrc = StringUtils.listToString(stringList,',');//不需要分开存多张图（若需要可使用该方法）
        media.setPic(imgSrc);
       }

        media.setCreatedTime(new Date());
        return mediaService.save(media);
    }

    /*
    * 修改
    * */
    @RequestMapping("updatemedia")
    //    @RequiresPermissions("media:updatemedia")
    public ServerResponse updatemedia(Media media) throws Exception {
        List<String> stringList = ImageUtils.getImageSrc(media.getContent());
        if(stringList.size()!=0) {
            String imgSrc = stringList.get(0);//选择第一张作为封面
//        String imgSrc = StringUtils.listToString(stringList,',');//不需要分开存多张图（若需要可使用该方法）
            media.setPic(imgSrc);
        }
        media.setCreatedTime(new Date());
        return mediaService.update(media);
    }

    /*
    * 删除
    * */
    @RequestMapping("removemedia")
    //    @RequiresPermissions("media:removemedia")
    public ServerResponse removemedia(Integer id) {

        return mediaService.removeById(id);
    }


    @RequestMapping("savepic")
    public ServerResponse savepic(Media media, MultipartFile file) {
        media.setCreatedTime(new Date());
        return mediaService.save(media, file);
    }

    /*
    * 表格查询分页
    * */
    @RequestMapping("pager")
    //    @RequiresPermissions("media:pager")
    public Pager pagerRole(Integer page, Integer limit) {
        System.out.print(page);
        System.out.print(limit);

        return mediaService.listPager(page, limit);
    }


    /*
    * 根据id查
    * */
    @RequestMapping("byiddync")
    //    @RequiresPermissions("media:byiddync")
    public ServerResponse byIddync(Integer id) throws Exception {
        System.out.println(id);
        return mediaService.getById(id);

    }

    @GetMapping("PagerCriteria")
    //    @RequiresPermissions("media:PagerCriteria")
    public Pager PagerCriteria(Integer pageNumber, Integer pageSize){
        return mediaService.listPagers(pageNumber,pageSize);
    }


}
