package com.animo.controller;

import com.animo.common.EncryptUtils;
import com.animo.common.ServerResponse;
import com.animo.constant.Constant;
import com.animo.pojo.Huser;
import com.animo.service.HuserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.ServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Created by Administrator on 2017/12/25.
 */
@RestController
@RequestMapping("/admin/data/json")
public class AdminController {

    @Autowired
    private HuserService huserService;

   // @PostMapping("login")
    @RequestMapping(value="login", method = RequestMethod.POST)
    //@ResponseBody
    public ServerResponse login(HttpSession session, String phone, String pwd, String code) {
        ServerResponse serverResponse = null;
        Object checkObj = session.getAttribute("code");
        if (checkObj != null) {
            String checkCode = (String) checkObj;
            if (checkCode.equalsIgnoreCase(code)) {
                Huser huser = huserService.getByPhonePwd(phone, EncryptUtils.md5(pwd));
                if (huser != null) {
                    session.setAttribute(Constant.SESSION_ADMIN, huser);
                    serverResponse = ServerResponse.createBySuccess("success", huser);
                } else {
                    serverResponse = ServerResponse.createByError("error");
                }
            } else {
                serverResponse = ServerResponse.createByError("code_error");
            }
        }
        return serverResponse;
    }


}
