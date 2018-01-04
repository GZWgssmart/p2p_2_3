package com.animo.service.impl;

import com.animo.dao.BaseMapper;
import com.animo.dao.LogMoneyMapper;
import com.animo.service.LogMoneyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.logging.LogManager;

/**
 * Created by qm on 2018/1/3.
 *
 * @author qm
 * @date 2018-01-03 10:32
 */
@Service
public class LogMoneyServiceImpl extends AbstractServiceImpl implements LogMoneyService {

    private LogMoneyMapper logMoneyMapper;

    @Autowired
    public void setLogMoneyMapper(LogMoneyMapper logMoneyMapper) {
        super.setBaseMapper(logMoneyMapper);
        this.logMoneyMapper = logMoneyMapper;
    }
}
