package com.animo.controller;

import com.animo.common.*;
import com.animo.constant.Constant;
import com.animo.pojo.Rzvip;
import com.animo.pojo.User;
import com.animo.pojo.Usermoney;
import com.animo.service.RzvipService;
import com.animo.service.UserMoneyService;
import com.animo.service.UserService;
import com.animo.utils.DateFormateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Collections;
import java.util.Date;
import java.util.List;

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
    public ServerResponse register(User user){
        user.setUpwd(EncryptUtils.md5(user.getUpwd()));
        user.setResstr1(getRandomFourNum());
        user.setResint1(DateFormateUtils.Formate());
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

    @PostMapping("updateInfo")
    public ServerResponse updateInfo(User user,HttpSession session){
        Object object = session.getAttribute(Constant.SESSION_USER);
        if(object!=null){
            return userService.update(user);
        }
        return ServerResponse.createByError("登录超时");
    }

    @RequestMapping(value="getByPhone/{phone}", method = RequestMethod.GET)
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
        return userService.listPager(page, limit);
    }

    //退出
    @RequestMapping("logout")
    public ServerResponse logout(HttpSession session) {
        Object object = session.getAttribute(Constant.SESSION_USER);
        if(object!=null){
            session.invalidate();
            return  ServerResponse.createBySuccess();
        }
        return ServerResponse.createByError("登录超时");
    }

    @PostMapping("updatePwd")
    public ServerResponse updatePwd(String pwd, String nowPwd, String rePwd, HttpSession session) {
        User user = (User) session.getAttribute(Constant.SESSION_USER);
        if(EncryptUtils.md5(pwd).equals(user.getUpwd())) {
            if(EncryptUtils.md5(nowPwd).equals(EncryptUtils.md5(rePwd))) {
                user.setUpwd(EncryptUtils.md5(nowPwd));
                userService.update(user);
                return ServerResponse.createBySuccess("success");
            }else{
                return ServerResponse.createByError("两次密码不一致");
            }
        }else {
            return ServerResponse.createByError("原密码不正确");
        }
    }

    @PostMapping("saveEmail")
    public ServerResponse saveEmail(User user) {
        int a = userService.getByEmail(user.getEmail());
        if(a == 0) {
            userService.update(user);
            return ServerResponse.createBySuccess("success");
        }else{
            return ServerResponse.createByError("error");
        }

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




/*
* 六位推荐码
* */
    public static String getRandomFourNum() {
        String[] beforeShuffle = new String[] {"1", "2", "3", "4", "5", "6", "7",
                "8", "9" };
        List list = Arrays.asList(beforeShuffle);
        Collections.shuffle(list);
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < list.size(); i++) {
            sb.append(list.get(i));
        }
        String afterShuffle = sb.toString();
        String result = afterShuffle.substring(2,8 );
        return result;
    }

/*
* 根据id查
* */
    @RequestMapping("byiddync")
    public ServerResponse byIddync(Integer id)throws Exception{
        System.out.println(id);
        return  userService.getById(id);

    }

    /*用条件查所有数据加分页*/
    @GetMapping("PagerCriteria")
    public Pager PagerCriteria(int page, int limit,String resstr2){
        return userService.listPagerCriteria(page,limit,resstr2);
    }

    @InitBinder
    public void initBinder(WebDataBinder binder) {
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        dateFormat.setLenient(false);
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
    }

}
