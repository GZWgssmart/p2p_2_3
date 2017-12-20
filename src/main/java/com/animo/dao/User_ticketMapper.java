package com.animo.dao;

import com.animo.pojo.User_ticket;

public interface User_ticketMapper {
    int deleteByPrimaryKey(Integer ukid);

    int insert(User_ticket record);

    int insertSelective(User_ticket record);

    User_ticket selectByPrimaryKey(Integer ukid);

    int updateByPrimaryKeySelective(User_ticket record);

    int updateByPrimaryKey(User_ticket record);
}