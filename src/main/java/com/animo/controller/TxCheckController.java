package com.animo.controller;

import com.animo.common.Pager;
import com.animo.common.ServerResponse;
import com.animo.constant.Constant;
import com.animo.pojo.Huser;
import com.animo.pojo.TxCheck;
import com.animo.pojo.User;
import com.animo.service.TxCheckService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpSession;

/**
 * Created by qm on 2017/12/25.
 *
 * @author qm
 * @date 2017-12-25 10:55
 */
@RestController
@RequestMapping("TxCheck")
public class TxCheckController {

    @Autowired
    private TxCheckService txCheckService;


    /**
     * 管理员对提现申请进行审核
     * @return
     */
    @RequestMapping("PassCheck")
    public ServerResponse passCheck(HttpSession session,TxCheck txCheck){
        Object object = session.getAttribute(Constant.SESSION_USER);
        if (object !=null){
            Huser huser = (Huser) object;
            txCheck.setHuid(huser.getHuid());
            txCheck.setIsok(1);
            return txCheckService.update(txCheck);
        }else {
            return ServerResponse.createByError("您的登录已超时，审核失败!");
        }
    }

    /**
     * 管理员拒绝用户提现申请
     * @return
     */
    @RequestMapping("refuseCheck")
    public ServerResponse refuseCheck(HttpSession session,TxCheck txCheck){
        Object object = session.getAttribute(Constant.SESSION_USER);
        if (object != null){
            Huser huser = (Huser) object;
            txCheck.setIsok(0);
            return txCheckService.update(txCheck);
        }else {
            return ServerResponse.createByError("您的登录已经超时，拒绝审核失败！");
        }
    }

    /**
     * 管理员查看审核记录，分页显示
     * @param page
     * @param limit
     * @return
     */
    @RequestMapping("listRecord/{page}/{limit}")
    public Pager listRecord(@PathVariable("page") int page, @PathVariable("limit") int limit){
        return txCheckService.listPager(page,limit);
    }
}
