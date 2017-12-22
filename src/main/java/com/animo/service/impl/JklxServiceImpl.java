package com.animo.service.impl;

import com.animo.dao.JklxMapper;
import com.animo.service.JklxService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by Animo on 2017-12-22.
 */
@Service
public class JklxServiceImpl extends AbstractServiceImpl implements JklxService{



    private JklxMapper jklxMapper;


    @Autowired
    public void setJklxMapper(JklxMapper jklxMapper) {
        super.setBaseMapper(jklxMapper);
        this.jklxMapper = jklxMapper;
    }
}
