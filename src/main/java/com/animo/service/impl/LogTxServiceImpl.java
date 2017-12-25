package com.animo.service.impl;

import com.animo.common.Pager;
import com.animo.dao.LogTxMapper;
import com.animo.service.LogTxService;
import org.springframework.stereotype.Service;

/**
 * Created by qm on 2017/12/25.
 *
 * @author qm
 * @date 2017-12-25 9:02
 */
@Service
public class LogTxServiceImpl extends AbstractServiceImpl implements LogTxService {

    private LogTxMapper logTxMapper;

    public void setLogTxMapper(LogTxMapper logTxMapper) {
        super.setBaseMapper(logTxMapper);
        this.logTxMapper = logTxMapper;
    }

    /**
     * 分页显示提现记录
     * @param pageNo
     * @param pageSize
     * @return
     */
    @Override
    public Pager listPager(int pageNo, int pageSize) {
        Pager pager = new Pager(pageNo, pageSize);
        pager.setRows(logTxMapper.listPager(pager));
        pager.setTotal(logTxMapper.count());
        return pager;
    }
}
