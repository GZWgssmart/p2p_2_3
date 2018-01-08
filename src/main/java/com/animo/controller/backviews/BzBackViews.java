package com.animo.controller.backviews;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by CHEN JX on 2017/12/26.
 */
@Controller
@RequestMapping("back/bz")
public class BzBackViews {

    @RequestMapping("pagerBz")
    public String pagerBz() {
        return "bz/allBz";
    }


}
