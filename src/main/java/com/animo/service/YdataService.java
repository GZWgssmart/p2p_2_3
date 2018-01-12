package com.animo.service;

import com.animo.common.ServerResponse;
import com.animo.pojo.Ydata;
import com.animo.vo.StatisticalReportVO;
import org.apache.ibatis.annotations.Param;

/**
 * Created by Administrator on 2018/1/11.
 */
public interface YdataService extends BaseService{
    StatisticalReportVO all();
    ServerResponse save(Ydata ydata, String today, String firstDay);
    Ydata getYdataByTime(String time);
}
