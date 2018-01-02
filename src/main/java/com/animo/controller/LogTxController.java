package com.animo.controller;

import com.animo.common.Pager;
import com.animo.common.ServerResponse;
import com.animo.constant.Constant;
import com.animo.pojo.LogTx;
import com.animo.pojo.User;
import com.animo.pojo.Usermoney;
import com.animo.query.TxRecordQuery;
import com.animo.service.LogTxService;
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
 * @date 2017-12-25 8:55
 */
@RestController
@RequestMapping("/LogTx/data/json/")
public class LogTxController {

    @Autowired
    private LogTxService logTxService;

    private Usermoney usermoney;

    /**
     * 用户申请提现
     * @return
     */
    @RequestMapping("withdraw")
    public ServerResponse<LogTx> withdraw(HttpSession session,LogTx logTx){
        Object object = session.getAttribute(Constant.SESSION_USER);
        if(object != null ){
            User user = (User) object;
            logTx.setUid(user.getUid());
            logTx.setStatus(0);
            logTx.setMoney(usermoney.getKymoney());
            logTx.setCreatedTime(DateFormateUtils.Formate());
            return logTxService.save(logTx);
        }else {
            return ServerResponse.createByError("您的登录已经超时，申请提现失败！");
        }
    }

    /**
     * 用户查看提现记录，分页显示
     * @param page
     * @param limit
     * @return
     */
    @RequestMapping("pager_criteria")
    public Pager pager(Integer page, Integer limit, TxRecordQuery txRecordQuery) {
        return logTxService.listPagerCriteria(page, limit, txRecordQuery);
    }
}
