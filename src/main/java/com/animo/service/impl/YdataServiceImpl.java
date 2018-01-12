package com.animo.service.impl;

import com.animo.dao.YdataMapper;
import com.animo.service.YdataService;
import com.animo.vo.StatisticalReportVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by Administrator on 2018/1/11.
 */
@Service
public class YdataServiceImpl implements YdataService {
    @Autowired
    private YdataMapper ydataMapper;

    @Override
    public StatisticalReportVO all() {
        return ydataMapper.all();
    }
}
