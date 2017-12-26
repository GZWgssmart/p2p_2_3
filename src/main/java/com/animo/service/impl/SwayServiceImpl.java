package com.animo.service.impl;

import com.animo.dao.SwayMapper;
import com.animo.service.SwayService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by CHEN JX on 2017/12/25.
 */
@Service
public class SwayServiceImpl extends AbstractServiceImpl implements SwayService {

    private SwayMapper swayMapper;

    @Autowired
    public void setSwayMapper(SwayMapper swayMapper){
        super.setBaseMapper(swayMapper);
        this.swayMapper = swayMapper;
    }

}
