package com.animo.controller;

import com.animo.common.Pager;
import com.animo.common.ServerResponse;
import com.animo.constant.Constant;
import com.animo.pojo.Huser;
import com.animo.pojo.Shborrow;
import com.animo.service.BorrowapplyService;
import com.animo.service.ShborrowService;
import com.animo.utils.DateFormateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpSession;

/**
 * Created by Animo on 2017-12-22.
 * 借款审核
 */
@RestController
@RequestMapping("/shborrow/data/json")
public class ShborrowController {

    @Autowired
    private ShborrowService shborrowService;

    @Autowired
    private BorrowapplyService borrowapplyService;

    private ServerResponse serverResponse;

    /**
     * 借款审核保存
     * @param shborrow
     * @param session
     * @param
     * @return
     */
    @PostMapping("save")
    public ServerResponse save(Shborrow shborrow, HttpSession session){
       // Object object = session.getAttribute(Constant.SESSION_ADMIN);
       // if(object!=null){
            //Huser huser = (Huser)object;
            //后台用户idhuser.getHuid()
            shborrow.setHuid(1);
            //借款id
            //审核时间
            shborrow.setCktime(DateFormateUtils.Formate());
            return shborrowService.save(shborrow);
        //}
       //return ServerResponse.createByError("登录超时");
    }

    /**
     * 更新借款审核
     * @param shborrow
     * @return
     */
    @PostMapping("update")
    public ServerResponse update(Shborrow shborrow,Integer baid,Integer ckstatus){
        serverResponse = shborrowService.update(shborrow);
        if(serverResponse.isSuccess()){
            serverResponse = borrowapplyService.updateTime(baid,ckstatus,DateFormateUtils.Formate());
            return serverResponse;
        }
        return serverResponse;
    }

    /**
     * 借款审核分页
     * @param page
     * @param limit
     * @return
     */
    @GetMapping("pager")
    public Pager pager(int page, int limit){
        return shborrowService.listPager(page,limit);
    }

}
