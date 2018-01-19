package com.animo.service;

import com.animo.common.Pager;
import com.animo.pojo.Ticket;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface TicketService extends BaseService {
    List<Ticket> selectByIsVip(Integer isvip);
}
