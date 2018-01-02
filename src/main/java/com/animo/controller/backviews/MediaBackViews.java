package com.animo.controller.backviews;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * Created by Administrator on 2017/12/25.
 */
@Controller
@RequestMapping("/back/med")
public class MediaBackViews {

    @GetMapping("save")
    public String save(){
        return "media/addMedia";
    }

    @GetMapping("savepic")
    public String savepic(){
        return "media/addmed";
    }

    @GetMapping("pager")
    public String pager(){
        return "media/listmed";
    }

    @GetMapping("byiddync")
    public ModelAndView byIddync(Integer id){
        ModelAndView mav = new ModelAndView("media/listMedia");
        mav.addObject("id",id);
        return mav;
    }

    @GetMapping("updmed")
    public ModelAndView upddync(Integer id){
        ModelAndView mav = new ModelAndView("media/updmed");
        mav.addObject("id",id);
        return mav;
    }

    @GetMapping("removemed")
    public ModelAndView removedyna(Integer id){
        ModelAndView mav = new ModelAndView("media/listMedia");
        mav.addObject("id",id);
        return mav;
    }


}
