package com.animo.controller.fontviews;


import com.animo.constant.Constant;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

/**
 * Created by Administrator on 2017/12/28.
 */
@Controller
@RequestMapping("/user")
public class Overview {

    @RequestMapping("accountOverride")
    public String accountOverride(HttpSession session){
        Object object = session.getAttribute(Constant.SESSION_USER);
        if(object!=null){
            return "account/overview";
        }
        return "user/login";
    }


}
