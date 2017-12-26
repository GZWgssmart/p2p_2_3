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
    private HttpSession session;
    private TxCheck txCheck;

    /**
     * 通过审核
     * @return
     */
    @RequestMapping("PassCheck")
    public ServerResponse passCheck(){
        Huser huser = (Huser) session.getAttribute(Constant.SESSION_USER);
        txCheck.setHuid(huser.getHuid());
        txCheck.setIsok(1);
        return txCheckService.update(txCheck);
    }

    /**
     * 拒绝审核
     * @return
     */
    @RequestMapping("refuseCheck")
    public ServerResponse refuseCheck(){
        txCheck.setIsok(0);
        return txCheckService.update(txCheck);
    }

    /**
     * 分页查看提现需要审核记录
     * @param page
     * @param limit
     * @return
     */
    @RequestMapping("listRecord")
    public Pager listRecord(Integer page,Integer limit){
        return txCheckService.listPager(page,limit);
    }
}
