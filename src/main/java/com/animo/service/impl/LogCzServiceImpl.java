package com.animo.service.impl;

import com.animo.common.Pager;
import com.animo.dao.LogCzMapper;
import com.animo.service.LogCzService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by qm on 2017/12/22.
 *
 * @author qm
 * @date 2017-12-22 15:53
 */
@Service
public class LogCzServiceImpl extends AbstractServiceImpl implements LogCzService {

    private LogCzMapper logCzMapper;
    @Autowired
    public void setLogCzMapper(LogCzMapper logCzMapper){
        super.setBaseMapper(logCzMapper);
        this.logCzMapper = logCzMapper;
    }

    /**
     * 分页显示充值记录
     * @param pageNo
     * @param pageSize
     * @return
     */
    @Override
    public Pager listPager(int pageNo, int pageSize) {
        Pager pager = new Pager(pageNo, pageSize);
        pager.setRows(logCzMapper.listPager(pager));
        pager.setTotal(logCzMapper.count());
        return pager;
    }
}
