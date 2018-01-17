package com.animo.controller.backviews;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by CHEN JX on 2017/12/27.
 */
@Controller
@RequestMapping("/back/dxmodel")
public class DxmodelBackViews {


    @GetMapping("pagerDxmodel")
    public String pagerSway() {
        return "dxmodel/allDxmodel";
    }

    @GetMapping("add")
    public String add(){
        return "dxmodel/dxmodel_add";
    }
}
