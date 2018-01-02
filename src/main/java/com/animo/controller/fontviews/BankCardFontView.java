package com.animo.controller.fontviews;

import com.animo.pojo.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

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
    public String mybank() {
        return "user/bankcard";
    }

    @RequestMapping("add")
    public String add() {
        return "user/addBankCard";
    }

    @RequestMapping("test")
    public String  testBankCardSave(HttpSession session){
        User user = new User();
        user.setUid(1);
        user.setRname("小王");
        user.setIdno(" 410322199202152910");
        session.setAttribute("User",user);
        return "user/bankcard";
    }
}
