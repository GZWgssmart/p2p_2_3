package com.animo.controller.backviews;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by CHEN JX on 2017/12/27.
 */
@Controller
@RequestMapping("back/sway")
public class SwayBackViews {


    @GetMapping("pagerSway")
    public String pagerSway() {
        return "sway/allSway";
    }

    @RequestMapping("swayAdd")
    public String swayAdd() {
        return "sway/sway_add";
    }
}
