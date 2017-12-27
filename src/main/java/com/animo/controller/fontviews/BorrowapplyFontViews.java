package com.animo.controller.fontviews;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by Animo on 2017-12-26.
 */
@Controller
@RequestMapping("borrowapply/")
public class BorrowapplyFontViews {

    @GetMapping("all/{bzid}")
    public String all(@PathVariable("bzid") Integer bzid, HttpServletRequest request){
        request.setAttribute("bzid",bzid);
        return "allborrowapply";
    }

}
