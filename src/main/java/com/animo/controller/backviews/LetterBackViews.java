package com.animo.controller.backviews;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by CHEN JX on 2017/12/26.
 */
@Controller
@RequestMapping("/back/letter")
public class LetterBackViews {

    @GetMapping("letterAdd")
    public String listRoles(){
        return "letter/letter_add";
    }

    @RequestMapping("pageAllLitter")
    public String pagerAllLitter() {
        return "letter/allLitter";
    }


}
