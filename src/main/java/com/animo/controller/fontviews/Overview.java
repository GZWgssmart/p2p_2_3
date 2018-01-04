package com.animo.controller.fontviews;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by Administrator on 2017/12/28.
 */
@Controller
@RequestMapping("/user")
public class Overview {

    @RequestMapping("accountOverride")
    public String accountOverride(){

        return "account/overview";
    }


}
