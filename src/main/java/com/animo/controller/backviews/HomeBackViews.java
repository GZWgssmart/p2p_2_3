package com.animo.controller.backviews;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by Administrator on 2018/1/17.
 */
@Controller
@RequestMapping("/back/home")
public class HomeBackViews {

    @GetMapping("save")
    public String save(){
        return "home/addHome";
    }


    @GetMapping("list")
    public String list(){
        return "home/listHome";
    }
}
