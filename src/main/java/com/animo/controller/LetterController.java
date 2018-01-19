package com.animo.controller;

import com.animo.common.Pager;
import com.animo.common.ServerResponse;
import com.animo.pojo.Letter;
import com.animo.service.LetterService;
import com.animo.utils.DateFormateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

/**
 * Created by CHEN JX on 2017/12/25.
 */
@RestController
@RequestMapping("/letter/data/json")
public class LetterController {

    @Autowired
    private LetterService letterService;

    /**
     * 站内信添加
     * @return
     */
    @PostMapping("save")
    public ServerResponse<Letter> save(Letter letter) {
        System.out.println(letter.getStatus());
        letter.setCreatedTime(new Timestamp(Calendar.getInstance().getTimeInMillis()));
        return letterService.save(letter);
    }

    /**
     * 站内信删除
     * @param letter
     * @return
     */
    @RequestMapping("remove")
    public ServerResponse<Letter> removById(Letter letter){
        return letterService.removeById(letter.getLid());
    }

    /**
     * 站内信修改
     * @param letter
     * @return
     */
    @RequestMapping("update")
    public ServerResponse update(Letter letter){
        return letterService.update(letter);
    }


    /**
     * 站内信分页
     * @param
     * @param
     * @return
     */
    @RequestMapping("pager")
    public Pager pager(int page,int limit){
        return letterService.listPager(page,limit);
    }

    @InitBinder
    public void initBinder(WebDataBinder binder) {
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        dateFormat.setLenient(false);
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
    }
}
