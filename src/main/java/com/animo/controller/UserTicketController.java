package com.animo.controller;

import com.animo.common.ServerResponse;
import com.animo.constant.Constant;
import com.animo.pojo.User;
import com.animo.service.UserTicketService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpSession;

/**
 * Created by Animo on 2018-01-20.
 */
@RestController
@RequestMapping("userTicket/data/json")
public class UserTicketController {

    @Autowired
    private UserTicketService userTicketService;

    @GetMapping("list")
    public ServerResponse list(HttpSession session){
        Object object = session.getAttribute(Constant.SESSION_USER);
        if(object!=null){
            User user = (User)object;
            return userTicketService.getByUid(user.getUid());
        }
        return ServerResponse.createBySuccess(null);
    }


    @GetMapping("getMoney")
    public ServerResponse getMoney(Integer ukid){
        return userTicketService.getByUkid(ukid);
    }

}
