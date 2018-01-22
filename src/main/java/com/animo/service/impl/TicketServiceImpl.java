package com.animo.service.impl;

import com.animo.common.ServerResponse;
import com.animo.constant.Constant;
import com.animo.dao.TicketMapper;
import com.animo.dao.UserTicketMapper;
import com.animo.pojo.Ticket;
import com.animo.pojo.User;
import com.animo.pojo.UserTicket;
import com.animo.service.TicketService;
import com.animo.utils.DateFormateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * Created by CHEN JX on 2017/12/24.
 */
@Service
public class TicketServiceImpl extends AbstractServiceImpl implements TicketService {

    private TicketMapper ticketMapper;

    private UserTicketMapper userTicketMapper;

    @Autowired
    public void setBzMapper(TicketMapper ticketMapper) {
        super.setBaseMapper(ticketMapper);
        this.ticketMapper = ticketMapper;
    }

    @Autowired
    public void setUserTicketMapper(UserTicketMapper userTicketMapper) {
        this.userTicketMapper = userTicketMapper;
    }

    @Override
    public List<Ticket> selectByIsVip(Integer isvip) {
        return ticketMapper.selectByIsVip(isvip);
    }

    @Override
    @Transactional
    public ServerResponse neck(Ticket ticket, HttpSession session) {
        Object object =  session.getAttribute(Constant.SESSION_USER);
        if(object!=null){
            User user = (User)object;
            if(userTicketMapper.getByUidAndKid(user.getUid(),ticket.getKid())!=null){
                return ServerResponse.createByError("不能重复领取");
            }
            Integer integer = ticketMapper.updateByPrimaryKeySelective(ticket);
            if(integer==1){
                UserTicket userTicket  = new UserTicket();
                userTicket.setUid(user.getUid());
                userTicket.setKid(ticket.getKid());
                userTicket.setTktime(DateFormateUtils.Formate());
                Integer integer1 = userTicketMapper.insertSelective(userTicket);
                if(integer1==1){
                    return ServerResponse.createBySuccess("领取成功");
                }
                return ServerResponse.createByError("领取失败");
            }
            return ServerResponse.createByError("领取失败");
        }
        return ServerResponse.createByError("登录超时");
    }

    @Override
    public ServerResponse list(Integer uid) {
        return ServerResponse.createBySuccess(ticketMapper.list(uid));
    }
}
