package com.animo.service.impl;

import com.animo.common.ServerResponse;
import com.animo.dao.RewardMapper;
import com.animo.dao.TzbMapper;
import com.animo.dao.UsermoneyMapper;
import com.animo.service.TzbService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by Animo on 2017-12-25.
 */
@Service
public class TzbServiceImpl extends AbstractServiceImpl implements TzbService{

    private TzbMapper tzbMapper;

    private UsermoneyMapper usermoneyMapper;

    private RewardMapper rewardMapper;


    @Autowired
    public void setTzbMapper(TzbMapper tzbMapper) {
        super.setBaseMapper(tzbMapper);
        this.tzbMapper = tzbMapper;
    }

    @Override
    public ServerResponse save(Object object) {

        return null;
    }
}
