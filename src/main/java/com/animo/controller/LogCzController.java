package com.animo.controller;

import com.animo.common.Pager;
import com.animo.common.ServerResponse;
import com.animo.constant.Constant;
import com.animo.pojo.Bankcard;
import com.animo.pojo.LogCz;
import com.animo.pojo.User;
import com.animo.service.BankCardService;
import com.animo.service.LogCzService;
import com.animo.service.UserMoneyService;
import com.animo.utils.DateFormateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpSession;
import java.math.BigDecimal;

/**
 * Created by qm on 2017/12/22.
 *
 * @author qm
 * @date 2017-12-22 15:56
 */
@RestController
@RequestMapping("/logCz/data/json/")
public class LogCzController {

    @Autowired
    private LogCzService logCzService;

    @Autowired
    private UserMoneyService userMoneyService;

    @Autowired
    private BankCardService bankCardService;

    private ServerResponse serverResponse;

    private BigDecimal balance;
    /**
     * 用户充值
     * @return
     */
    @RequestMapping("recharge")
    public ServerResponse<LogCz> save(HttpSession session, BigDecimal money){
        Object object = session.getAttribute(Constant.SESSION_USER);
        if(object!=null){
            User user = (User)object;
            Bankcard bankcard  = bankCardService.getByUid(user.getUid());
            if(bankcard!=null){
                LogCz logCz = new LogCz();
                logCz.setMoney(money);
                //用户id
                logCz.setUid(user.getUid());
                //银行卡号
                logCz.setBankcard(bankcard.getCardno());
                //银行卡类型
                logCz.setBanktype(bankcard.getType());
                logCz.setCreatedTime(DateFormateUtils.Formate());
                return logCzService.save(logCz);
            }else{
               return ServerResponse.createByError("请绑卡");
            }
        }
        return ServerResponse.createByError("登录超时,请重新登录");
    }

    /**
     * 用户查看充值记录，分页显示
     * @return
     */
    @RequestMapping("pager")
    public Pager listRecord(int page, int limit, HttpSession session){
        User user = (User) session.getAttribute(Constant.SESSION_USER);
        return logCzService.listPagerByUid(page,limit,user.getUid());
    }
}
