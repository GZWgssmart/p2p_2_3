package com.animo.controller;

import com.animo.common.Pager;
import com.animo.common.ServerResponse;
import com.animo.constant.Constant;
import com.animo.pojo.LogMoney;
import com.animo.pojo.LogTx;
import com.animo.pojo.User;
import com.animo.pojo.Usermoney;
import com.animo.query.DateQuery;
import com.animo.service.LogMoneyService;
import com.animo.service.LogTxService;
import com.animo.service.UserMoneyService;
import com.animo.utils.DateFormateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpSession;
import java.math.BigDecimal;

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
    @Autowired
    private UserMoneyService userMoneyService;
    @Autowired
    private LogMoneyService logMoneyService;

    private BigDecimal balance;
    /**
     * 用户申请提现
     * @return
     */
    @RequestMapping("withdraw")
    public ServerResponse<LogTx> withdraw(Usermoney usermoney,LogMoney logMoney,HttpSession session,LogTx logTx){
        Object object = session.getAttribute(Constant.SESSION_USER);
        if(object != null ){
            User user = (User) object;
            usermoney = userMoneyService.selectAvailableMoney(user.getUid());
            if((usermoney.getKymoney().compareTo(logTx.getMoney()))==1){
                balance = usermoney.getKymoney().subtract(logTx.getMoney());
                usermoney.setKymoney(balance);
                userMoneyService.update(usermoney);
                logTx.setUid(user.getUid());
                logTx.setStatus(0);
                logTx.setCreatedTime(DateFormateUtils.Formate());
                logMoney.setUid(user.getUid());
                logMoney.setType(1);
                logMoney.setOutlay(logTx.getMoney());
                logMoney.setCreatedTime(logTx.getCreatedTime());
                logMoneyService.save(logMoney);
                return logTxService.save(logTx);
            }else{
                return ServerResponse.createByError("余额不足");
            }
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
    public Pager pager(Integer page, Integer limit, DateQuery dateQuery) {
        return logTxService.listPagerCriteria(page, limit, dateQuery);
    }
}
