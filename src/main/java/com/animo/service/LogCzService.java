package com.animo.service;

import com.animo.common.Pager;

/**
 * Created by qm on 2017/12/22.
 *
 * @author qm
 * @date 2017-12-22 15:52
 */
public interface LogCzService extends BaseService {

    Pager listPagerCriteria(Integer pageNo, Integer pageSize, Object obj);
}
