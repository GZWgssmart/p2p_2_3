package com.animo.dao;

import com.animo.pojo.UserTicket;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserTicketMapper extends BaseMapper{

    List<UserTicket> getByUid(Integer uid);

    UserTicket getByUidAndKid(@Param("uid") Integer uid, @Param("kid") Integer kid);

}