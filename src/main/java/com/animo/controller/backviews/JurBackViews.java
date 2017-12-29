package com.animo.controller.backviews;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author ye
 * 描述：后台角色页面跳转控制器
 */
@Controller
@RequestMapping("/back/jur")
public class JurBackViews {

    @GetMapping("pagerJur")
   public String listRoles(){
       return "jur/jurs";
   }

}
