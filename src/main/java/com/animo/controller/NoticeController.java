package com.animo.controller;

import com.animo.common.Pager;
import com.animo.common.ServerResponse;
import com.animo.pojo.Media;
import com.animo.pojo.Notice;
import com.animo.service.MediaService;
import com.animo.service.NoticeService;
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
@RequestMapping("/notice/data/json")
public class NoticeController {
    @Autowired
    private NoticeService noticeService;
/*
* 平台公告保存
* */
    @RequestMapping("save")
    //    @RequiresPermissions("notice:save")
    public ServerResponse save(Notice notice) throws Exception {
        notice.setCreatedTime(new Date());
        return noticeService.save(notice);
    }

    /*
    * 修改
    * */
    @RequestMapping("updatenotice")
    //    @RequiresPermissions("notice:updatenotice")
    public ServerResponse updatenotice(Notice notice) throws Exception {
        notice.setCreatedTime(new Date());
        return noticeService.update(notice);
    }

    /*
    * 删除
    * */
    @RequestMapping("removenotice")
    //    @RequiresPermissions("notice:removenotice")
    public ServerResponse removenotice(Integer id) {
        return noticeService.removeById(id);
    }


    /*
    * 查询分页
    * */
    @RequestMapping("pager")
    //    @RequiresPermissions("notice:pager")
    public Pager pagerRole(Integer page, Integer limit) {
        System.out.print(page);
        System.out.print(limit);

        return noticeService.listPager(page, limit);
    }

    /*
    * 根据id查
    * */
    @RequestMapping("byiddync")
    //    @RequiresPermissions("notice:byiddync")
    public ServerResponse byIddync(Integer id) throws Exception {
        System.out.println(id);
        return noticeService.getById(id);

    }
    @GetMapping("PagerCriteria")
    //    @RequiresPermissions("notice:PagerCriteria")
    public Pager PagerCriteria(Integer pageNumber, Integer pageSize){
        return noticeService.listPagers(pageNumber,pageSize);
    }

}
