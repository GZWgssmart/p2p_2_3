package com.animo.job;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

import java.util.Date;

/**
 * 每个月的第一天的零点零分零秒生成上个月的运营数据
 */
@Component("MonthStatisticsData")
public class MonthStatisticsData {
    Logger logger = LoggerFactory.getLogger(MonthStatisticsData.class);
    public void execute(){
        logger.info("开始统计上个月的运营数据");
        System.out.println("每个月的第一天的零点零分零秒生成上个月的运营数据，当前时间："+new Date());
    }
}
