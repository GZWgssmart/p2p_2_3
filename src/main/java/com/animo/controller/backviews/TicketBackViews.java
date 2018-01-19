package com.animo.controller.backviews;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author ye
 * 描述：优惠券页面跳转控制器
 */
@Controller
@RequestMapping("/back/ticket")
public class TicketBackViews {

    @RequestMapping("pager")
   public String listTicket(){
       return "ticket/tickets";
   }

   @RequestMapping("add")
   public String saveTicket(){
       return "ticket/addTicket";
   }
}
