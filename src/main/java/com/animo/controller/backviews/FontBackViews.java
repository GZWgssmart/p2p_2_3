package com.animo.controller.backviews;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by CHEN JX on 2018/1/10.
 */
@Controller
@RequestMapping("/back/font")
public class FontBackViews {

    @RequestMapping("investment")
    public String investment() {
        return "font/investment";
    }

    @RequestMapping("security")
    public String security(){
        return "font/security";
    }

    @RequestMapping("information")
    public String information(){
        return "font/information";
    }
}
