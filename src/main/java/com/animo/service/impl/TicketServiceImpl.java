package com.animo.service.impl;

import com.animo.common.Pager;
import com.animo.dao.BzMapper;
import com.animo.dao.TicketMapper;
import com.animo.pojo.Bz;
import com.animo.pojo.Ticket;
import com.animo.service.BzService;
import com.animo.service.TicketService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by CHEN JX on 2017/12/24.
 */
@Service
public class TicketServiceImpl extends AbstractServiceImpl implements TicketService {

    private TicketMapper ticketMapper;

    @Autowired
    public void setBzMapper(TicketMapper ticketMapper) {
        super.setBaseMapper(ticketMapper);
        this.ticketMapper = ticketMapper;
    }

    @Override
    public List<Ticket> selectByIsVip(Integer isvip) {
        return ticketMapper.selectByIsVip(isvip);
    }
}
