package com.animo.service.impl;

import com.animo.dao.BzMapper;
import com.animo.dao.DxmodelMapper;
import com.animo.service.BzService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by CHEN JX on 2017/12/24.
 */
@Service
public class BzServiceImpl extends AbstractServiceImpl implements BzService {

    private BzMapper bzMapper;

    @Autowired
    public void setBzMapper(BzMapper bzMapper) {
        super.setBaseMapper(bzMapper);
        this.bzMapper = bzMapper;
    }
}
