package com.animo.controller;

import com.animo.common.Pager;
import com.animo.common.ServerResponse;
import com.animo.constant.Constant;
import com.animo.pojo.Ticket;
import com.animo.pojo.User;
import com.animo.service.TicketService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * @author ye
 * 描述：优惠券控制器
 */
@RestController
@RequestMapping("/ticket/data/json")
public class TicketController {

    @Autowired
    private TicketService ticketService;

    /**
     * 后台
     * 优惠券分页查看
     * @param page
     * @param limit
     * @return
     */
    @RequestMapping("pagerTicket")
//    @RequiresPermissions("ticket:pagerTicket")
   public Pager listTicket(Integer page, Integer limit){
       return ticketService.listPager(page,limit);
   }

    /**
     * 修改券信息
     * @param ticket
     * @return
     */
   @RequestMapping("updateTicket")
//   @RequiresPermissions("ticket:updateTicket")
   public ServerResponse update(Ticket ticket){
       return ticketService.update(ticket);
   }

    /**
     * 添加券
     * @param ticket
     * @return
     */
   @RequestMapping("saveTicket")
//   @RequiresPermissions("ticket:saveTicket")
   public ServerResponse save(Ticket ticket){
       return ticketService.save(ticket);
   };

    /**
     * 删除券
     * @param ticket
     * @return
     */
   @RequestMapping("deleteTicket")
//   @RequiresPermissions("ticket:deleteTicket")
   public ServerResponse delete(Ticket ticket){
       return ticketService.removeById(ticket.getKid());
   }

   @RequestMapping("ticketsByIsVip")
   public List<Ticket> selectByIsVip(Integer isvip){
       return ticketService.selectByIsVip(isvip);
   };


    @PostMapping("neck")
    public ServerResponse neck(Ticket ticket, HttpSession session){
        return ticketService.neck(ticket,session);
    }

    @GetMapping("list")
    public ServerResponse list(HttpSession session){
        User user = (User)session.getAttribute(Constant.SESSION_USER);
        return ticketService.list(user.getUid());
    }


    @InitBinder
    public void initBinder(WebDataBinder binder) {
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        dateFormat.setLenient(false);
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
    }
}
