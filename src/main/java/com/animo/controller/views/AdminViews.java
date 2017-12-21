package com.animo.controller.views;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by Animo on 2017-12-21.
 */
@Controller
@RequestMapping("/admin/")
public class AdminViews {

    @GetMapping("login")
    public String login(){
        return "admin/login";
    }

    @GetMapping("forget")
    public String forget(){
        return "admin/forget";
    }

    @GetMapping("home")
    public String home(){
        return "admin/home";
    }

    @GetMapping("index")
    public String index(){
        return "admin/index";
    }

}
