package com.animo.controller;

import com.animo.common.Pager;
import com.animo.common.ServerResponse;
import com.animo.constant.Constant;
import com.animo.pojo.*;
import com.animo.service.LogTxService;
import com.animo.service.TxCheckService;
import com.animo.utils.DateFormateUtils;
import com.animo.vo.TxCheckVO;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpSession;
import java.math.BigDecimal;

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



    /**
     * 管理员对提现申请进行审核
     * @return
     */
    @RequestMapping("check")
    public ServerResponse passCheck(HttpSession session, TxCheckVO txCheckVO, TxCheck txCheck, Usermoney usermoney, LogMoney logMoney){
//        Object object = session.getAttribute(Constant.SESSION_ADMIN);

        txCheck.setTxid(txCheckVO.getTxid());
//        if (object != null){
//            Huser huser = (Huser) object;
            txCheck.setHuid(1);
            txCheck.setIsok(txCheckVO.getStatus());
            txCheck.setExcuse(txCheckVO.getExcuse());
            txCheck.setTxid(txCheckVO.getTxid());
            txCheck.setCreatedTime(DateFormateUtils.Formate());
            //提现成功
            if(txCheck.getIsok()==1 && StringUtils.isEmpty(txCheck.getExcuse())){
                return txCheckService.updateUserMoneyAndLogMoney(usermoney,logMoney,txCheckVO);
                //提现失败
            }else if(txCheck.getIsok()==2 && StringUtils.isEmpty(txCheck.getExcuse())){
                return txCheckService.updateUserMoneyAndLogMoney(usermoney,logMoney,txCheckVO);
            //理由不够充分
            }else{
                return ServerResponse.createByError("请填写审核理由");
            }

//        }else {
//            return ServerResponse.createByError("您的登录已超时，审核失败!");
//        }
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
