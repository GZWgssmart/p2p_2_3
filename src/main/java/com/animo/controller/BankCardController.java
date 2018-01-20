package com.animo.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.TypeReference;
import com.animo.common.BankResult;
import com.animo.common.ServerResponse;
import com.animo.constant.Constant;
import com.animo.pojo.Bankcard;
import com.animo.pojo.User;
import com.animo.service.BankCardService;
import com.animo.utils.DateFormateUtils;
import com.animo.utils.HttpSendUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
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
@RequestMapping("/bankcard/data/json/")
public class BankCardController {

    @Autowired
    private BankCardService bankCardService;

    /**
     * 用户绑定银行卡
     * @param session
     * @param bankcard
     * @return
     */
    @RequestMapping("save")
    public ServerResponse<Bankcard> bindBankCard(HttpSession session,Bankcard bankcard){
        Object object = session.getAttribute(Constant.SESSION_USER);
        if(object != null){
            User user = (User) object;
//           Object object1 = JSON.parseObject(HttpSendUtils.sendPost("http://localhost:8081/bind",
//                    "realName="+user.getRname()+"&bankCardNo="+bankcard.getIdno()+"&bank="+bankcard.getType()+"&phone="+user.getPhone()), new TypeReference<BankResult>(){});
//           if(object1!=null){
//               BankResult bankResult = (BankResult) object1;
//               if(bankResult.getCode()==1000){
                   bankcard.setUid(user.getUid());
                   bankcard.setRname(user.getRname());
                   bankcard.setIdno(user.getIdno());
                   bankcard.setStatus(0);
                   bankcard.setBktime(DateFormateUtils.Formate());
                   return bankCardService.save(bankcard);
//               }
//               return ServerResponse.createByError(bankResult.getMessage());
//           }

        }
        return ServerResponse.createByError("您的登录已经超时,绑定失败！");
    }

    /**
     * 查询出用户绑定的所有的银行卡
     * @param session
     * @return
     */
    @RequestMapping("list")
    public ServerResponse<Bankcard> listBankCards(HttpSession session){
        Object object = session.getAttribute(Constant.SESSION_USER);
        if(object != null){
            User user = (User) object;
            return bankCardService.getById(user.getUid());
        }else {
            return ServerResponse.createByError("您的登录已经超时，请重新登录！");
        }
    }

    /**
     * 用户对银行卡解除绑定
     * @param session
     * @return
     */
    @RequestMapping("delete/{bcid}")
    public ServerResponse<Bankcard> deleteBankCards(HttpSession session,@PathVariable("bcid") Integer bcid){
        Object object = session.getAttribute(Constant.SESSION_USER);
        if(object != null){
            return bankCardService.removeById(bcid);
        }else {
            return ServerResponse.createByError("您的登录已经超时，请重新登录！");
        }
    }

}
