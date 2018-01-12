package com.animo.job;

import com.animo.pojo.Ydata;
import com.animo.service.YdataService;
import com.animo.utils.GetFirstMonthDay;
import com.animo.utils.GetLastMonthDay;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.Date;

/**
 * 每个月定时统计运营数据
 */
@Component("MonthStatisticsData")
public class MonthStatisticsData {

    @Autowired
    private YdataService ydataService;

    Logger logger = LoggerFactory.getLogger(MonthStatisticsData.class);
    public void execute(){
        logger.info("开始统计运营数据");
        System.out.println("开始统计运营数据，当前时间："+new Date().getTime());
        String today = GetLastMonthDay.getToday();
        String firstDay = GetFirstMonthDay.getFistMothDay();
        ydataService.save(new Ydata(),today,firstDay);
        logger.info("运营数据统计已完成");
    }
}
