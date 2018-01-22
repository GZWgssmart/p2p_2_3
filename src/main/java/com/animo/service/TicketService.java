package com.animo.service;

import com.animo.common.ServerResponse;
import com.animo.pojo.Ticket;

import javax.servlet.http.HttpSession;
import java.util.List;

public interface TicketService extends BaseService {
    List<Ticket> selectByIsVip(Integer isvip);
    ServerResponse neck(Ticket ticket, HttpSession session);
    ServerResponse list(Integer uid);
}
