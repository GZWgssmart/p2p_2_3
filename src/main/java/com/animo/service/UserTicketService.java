package com.animo.service;

import com.animo.common.ServerResponse;

/**
 * Created by Animo on 2018-01-20.
 */
public interface UserTicketService extends BaseService{

    ServerResponse getByUid(Integer uid);

}
