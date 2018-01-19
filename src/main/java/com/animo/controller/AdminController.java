package com.animo.controller;

import com.animo.common.CustomToken;
import com.animo.common.EncryptUtils;
import com.animo.common.Pager;
import com.animo.common.ServerResponse;
import com.animo.constant.Constant;
import com.animo.pojo.Huser;
import com.animo.service.HuserService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AccountException;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;

/**
 * Created by Administrator on 2017/12/25.
 */
@RestController
@RequestMapping("/admin/data/json")
public class AdminController {

    @Autowired
    private HuserService huserService;

    @RequestMapping("login")
    public ServerResponse login(String phone, String pwd, String code) {
        Subject subject = SecurityUtils.getSubject();
        Session session = subject.getSession();
        CustomToken token = new CustomToken(phone, pwd, (String) session.getAttribute("code"), code);
        try {
            subject.login(token);
            return ServerResponse.createBySuccess("success");
        } catch (AccountException e) {
            return ServerResponse.createByError("登陆失败:"+e.getMessage());
        }
    }

    @PostMapping("getByPhone/{phone}")
    public ServerResponse getByPhone(@PathVariable("phone") String phone) {
        int user = huserService.getByPhone(phone);
        if (user == 0) {
            return ServerResponse.createBySuccess("success");
        } else {
            return ServerResponse.createByError("error");
        }
    }

    @PostMapping("add")
    public ServerResponse add(Huser huser) {
        huser.setResstr1(EncryptUtils.md5(huser.getResstr1()));
        return huserService.save(huser);
    }

    @GetMapping(value = "list")
    public Pager list(int page, int limit) {
        return huserService.listPager(page - 0, limit - 1);
    }



    @PostMapping("updatePwd")
    public ServerResponse updatePwd(String pwd, String nowPwd, String rePwd, HttpSession session) {
        Huser huser = (Huser) session.getAttribute(Constant.SESSION_ADMIN);
        if (EncryptUtils.md5(pwd).equals(huser.getResstr1())) {
            if (EncryptUtils.md5(nowPwd).equals(EncryptUtils.md5(rePwd))) {
                huserService.updatePwd(EncryptUtils.md5(nowPwd), huser.getHuid());
                return ServerResponse.createBySuccess("success");
            } else {
                return ServerResponse.createByError("两次密码不一致");
            }
        } else {
            return ServerResponse.createByError("原密码不正确");
        }
    }

    @PostMapping("update")
    public ServerResponse update(Huser huser) {
        return huserService.update(huser);
    }


}
