package com.animo.controller.backviews;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by CHEN JX on 2018/1/10.
 */
@Controller
@RequestMapping("/back/font")
public class FontBackViews {

    @RequestMapping("investment")
    public String investment() {
        return "font/investment";
    }

    @RequestMapping("security")
    public String security(){
        return "font/security";
    }

    @RequestMapping("information")
    public String information(){
        return "font/information";
    }

    @RequestMapping("cyjg")
    public String cyjg(){
        return "font/xxpl/cyjg";
    }
    @RequestMapping("ptyy")
    public String ptyy(){
        return "font/xxpl/ptyy";
    }
    @RequestMapping("jkxm")
    public String jkxm(){
        return "font/xxpl/jkxm";
    }
    @RequestMapping("gdbj")
    public String gdbj(){
        return "font/xxpl/gdbj";
    }
    @RequestMapping("gsjj")
    public String gsjj(){
        return "font/xxpl/gsjj";
    }
    @RequestMapping("ptzi")
    public String ptzi(){
        return "font/xxpl/ptzi";
    }
    @RequestMapping("gwtd")
    public String gwtd(){
        return "font/xxpl/gwtd";
    }
    @RequestMapping("gsdt")
    public String gsdt(){
        return "font/xxpl/gsdt";
    }
    @RequestMapping("ptgg")
    public String ptgg(){
        return "font/xxpl/ptgg";
    }
    @RequestMapping("znxs")
    public String znxs(){
        return "font/xxpl/znxs";
    }
    @RequestMapping("lxwm")
    public String lxwm(){
        return "font/xxpl/lxwm";
    }
}
