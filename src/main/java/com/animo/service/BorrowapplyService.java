package com.animo.service;

import com.animo.common.Pager;
import com.animo.common.ServerResponse;
import com.animo.pojo.Borrowapply;
import com.animo.pojo.Borrowdetail;
import com.animo.vo.BorrowApplyDetail;
import com.animo.vo.BorrowingVO;

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

    Pager listByJuid (Integer pageNo, Integer pageSize, Integer juid);

    ServerResponse saveBorrow(Borrowapply borrowApply, Borrowdetail borrowDetail);

    List<BorrowingVO> borrowingList();

    Pager listPager(int pageNo, int pageSize);

}
