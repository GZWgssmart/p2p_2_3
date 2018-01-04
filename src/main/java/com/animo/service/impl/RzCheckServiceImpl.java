package com.animo.service.impl;

import com.animo.dao.RzCheckMapper;
import com.animo.service.RzCheckService;
import org.springframework.stereotype.Service;

/**
 * Created by qm on 2018/1/3.
 *
 * @author qm
 * @date 2018-01-03 10:47
 */
@Service
public class RzCheckServiceImpl extends AbstractServiceImpl implements RzCheckService {

    private RzCheckMapper rzCheckMapper;

    public void setRzCheckMapper(RzCheckMapper rzCheckMapper) {
        super.setBaseMapper(rzCheckMapper);
        this.rzCheckMapper = rzCheckMapper;
    }
}
