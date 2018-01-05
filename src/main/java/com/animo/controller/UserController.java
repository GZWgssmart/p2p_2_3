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
        user.setUpwd(EncryptUtils.md5(user.getUpwd()));
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

    @PostMapping("updatePwd")
    public ServerResponse updatePwd(String pwd, String nowPwd, String rePwd, HttpSession session) {
        User user = (User) session.getAttribute(Constant.SESSION_ADMIN);
        if(EncryptUtils.md5(pwd).equals(user.getUpwd())) {
            if(EncryptUtils.md5(nowPwd).equals(EncryptUtils.md5(rePwd))) {
                user.setUpwd(EncryptUtils.md5(nowPwd));
                userService.update(user);
                return ServerResponse.createBySuccess("success");
            }else{
                System.out.println(EncryptUtils.md5(nowPwd));
                return ServerResponse.createByError("两次密码不一致");
            }
        }else {
            return ServerResponse.createByError("原密码不正确");
        }
    }

    @PostMapping("saveEmail")
    public ServerResponse saveEmail(User user) {
        return userService.update(user);
    }

    /**
     * 用户身份认证
     * @param user
     * @return
     */
    public ServerResponse check(User user,HttpSession session){
        Object object = session.getAttribute(Constant.SESSION_USER);
        if(object != null){
            user = (User) object;
            if(user.getIdno()!=null && !("").equals(user.getRname())){
                userService.update(user);
                return ServerResponse.createBySuccess("认证信息成功！");
            }else {
                return ServerResponse.createByError("认证失败，填写的认证信息有误！");
            }
        }
        return ServerResponse.createByError("认证失败，登录超时！");
    }



}
