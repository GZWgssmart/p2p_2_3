package com.animo.service;

import com.animo.common.Pager;
import com.animo.common.ServerResponse;
import com.animo.pojo.Skb;

/**
 * Created by Animo on 2018-01-02.
 */
public interface SkbService extends BaseService {

    Pager skblist(int pageNo, int pageSize, Integer uid,Integer baid);

    ServerResponse confirm(Skb skb);
}
