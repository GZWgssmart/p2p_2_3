package com.animo.controller.fontviews;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

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

    @GetMapping("regist")
    public String regist(){
        return "user/regist";
    }

}
