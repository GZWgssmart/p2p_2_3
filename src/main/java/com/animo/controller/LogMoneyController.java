package com.animo.controller;

import com.animo.common.Pager;
import com.animo.constant.Constant;
import com.animo.pojo.User;
import com.animo.service.LogMoneyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpSession;

/**
 * Created by qm on 2018/1/3.
 *
 * @author qm
 * @date 2018-01-03 10:38
 */
@RestController
@RequestMapping("/logMoney/data/json")
public class LogMoneyController {

    @Autowired
    private LogMoneyService logMoneyService;

    /**
     * 分页显示资金流向记录
     * @param page
     * @param limit
     * @return
     */
    @RequestMapping("pager")
    public Pager pager(int page, int limit, Integer type, HttpSession session) {
        User user = (User)session.getAttribute(Constant.SESSION_USER);
        return logMoneyService.listPagerByTypeAndUid(page, limit, type,user.getUid());
    }


}
