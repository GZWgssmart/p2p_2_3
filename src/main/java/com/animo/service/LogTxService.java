package com.animo.service;

import com.animo.common.Pager;
import com.animo.pojo.Usermoney;

import java.util.List;

/**
 * Created by qm on 2017/12/25.
 *
 * @author qm
 * @date 2017-12-25 9:02
 */
public interface LogTxService extends BaseService{

    Pager listPagerCriteria(Integer pageNo, Integer pageSize, Object obj);


}
