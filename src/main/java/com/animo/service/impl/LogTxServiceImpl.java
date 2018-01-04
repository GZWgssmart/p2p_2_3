package com.animo.service.impl;

import com.animo.common.Pager;
import com.animo.dao.LogTxMapper;
import com.animo.pojo.Usermoney;
import com.animo.service.LogTxService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by qm on 2017/12/25.
 *
 * @author qm
 * @date 2017-12-25 9:02
 */
@Service
public class LogTxServiceImpl extends AbstractServiceImpl implements LogTxService {

    private LogTxMapper logTxMapper;

    @Autowired
    public void setLogTxMapper(LogTxMapper logTxMapper) {
        super.setBaseMapper(logTxMapper);
        this.logTxMapper = logTxMapper;
    }

    @Override
    public Pager listPagerCriteria(Integer pageNo, Integer pageSize, Object obj) {
        Pager pager = new Pager(pageNo, pageSize);
        pager.setRows(logTxMapper.listPagerCriteria(pager, obj));
        pager.setTotal(logTxMapper.countCriteria(obj));
        return pager;
    }



}
