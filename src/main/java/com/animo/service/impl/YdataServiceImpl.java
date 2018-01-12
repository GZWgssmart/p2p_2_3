package com.animo.service.impl;

import com.animo.common.ServerResponse;
import com.animo.dao.YdataMapper;
import com.animo.pojo.Ydata;
import com.animo.service.BaseService;
import com.animo.service.YdataService;
import com.animo.vo.StatisticalReportVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;

/**
 * Created by Administrator on 2018/1/11.
 */
@Service
public class YdataServiceImpl extends AbstractServiceImpl implements YdataService {

    private YdataMapper ydataMapper;

    @Autowired
    private void setYdataMapper(YdataMapper ydataMapper){
        super.setBaseMapper(ydataMapper);
        this.ydataMapper = ydataMapper;
    }

    @Override
    public StatisticalReportVO all() {
        return ydataMapper.all();
    }

    @Override
    public ServerResponse save(Ydata ydata,String today, String firstDay) {
        ydata = ydataMapper.selectByTime(today, firstDay);
        StatisticalReportVO statisticalReportVO = ydataMapper.all();
        ydata.setTmoney(statisticalReportVO.getTmoney());
        ydata.setTdkbno(statisticalReportVO.getTdkbno());
        ydata.setCreatedTime(new Date());
        ydata.setTtzno(statisticalReportVO.getTtzno());
        ydata.setTuser(statisticalReportVO.getTuser());
        ydata.setTdkno(statisticalReportVO.getTdkno());
        Integer i = ydataMapper.insertSelective(ydata);
        if(i==1){
            return ServerResponse.createBySuccess("添加成功");
        }
        return ServerResponse.createByError("添加失败");
    }

    @Override
    public Ydata getYdataByTime(String time) {
        return  ydataMapper.getYdataByTime(time);
    }


}
