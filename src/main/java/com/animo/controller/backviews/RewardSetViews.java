package com.animo.controller.backviews;

/**
 * Created by Administrator on 2018/1/2.
 */

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/back/rewardset")
public class RewardSetViews {

    @GetMapping("add")
    public String add() {
        return "rewardset/add";
    }

    @GetMapping("list")
    public String list() {
        return "rewardset/list";
    }

}
