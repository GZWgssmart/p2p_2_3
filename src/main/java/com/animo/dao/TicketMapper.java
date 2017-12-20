package com.animo.dao;

import com.animo.pojo.Ticket;

public interface TicketMapper {
    int deleteByPrimaryKey(Integer kid);

    int insert(Ticket record);

    int insertSelective(Ticket record);

    Ticket selectByPrimaryKey(Integer kid);

    int updateByPrimaryKeySelective(Ticket record);

    int updateByPrimaryKey(Ticket record);
}