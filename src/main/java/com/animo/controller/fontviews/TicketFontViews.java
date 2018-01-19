package com.animo.controller.fontviews;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author ye
 * 描述：优惠券页面跳转控制器
 */
@Controller
@RequestMapping("/ticket")
public class TicketFontViews {

    @RequestMapping("pager")
   public String listTicket(){
       return "font/font-tickets";
   }

}
