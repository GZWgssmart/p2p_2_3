package com.animo.controller;

import com.animo.common.ServerResponse;
import com.animo.constant.Constant;
import com.animo.pojo.User;
import com.animo.service.UserMoneyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpSession;

/**
 * Created by qm on 2018/1/5.
 *
 * @author qm
 * @date 2018-01-05 9:20
 */
@RestController
@RequestMapping("userMoney/data/json")
public class UserMoneyController {

    @Autowired
    private UserMoneyService userMoneyService;
    /**
     * 查询用户资金表的余额
     * @param user
     * @param session
     * @return
     */
    @RequestMapping("selectBanlance")
    public ServerResponse selectBalance(User user, HttpSession session){
        Object object = session.getAttribute(Constant.SESSION_USER);
        if(object != null){
            user = (User) object;
            Integer uid = user.getUid();
            return userMoneyService.selectByUid(uid);
        }
        return ServerResponse.createByError("用户登录失效，请重新登录！");
    }
}
