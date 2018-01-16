package com.animo.service;

import com.animo.common.Pager;
import com.animo.pojo.Tzb;
import com.animo.vo.TzCountVO;

import java.util.List;

/**
 * Created by Animo on 2017-12-25.
 */
public interface TzbService extends BaseService{

    Pager listPagerByBaid(Integer pageNumber, Integer pageSize,Integer baid,Integer uid);

    Pager listInvestByUid(int pageNo, int pageSize, int uid);

    List<Tzb> getByBaid(Integer baid);

    List<TzCountVO>  getTotalTzMoney(Integer baid);
}
