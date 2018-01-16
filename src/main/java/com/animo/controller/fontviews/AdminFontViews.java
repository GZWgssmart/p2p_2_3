package com.animo.controller.fontviews;

import org.apache.shiro.SecurityUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

/**
 * Created by Animo on 2017-12-21.
 */
@Controller
@RequestMapping("/admin/")
public class AdminFontViews {

    @GetMapping("login")
    public String login(){
        return "admin/login";
    }

    @GetMapping("forget")
    public String forget(){
        return "admin/forget";
    }

    //退出
    @GetMapping("logout")
    public String logout(HttpSession session) {
        //shiro完成退出
        SecurityUtils.getSubject().logout();
        return "admin/login";
    }
}
