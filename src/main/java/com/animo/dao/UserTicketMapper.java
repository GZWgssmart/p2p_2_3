package com.animo.dao;

import com.animo.pojo.UserTicket;
import com.animo.vo.TicketVo;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserTicketMapper extends BaseMapper{

    List<UserTicket> getByUid(Integer uid);

    UserTicket getByUidAndKid(@Param("uid") Integer uid, @Param("kid") Integer kid);
    TicketVo getByUkid(Integer ukid);


}