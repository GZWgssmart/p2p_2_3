package com.animo.service.impl;

import com.animo.dao.RzvipMapper;
import com.animo.service.RzvipService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by Administrator on 2017/12/28.
 */
@Service
public class RzvipServiceImpl extends AbstractServiceImpl implements RzvipService {

    private RzvipMapper rzvipMapper;

    @Autowired
    public void setRzvipMapper(RzvipMapper rzvipMapper) {
        super.setBaseMapper(rzvipMapper);
        this.rzvipMapper = rzvipMapper;
    }

    @Override
    public int saveUid(Integer uid) {
        return rzvipMapper.saveUid(uid);
    }
}
