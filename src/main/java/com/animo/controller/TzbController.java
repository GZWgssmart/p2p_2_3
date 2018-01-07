package com.animo.controller;

import com.animo.common.Pager;
import com.animo.common.ServerResponse;
import com.animo.constant.Constant;
import com.animo.pojo.Tzb;
import com.animo.pojo.User;
import com.animo.service.TzbService;
import com.animo.utils.DateFormateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpSession;

/**
 * Created by Animo on 2017-12-25.
 */
@RestController
@RequestMapping("/tzb/data/json")
public class TzbController {

    @Autowired
    private TzbService tzbService;

    @PostMapping("save")
    public ServerResponse save(Tzb tzb, HttpSession session){
//        Object object = session.getAttribute(Constant.SESSION_USER);
//        if(object!=null){
//            User user=(User)object;
            //投资人id  即用户id
//        user.getUid()
            tzb.setUid(1);
            tzb.setTztime(DateFormateUtils.Formate());
            return tzbService.save(tzb);
//        }
     // return ServerResponse.createByError("登录超时");
    }

    @GetMapping("pager")
    public Pager pager(int page, int limit){
        return tzbService.listPager(page,limit);
    }

    @GetMapping("tzpager")
    public Pager listPagerByBaid(Integer pageNumber, Integer pageSize,Integer baid){
        return tzbService.listPagerByBaid(pageNumber,pageSize,baid);
    }

}
