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

    @RequestMapping("save")
    public ServerResponse save(Notice notice) throws Exception {
        notice.setCreatedTime(new Date());
        return noticeService.save(notice);
    }

    /*
    * 修改
    * */
    @RequestMapping("updatenotice")
    public ServerResponse updatenotice(Notice notice) throws Exception {
        notice.setCreatedTime(new Date());
        return noticeService.update(notice);
    }

    /*
    * 删除
    * */
    @RequestMapping("removenotice")
    public ServerResponse removenotice(Integer id) {
        return noticeService.removeById(id);
    }


    /*
    * 查询分页
    * */
    @RequestMapping("pager")
    public Pager pagerRole(Integer page, Integer limit) {
        System.out.print(page);
        System.out.print(limit);

        return noticeService.listPager(page, limit);
    }

    /*
    * 根据id查
    * */
    @RequestMapping("byiddync")
    public ServerResponse byIddync(Integer id) throws Exception {
        System.out.println(id);
        return noticeService.getById(id);

    }


}
