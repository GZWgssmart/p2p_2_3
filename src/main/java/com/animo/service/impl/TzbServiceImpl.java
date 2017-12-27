package com.animo.service.impl;

import com.animo.dao.TzbMapper;
import com.animo.service.TzbService;
import org.springframework.stereotype.Service;

/**
 * Created by Animo on 2017-12-25.
 */
@Service
public class TzbServiceImpl extends AbstractServiceImpl implements TzbService{

    private TzbMapper tzbMapper;


    public void setTzbMapper(TzbMapper tzbMapper) {
        super.setBaseMapper(tzbMapper);
        this.tzbMapper = tzbMapper;
    }
}
