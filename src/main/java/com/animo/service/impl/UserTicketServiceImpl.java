package com.animo.service.impl;

import com.animo.common.ServerResponse;
import com.animo.dao.TicketMapper;
import com.animo.dao.UserTicketMapper;
import com.animo.pojo.Ticket;
import com.animo.pojo.UserTicket;
import com.animo.service.UserTicketService;
import com.animo.vo.TicketVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import sun.util.resources.cldr.kea.TimeZoneNames_kea;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by Animo on 2018-01-20.
 */
@Service
public class UserTicketServiceImpl  extends AbstractServiceImpl implements UserTicketService {

    private UserTicketMapper userTicketMapper;

    private TicketMapper ticketMapper;

    @Autowired
    public void setTicketMapper(TicketMapper ticketMapper) {
        this.ticketMapper = ticketMapper;
    }

    @Autowired
    public void setUserTicketMapper(UserTicketMapper userTicketMapper) {
        super.setBaseMapper(userTicketMapper);
        this.userTicketMapper = userTicketMapper;
    }

    @Override
    public ServerResponse getByUid(Integer uid) {
        List<Ticket> tickets = new ArrayList<>();
        List<UserTicket> userTickets = userTicketMapper.getByUid(uid);
        for(UserTicket userTicket :userTickets){
            Ticket ticket1 = new Ticket();
            Ticket ticket = (Ticket) ticketMapper.selectByPrimaryKey(userTicket.getKid());
            ticket1.setTkmoney(ticket.getTkmoney());
            ticket1.setKid(ticket.getKid());
            tickets.add(ticket1);
        }
        return ServerResponse.createBySuccess(tickets);
    }

    @Override
    public ServerResponse getByUkid(Integer ukid) {
        return ServerResponse.createBySuccess(userTicketMapper.getByUkid(ukid));
    }
}
