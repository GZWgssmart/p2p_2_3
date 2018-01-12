package com.animo.service;

import com.animo.common.Pager;
import com.animo.common.ServerResponse;
import com.animo.pojo.Borrowapply;
import com.animo.vo.BorrowApplyDetail;

import java.util.Date;
import java.util.List;

/**
 * Created by Animo on 2017-12-24.
 */
public interface BorrowapplyService extends BaseService{

    ServerResponse updateTime (Integer baid, Integer ckstatus, Date cktime);

    ServerResponse IndexBzBorrowapply(Integer bzid);

    Pager listPagerCriteria(Integer pageNumber,Integer pageSize,Object object);

    ServerResponse getMoneyAndYMoney(Integer baid);

    List<Borrowapply> list(Integer ckstatus);

    List<BorrowApplyDetail> getByCkstaus(Integer ckstatus);

}
