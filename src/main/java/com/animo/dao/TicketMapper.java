package com.animo.dao;

import com.animo.pojo.Ticket;
import com.animo.vo.TicketVo;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface TicketMapper extends BaseMapper{
    List<Ticket> selectByIsVip(@Param("isvip") Integer isvip);

    List<TicketVo> list(Integer uid);

}