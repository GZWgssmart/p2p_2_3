package com.animo.controller.backviews;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by Animo on 2017-12-22.
 */
@Controller
@RequestMapping("/back/jklx")
public class JklxBackViews {

    @GetMapping("save")
    public String save(){
        return null;
    }

    @GetMapping("updateStatus")
    public String updateStatus(){
        return null;
    }

    @GetMapping("pager")
    public String pager(){
        return null;
    }

    @GetMapping("pagerJklx")
    public String jklx(){
        return "jklx/allJklx";
    }
}
