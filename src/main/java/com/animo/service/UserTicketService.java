package com.animo.service;

import com.animo.common.ServerResponse;
import com.animo.vo.TicketVo;

/**
 * Created by Animo on 2018-01-20.
 */
public interface UserTicketService extends BaseService{

    ServerResponse getByUid(Integer uid);

    ServerResponse getByUkid(Integer ukid);
}
