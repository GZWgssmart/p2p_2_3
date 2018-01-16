package com.animo.controller.fontviews;

import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by Animo on 2017-12-21.
 */
@Controller
@RequestMapping("/user/")
public class UserFontViews {

    @GetMapping("login")
    public String login(){
        return "user/login";
    }

    @GetMapping("register")
    public String register(Integer code, HttpServletRequest request){
        if(code!=null){
            request.setAttribute("code",code);
        }
        return "user/register";
    }

    @GetMapping("important")
    public String important(){
        return "user/important";
    }

    @GetMapping("recharge")
    public String Recharge(){
        return "user/recharge";
    }

}
