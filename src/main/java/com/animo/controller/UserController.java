package com.animo.controller;

import com.animo.common.EncryptUtils;
import com.animo.common.Pager;
import com.animo.common.ServerResponse;
import com.animo.constant.Constant;
import com.animo.pojo.Rzvip;
import com.animo.pojo.User;
import com.animo.pojo.Usermoney;
import com.animo.service.RzvipService;
import com.animo.service.UserMoneyService;
import com.animo.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;

/**
 * Created by Administrator on 2017/12/25.
 */
@RestController
@RequestMapping("/user/data/json")
public class UserController {

    @Autowired
    private UserService userService;

    @Autowired
    private RzvipService rzvipService;

    @Autowired
    private UserMoneyService userMoneyService;


    @RequestMapping(value="register", method = RequestMethod.POST)
    public ServerResponse register(User user, HttpSession session){
       ServerResponse serverResponse = userService.save(user);
       if (serverResponse.isSuccess()) {
           Rzvip revip = new Rzvip();
           revip.setUid(user.getUid());
           rzvipService.save(revip);
           Usermoney usermoney = new Usermoney();
           usermoney.setUid(user.getUid());
           userMoneyService.save(usermoney);
           return ServerResponse.createBySuccess("success");
       }
        return ServerResponse.createByError("error");
    }

    @RequestMapping(value="getByPhone/{phone}", method = RequestMethod.POST)
    public ServerResponse getByPhone(@PathVariable("phone") String phone) {
        int user = userService.getByPhone(phone);
        if(user == 0) {
            return ServerResponse.createBySuccess("success");
        }else{
            return ServerResponse.createByError("error");
        }
    }

    @RequestMapping(value="login", method = RequestMethod.POST)
    public ServerResponse login(String phone, String upwd, HttpSession session) {
        User user = userService.getByPhonePwd(phone, EncryptUtils.md5(upwd));
        if(user != null) {
            session.setAttribute(Constant.SESSION_USER, user);
            return ServerResponse.createBySuccess("success", user);
        }
        return ServerResponse.createByError("error");
    }

    @GetMapping(value="list")
    public Pager list(int page, int limit) {
        return userService.listPager(page-0, limit-1);
    }

    //退出
    @RequestMapping("logout")
    public String logout(HttpSession session) {
        User user = (User)session.getAttribute(Constant.SESSION_USER);
        session.invalidate();
        return "index";
    }

}
