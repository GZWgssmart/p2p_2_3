package com.animo.controller;

import com.animo.common.Pager;
import com.animo.common.ServerResponse;
import com.animo.constant.Constant;
import com.animo.pojo.Bankcard;
import com.animo.pojo.LogTx;
import com.animo.pojo.User;
import com.animo.service.BankCardService;
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

    @Autowired
    private BankCardService bankCardService;

    private ServerResponse serverResponse;

    private BigDecimal balance;
    /**
     * 用户申请提现  1是受理中  0是提现成功
     * @return
     */
    @RequestMapping("withdraw")
    public ServerResponse<LogTx> withdraw(HttpSession session, BigDecimal money){
        Object object = session.getAttribute(Constant.SESSION_USER);
        if(object!=null){
            User user = (User)object;
            Bankcard bankcard= bankCardService.getByUid(user.getUid());
            if(bankcard!=null){
                LogTx logTx = new LogTx();
                logTx.setMoney(money);
                //用户id
                logTx.setUid(user.getUid());
                //银行卡号
                logTx.setBankcard(bankcard.getCardno());
                //银行卡类型
                logTx.setBanktype(bankcard.getType());
                logTx.setStatus(1);
                logTx.setCreatedTime(DateFormateUtils.Formate());
                return logTxService.save(logTx);
            }else{
                return ServerResponse.createByError("请绑卡");
            }
        }
        return ServerResponse.createByError("登录超时,请重新登录");
    }

    /**
     * 用户查看提现记录，分页显示
     * @param page
     * @param limit
     * @return
     */
    @RequestMapping("pager")
    public Pager pager(int page, int limit, HttpSession session) {
        User user = (User) session.getAttribute(Constant.SESSION_USER);
        return logTxService.listPagerByUid(page, limit,user.getUid());
    }

    @RequestMapping("listAll")
    public Pager listAll(Integer page, Integer limit) {
        return logTxService.listAll(page,limit);
    }
}
