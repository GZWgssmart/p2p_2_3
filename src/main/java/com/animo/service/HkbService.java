package com.animo.service;

import com.animo.common.Pager;
import com.animo.common.ServerResponse;
import com.animo.pojo.Hkb;

/**
 * Created by Animo on 2018-01-06.
 */
public interface HkbService extends BaseService{

    Pager pager(Integer pageNumber, Integer pageSize, Integer baid);

    ServerResponse confirm(Hkb hkb);

}
