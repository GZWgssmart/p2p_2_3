package com.animo.controller;

import com.animo.common.ServerResponse;
import com.animo.service.YdataService;
import com.animo.vo.StatisticalReportVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * Created by Administrator on 2018/1/11.
 */
@RestController
@RequestMapping("/ydata/data/json")
public class YdataController {
    @Autowired
    private YdataService ydataService;

    @RequestMapping("all")
    public StatisticalReportVO all(){
        return ydataService.all();
    }
}
