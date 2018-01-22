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
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
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
    //@RequiresPermissions("txCheck:check")
    public ServerResponse passCheck(HttpSession session, TxCheckVO txCheckvo) {
//        Object object = session.getAttribute(Constant.SESSION_ADMIN);
//        if(object!=null){
        return txCheckService.save(txCheckvo);
//        }
//        return  ServerResponse.createByError("登录超时");
    }

    /**
     * 管理员查看审核记录，分页显示
     * @param page
     * @param limit
     * @return
     */
    @RequestMapping("listRecord")
//    @RequiresPermissions("txCheck:listRecord")
    public Pager listRecord(Integer page,Integer limit){
        return txCheckService.listPager(page,limit);
    }

    @RequestMapping("delete/{txid}")
//    @RequiresPermissions("txCheck:check")
    public ServerResponse<TxCheck> deleteRecord(@PathVariable Integer txid){
        return txCheckService.removeById(txid);
    }
}
