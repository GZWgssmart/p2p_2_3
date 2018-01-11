package com.animo.controller;

import com.animo.common.Pager;
import com.animo.common.ServerResponse;
import com.animo.constant.Constant;
import com.animo.pojo.Borrowapply;
import com.animo.pojo.Borrowdetail;
import com.animo.pojo.Bz;
import com.animo.pojo.User;
import com.animo.query.BorrowapplyQuery;
import com.animo.service.BorrowapplyService;
import com.animo.service.BorrowdetailService;
import com.animo.service.BzService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 借款申请
 * Created by Animo on 2017-12-24.
 */
@RestController
@RequestMapping("/borrowapply/data/json")
public class BorrowapplyController {

    @Autowired
    private BorrowapplyService borrowapplyService;

    @Autowired
    private BorrowdetailService borrowdetailService;

    private ServerResponse serverResponse;

    @Autowired
    private BzService bzService;


    /**
     * 借款申请保存
     * @param borrowapply
     * @param borrowdetail
     * @return
     */
    @PostMapping("save")
    public ServerResponse save(Borrowapply borrowapply, Borrowdetail borrowdetail, HttpSession session){
        Object object = session.getAttribute(Constant.SESSION_USER);
        if(object!=null){
            User user = (User) object;
            borrowapply.setUid(user.getUid());
            serverResponse = borrowapplyService.save(borrowapply);
            if(serverResponse.isSuccess()){
                borrowdetail.setBaid(borrowapply.getBaid());
                return  borrowdetailService.save(borrowdetail);
            }
            return serverResponse;
        }
        return ServerResponse.createByError("登录超时");
    }

    /**
     * 查询借款申请详情
     * @param baid
     * @param bdid
     * @return
     */
    @GetMapping("infoplus/{baid}/{bdid}")
    public ServerResponse info(@PathVariable("baid") Integer baid,@PathVariable("bdid") Integer bdid){
        Map<String,Object> Map = new HashMap<>();
        Map.put("borrowapply", borrowapplyService.getById(baid).getData());
        Map.put("borrowdetail",borrowdetailService.getById(bdid).getData());
        return ServerResponse.createBySuccess(Map);
    }

    /**
     * 借款申请修改 查询了基本信息和详情
     * @param borrowapply
     * @param borrowdetail
     * @return
     */
    @PostMapping("update")
    public ServerResponse update(Borrowapply borrowapply, Borrowdetail borrowdetail,HttpSession session){
         Object object = session.getAttribute(Constant.SESSION_USER);
         if(object!=null){
            serverResponse = borrowapplyService.update(borrowapply);
            if(serverResponse.isSuccess()){
                return borrowdetailService.update(borrowdetail);
            }
            return serverResponse;
         }
        return ServerResponse.createByError("登录超时");
    }

    /**
     * 借款基本信息分页
     * @param page
     * @param limit
     * @return
     */
    @GetMapping("pager")
    public Pager pager( int page,  int limit){
        return borrowapplyService.listPager(page,limit);
    }


    /**
     * 首页查询标种随机三个标
     * @param
     * @return
     */
    @GetMapping("three")
    public ServerResponse three(){
        List<Bz> bz = bzService.list();
        Map<String,Object> map = new HashMap<>();
        for(Bz bz1 : bz){
            map.put(bz1.getBzname(),borrowapplyService.IndexBzBorrowapply(bz1.getBzid()));
        }
        return  ServerResponse.createBySuccess(map);
    }

    @GetMapping("PagerCriteria")
    public Pager PagerCriteria(Integer pageNumber, Integer pageSize,BorrowapplyQuery query){
        return borrowapplyService.listPagerCriteria(pageNumber,pageSize,query);
    }

    @GetMapping("isSkb")
    public ServerResponse isSkb(Integer baid){
        return borrowapplyService.getMoneyAndYMoney(baid);
    }

}
