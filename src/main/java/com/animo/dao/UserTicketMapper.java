package com.animo.dao;

import com.animo.pojo.UserTicket;

public interface UserTicketMapper {
    int deleteByPrimaryKey(Integer ukid);

    int insert(UserTicket record);

    int insertSelective(UserTicket record);

    UserTicket selectByPrimaryKey(Integer ukid);

    int updateByPrimaryKeySelective(UserTicket record);

    int updateByPrimaryKey(UserTicket record);
}