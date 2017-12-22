package com.animo.controller;

import com.animo.common.ServerResponse;
import com.animo.constant.Constant;
import com.animo.pojo.Huser;
import com.animo.pojo.Shborrow;
import com.animo.service.ShborrowService;
import com.animo.utils.DateFormateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpSession;

/**
 * Created by Animo on 2017-12-22.
 */
@RestController
@RequestMapping("/shborrow/data/json")
public class ShborrowController {

    @Autowired
    private ShborrowService shborrowService;

    @PostMapping("save")
    public ServerResponse save(Shborrow shborrow, HttpSession session,Integer baid){
        Object object = session.getAttribute(Constant.SESSION_ADMIN);
        if(object!=null){
            Huser huser = (Huser)object;
            shborrow.setHuid(huser.getHuid());//后台用户id
            shborrow.setBaid(baid);//借款id
            shborrow.setCktime(DateFormateUtils.Formate());//审核时间
            return shborrowService.save(shborrow);
        }
       return ServerResponse.createByError("登录超时");
    }

}
