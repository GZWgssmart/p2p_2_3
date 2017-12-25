package com.animo.service.impl;

import com.animo.common.Pager;
import com.animo.dao.TxCheckMapper;
import com.animo.service.LogTxService;
import com.animo.service.TxCheckService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by qm on 2017/12/25.
 *
 * @author qm
 * @date 2017-12-25 11:06
 */
@Service
public class TxCheckServiceImpl extends AbstractServiceImpl implements TxCheckService {

    private TxCheckMapper txCheckMapper;

    public void setTxCheckMapper(TxCheckMapper txCheckMapper) {
        super.setBaseMapper(txCheckMapper);
        this.txCheckMapper = txCheckMapper;
    }

    /**
     * 分页查看提现审核记录
     * @param pageNo
     * @param pageSize
     * @return
     */
    @Override
    public Pager listPager(int pageNo, int pageSize) {
        Pager pager = new Pager(pageNo, pageSize);
        pager.setRows(txCheckMapper.listPager(pager));
        pager.setTotal(txCheckMapper.count());
        return pager;
    }
}
