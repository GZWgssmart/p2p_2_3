package com.animo.service;

import com.animo.common.Pager;
import com.animo.common.ServerResponse;

/**
 * Created by Animo on 2017-12-22.
 */
public interface BaseService {

    ServerResponse save(Object object);

    ServerResponse getById(Integer id);

    ServerResponse updateStatus(Integer id,Integer status);

    ServerResponse update(Object object);

    ServerResponse removeById(Integer id);

    Pager listPager(int pageNo, int pageSize);


}
