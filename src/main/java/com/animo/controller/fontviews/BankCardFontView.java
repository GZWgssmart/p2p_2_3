package com.animo.controller.fontviews;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by qm on 2017/12/27.
 *
 * @author qm
 * @date 2017-12-27 20:30
 */
@Controller
@RequestMapping("/bankCard/")
public class BankCardFontView {

    @RequestMapping("mybank")
    public String mybank(){
        return "user/bankcard";
    }

    @RequestMapping("add")
    public String add(){
        return "user/addBankCard";
    }
}
