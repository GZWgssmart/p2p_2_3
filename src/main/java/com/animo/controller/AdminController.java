package com.animo.controller;

import com.animo.common.EncryptUtils;
import com.animo.common.Pager;
import com.animo.common.ServerResponse;
import com.animo.constant.Constant;
import com.animo.pojo.Huser;
import com.animo.service.HuserService;
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

    //退出
    @GetMapping("logout")
    public String logout(HttpSession session) {
        Huser huser = (Huser)session.getAttribute(Constant.SESSION_ADMIN);
        session.invalidate();
        return "/index";
    }

    @PostMapping("updatePwd")
    public ServerResponse updatePwd(String pwd, String nowPwd, String rePwd, HttpSession session) {
        Huser huser = (Huser) session.getAttribute(Constant.SESSION_ADMIN);
        System.out.println("原密码："+huser.getResstr1());
        System.out.println("输入的原密码"+EncryptUtils.md5(pwd));
        if(EncryptUtils.md5(pwd).equals(huser.getResstr1())) {
            if(EncryptUtils.md5(nowPwd).equals(EncryptUtils.md5(rePwd))) {
                huserService.updatePwd(EncryptUtils.md5(nowPwd), huser.getHuid());
                return ServerResponse.createBySuccess("success");
            }else{
                System.out.println(EncryptUtils.md5(nowPwd));
                return ServerResponse.createByError("两次密码不一致");
            }
        }else {
            return ServerResponse.createByError("原密码不正确");
        }
    }

    @PostMapping("update")
    public ServerResponse update(Huser huser) {
        return huserService.update(huser);
    }


}
