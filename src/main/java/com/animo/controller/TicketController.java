package com.animo.controller;

import com.animo.common.Pager;
import com.animo.common.ServerResponse;
import com.animo.constant.Constant;
import com.animo.pojo.Ticket;
import com.animo.service.TicketService;
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


    @RequestMapping("pagerTicket")
   public Pager listTicket(Integer page, Integer limit){
       return ticketService.listPager(page,limit);
   }

   @RequestMapping("updateTicket")
   public ServerResponse update(Ticket ticket){
       return ticketService.update(ticket);
   }

   @RequestMapping("saveTicket")
   public ServerResponse save(Ticket ticket){
       return ticketService.save(ticket);
   };

   @RequestMapping("deleteTicket")
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


    @InitBinder
    public void initBinder(WebDataBinder binder) {
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        dateFormat.setLenient(false);
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
    }
}
