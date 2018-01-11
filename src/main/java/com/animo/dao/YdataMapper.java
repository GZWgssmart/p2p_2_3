package com.animo.dao;

import com.animo.vo.StatisticalReportVO;
import org.springframework.stereotype.Repository;

@Repository
public interface YdataMapper extends BaseMapper{
    StatisticalReportVO all();
}