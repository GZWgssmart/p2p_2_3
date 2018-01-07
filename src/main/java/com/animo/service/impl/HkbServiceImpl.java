package com.animo.service.impl;

import com.animo.common.Pager;
import com.animo.dao.HkbMapper;
import com.animo.service.HkbService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by Animo on 2018-01-06.
 */
@Service
public class HkbServiceImpl extends AbstractServiceImpl implements HkbService {

    private HkbMapper hkbMapper;

    @Autowired
    public void setHkbMapper(HkbMapper hkbMapper) {
        super.setBaseMapper(hkbMapper);
        this.hkbMapper = hkbMapper;
    }

    @Override
    public Pager pager(Integer pageNumber, Integer pageSize, Integer baid) {
        Pager pager = new Pager(pageNumber, pageSize);
        pager.setRows(hkbMapper.listPagerByBaid(pager,baid));
        pager.setTotal(hkbMapper.countByBaid(baid));
        return pager;
    }
}
