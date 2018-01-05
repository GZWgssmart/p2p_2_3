package com.animo.service;

import com.animo.common.Pager;

/**
 * Created by qm on 2018/1/3.
 *
 * @author qm
 * @date 2018-01-03 10:32
 */
public interface LogMoneyService extends BaseService {

    Pager listPagerCriteria(Integer pageNo, Integer pageSize, Object obj);
}
