package com.animo.service;

import com.animo.common.Pager;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by qm on 2017/12/25.
 *
 * @author qm
 * @date 2017-12-25 9:02
 */
public interface LogTxService extends BaseService {

    Pager listPagerByUid(Integer pageNo, Integer pageSize, Integer uid);

    Pager listAll(Integer pageNo, Integer pageSize);


}
