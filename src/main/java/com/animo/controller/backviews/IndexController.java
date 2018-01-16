package com.animo.controller.backviews;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by CHEN JX on 2018/1/10.
 */
@Controller
@RequestMapping("/")
public class IndexController {

    @RequestMapping("index")
    public String index() {
        return "index";
    }

    @RequestMapping("calculator")
    public String calcultor() {
        return "calculator";
    }
}
