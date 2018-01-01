package com.animo.controller.backviews;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * Created by Administrator on 2017/12/25.
 */
@Controller
@RequestMapping("/back/dyna")
public class DynamicBackViews {

    @GetMapping("save")
    public String save(){
        return "dynamic/addDynamic";
    }

    @GetMapping("savepic")
    public String savepic(){
        return "dynamic/adddyna";
    }

    @GetMapping("pager")
    public String pager(){
        return "dynamic/listdyna";
    }

    @GetMapping("byiddync")
    public ModelAndView byIddync(Integer id){
        ModelAndView mav = new ModelAndView("dynamic/listdynamic");
        mav.addObject("id",id);
        return mav;
    }

    @GetMapping("upddync")
    public ModelAndView upddync(Integer id){
        ModelAndView mav = new ModelAndView("dynamic/upddyna");
        mav.addObject("id",id);
        return mav;
    }

    @GetMapping("removedyna")
    public ModelAndView removedyna(Integer id){
        ModelAndView mav = new ModelAndView("dynamic/listdynamic");
        mav.addObject("id",id);
        return mav;
    }


}
