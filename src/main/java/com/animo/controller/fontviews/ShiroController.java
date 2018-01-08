package com.animo.controller.fontviews;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/shiro/")
public class ShiroController {

    /**
     * 无权限跳转页面
     * @return
     */
    @RequestMapping("Unauthorized")
    public String refuse(){
        return "shiro/Unauthorized";
    }
}
