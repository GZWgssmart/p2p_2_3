package com.animo.controller;

import com.animo.common.ServerResponse;
import com.animo.constant.Constant;
import com.animo.pojo.Bankcard;
import com.animo.pojo.User;
import com.animo.service.BankCardService;
import com.animo.utils.DateFormateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpSession;
import java.util.Date;

/**
 * Created by qm on 2017/12/22.
 *
 * @author qm
 * @date 2017-12-22 9:01
 */
@RestController
@RequestMapping("bankCard")
public class BankCardController {

    @Autowired
    private BankCardService bankCardService;
    private HttpSession session;
    private ServerResponse serverResponse;
    private Bankcard bankcard;

    @RequestMapping("save")
    public ServerResponse<Bankcard> bindBankCard(Bankcard bankcard){
        User user = (User) session.getAttribute(Constant.SESSION_USER);
        bankcard.setUid(user.getUid());
        bankcard.setStatus(0);
        bankcard.setBktime(DateFormateUtils.Formate());
        return bankCardService.save(bankcard);
    }
}
