package com.animo.controller.backviews;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * Created by Administrator on 2017/12/25.
 */
@Controller
@RequestMapping("/back/not")
public class NoticeBackViews {

    @GetMapping("save")
    public String save(){
        return "notice/addNotice";
    }


    @GetMapping("pager")
    public String pager(){
        return "notice/listNot";
    }

    @GetMapping("byiddync")
    public ModelAndView byIddync(Integer id){
        ModelAndView mav = new ModelAndView("notice/listNotice");
        mav.addObject("id",id);
        return mav;
    }

    @GetMapping("updnot")
    public ModelAndView upddync(Integer id){
        ModelAndView mav = new ModelAndView("notice/updNot");
        mav.addObject("id",id);
        return mav;
    }

    @GetMapping("removenot")
    public ModelAndView removedyna(Integer id){
        ModelAndView mav = new ModelAndView("notice/listMedia");
        mav.addObject("id",id);
        return mav;
    }


}
