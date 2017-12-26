package com.animo.controller;

import com.animo.common.Pager;
import com.animo.common.ServerResponse;
import com.animo.pojo.Letter;
import com.animo.service.LetterService;
import com.animo.utils.DateFormateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

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
        letter.setCreatedTime(DateFormateUtils.Formate());
        return letterService.save(letter);
    }

    /**
     * 站内信删除
     * @param lid
     * @return
     */
    @RequestMapping("remove")
    public ServerResponse<Letter> removById(Integer lid){
        return letterService.removeById(lid);
    }

    /**
     * 站内信修改
     * @param letter
     * @return
     */
    @RequestMapping("update")
    public ServerResponse<Letter> update(Letter letter){
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
}
