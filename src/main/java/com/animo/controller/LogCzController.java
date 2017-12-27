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

    /**
     * 用户充值
     * @return
     */
    @RequestMapping("recharge")
    public ServerResponse<LogCz> save(HttpSession session,LogCz logCz){
        Object object = session.getAttribute(Constant.SESSION_USER);
        if(object != null){
            User user = (User) object;
            logCz.setUid(user.getUid());
            logCz.setStatus(0);
            logCz.setCreatedTime(DateFormateUtils.Formate());
            return logCzService.save(logCz);
        }else {
            return ServerResponse.createByError("您的登录已经超时，充值失败！");
        }

    }

    /**
     * 用户查看充值记录，分页显示
     * @return
     */
    @RequestMapping("listRecord")
    public Pager listRecord(Integer page,Integer limit){
        return logCzService.listPager(page,limit);
    }
}
