package com.animo.controller;

import com.animo.common.Pager;
import com.animo.common.ServerResponse;
import com.animo.constant.Constant;
import com.animo.pojo.Huser;
import com.animo.pojo.LogTx;
import com.animo.pojo.TxCheck;
import com.animo.pojo.User;
import com.animo.service.LogTxService;
import com.animo.service.TxCheckService;
import com.animo.utils.DateFormateUtils;
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
@RequestMapping("/txCheck/data/json/")
public class TxCheckController {

    @Autowired
    private TxCheckService txCheckService;
    @Autowired
    private LogTxService logTxService;


    /**
     * 管理员对提现申请进行审核
     * @return
     */
    @RequestMapping("passCheck")
    public ServerResponse passCheck(HttpSession session,LogTx logTx){
        Object object = session.getAttribute(Constant.SESSION_USER);
        if (object !=null){
            Huser huser = (Huser) object;
            logTx.setStatus(1);
            logTx.setCreatedTime(DateFormateUtils.Formate());
            return txCheckService.update(logTx);
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
    @RequestMapping("listRecord")
    public Pager listRecord(Integer page,Integer limit){
        return txCheckService.listPager(page,limit);
    }
}
