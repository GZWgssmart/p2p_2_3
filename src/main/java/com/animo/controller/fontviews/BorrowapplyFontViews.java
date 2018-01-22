package com.animo.controller.fontviews;

import com.animo.constant.Constant;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * Created by Animo on 2017-12-26.
 */
@Controller
@RequestMapping("borrowapply/")
public class BorrowapplyFontViews {


    @GetMapping("all/{bzid}")
    public String all(@PathVariable("bzid") Integer bzid,HttpServletRequest request){
        request.setAttribute("bzid",bzid);
        return "allborrowapply";
    }


    @GetMapping("info/{baid}/{bdid}/{bzname}")
    public String info( @PathVariable("baid") Integer baid, @PathVariable("bdid") Integer bdid,@PathVariable("bzname") String bzname,HttpServletRequest request){
        request.setAttribute("baid",baid);
        request.setAttribute("bdid",bdid);
        request.setAttribute("bzname",bzname);
        return "borrowapplyInfo";
    }

    @GetMapping("add")
    public String add(HttpSession session){
        if(session.getAttribute(Constant.SESSION_USER)==null){
            return "user/login";
        }
        return "borrowapply/addBorrowapply";
    }

    @GetMapping("calc")
    public String calc(){
        return "calculator";
    }
}
