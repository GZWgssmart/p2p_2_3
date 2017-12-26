package com.animo.controller;

import com.animo.common.EncryptUtils;
import com.animo.common.Pager;
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

    @PostMapping("getByPhone/{phone}")
    public ServerResponse getByPhone(@PathVariable("phone") String phone) {
        int user = huserService.getByPhone(phone);
        if(user == 0) {
            return ServerResponse.createBySuccess("success");
        }else{
            return ServerResponse.createByError("error");
        }
    }

    @PostMapping("add")
    public ServerResponse add(Huser huser) {
        huser.setResstr1(EncryptUtils.md5(huser.getResstr1()));
        int hu = huserService.saveHuser(huser);
        if(hu == 1) {
            return ServerResponse.createBySuccess("success");
        }else{
            return ServerResponse.createByError("error");
        }
    }

    @GetMapping(value="list")
    public Pager list(int page, int limit) {
        return huserService.listPager(page-0, limit-1);
    }

}
