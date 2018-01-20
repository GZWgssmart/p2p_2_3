package com.animo.dao;

import com.animo.pojo.Ticket;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface TicketMapper extends BaseMapper{
    List<Ticket> selectByIsVip(@Param("isvip") Integer isvip);

}