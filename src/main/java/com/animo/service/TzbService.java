package com.animo.service;

import com.animo.common.Pager;

/**
 * Created by Animo on 2017-12-25.
 */
public interface TzbService extends BaseService{

    Pager listPagerByBaid(Integer pageNumber, Integer pageSize,Integer baid);

    Pager listInvestByUid(int pageNo, int pageSize, int uid);
}
