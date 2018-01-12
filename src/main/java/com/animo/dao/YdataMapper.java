package com.animo.dao;

import com.animo.common.ServerResponse;
import com.animo.pojo.Ydata;
import com.animo.vo.StatisticalReportVO;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface YdataMapper extends BaseMapper{
    StatisticalReportVO all();
    Ydata selectByTime(@Param("today")String today, @Param("firstDay")String firstDay);
    ServerResponse insert(@Param("today") String today, @Param("firstDay") String firstDay);
    Ydata getYdataByTime(@Param("time")String time);
}