package com.animo.controller.backviews;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by Animo on 2018-01-07.
 */
@Controller
@RequestMapping("/back/borrowapply")
public class BorrowapplyBackViews {

    @GetMapping("all")
    public String allBorrowapply(){
        return "borrowapply/allBorrowapply";
    }

}
