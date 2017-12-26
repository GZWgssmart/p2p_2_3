package com.animo.controller;

import com.animo.common.Pager;
import com.animo.common.ServerResponse;
import com.animo.constant.Constant;
import com.animo.pojo.LogCz;
import com.animo.pojo.User;
import com.animo.service.LogCzService;
import com.animo.utils.DateFormateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpSession;

/**
 * Created by qm on 2017/12/22.
 *
 * @author qm
 * @date 2017-12-22 15:56
 */
@RestController
@RequestMapping("logCz")
public class LogCzController {

    @Autowired
    private LogCzService logCzService;
    private HttpSession session;
    private LogCz logCz;

    /**
     * 充值
     * @return
     */
    @RequestMapping("recharge")
    public ServerResponse<LogCz> save(){
        User user = (User) session.getAttribute(Constant.SESSION_USER);
        logCz.setUid(user.getUid());
        logCz.setStatus(0);
        logCz.setCreatedTime(DateFormateUtils.Formate());
        return logCzService.save(logCz);
    }

    /**
     * 分页查看充值记录
     * @return
     */
    public Pager listRecord(Integer page,Integer limit){
        return logCzService.listPager(page,limit);
    }
}
