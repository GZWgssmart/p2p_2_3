package com.animo.service;

import com.animo.common.ServerResponse;

import java.util.Date;

/**
 * Created by Animo on 2017-12-24.
 */
public interface BorrowapplyService extends BaseService{

    ServerResponse updateTime (Integer baid, Integer ckstatus, Date cktime);

}
