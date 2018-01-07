package com.animo.service;

import com.animo.common.Pager;

/**
 * Created by Animo on 2018-01-06.
 */
public interface HkbService extends BaseService{

    Pager pager(Integer pageNumber, Integer pageSize, Integer baid);

}
