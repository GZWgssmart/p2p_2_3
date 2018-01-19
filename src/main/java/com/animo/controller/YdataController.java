package com.animo.controller;

import com.animo.common.Pager;
import com.animo.common.ServerResponse;
import com.animo.pojo.Ydata;
import com.animo.service.YdataService;
import com.animo.vo.StatisticalReportVO;
import org.apache.poi.hssf.usermodel.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by Administrator on 2018/1/11.
 */
@RestController
@RequestMapping("/ydata/data/json")
public class YdataController {
    @Autowired
    private YdataService ydataService;
/*
*
* 查询平台运营数据
* */
    @RequestMapping("all")
    //    @RequiresPermissions("ydata:all")
    public StatisticalReportVO all(){
        return ydataService.all();
    }
/*
* 平台运营分页
* */
    @RequestMapping("pager")
    //    @RequiresPermissions("ydata:pager")
    public Pager listStatisticalReport(){
        return ydataService.listPager(1,24);
    }

    /**
     * 下载excel
     * @param response
     * @param longTime
     * @return
     * @throws IOException
     */
    @RequestMapping("downloadMonthData")
    //    @RequiresPermissions("ydata:downloadMonthData")
    public ServerResponse excelDownload(HttpServletResponse response, Long longTime) throws IOException {
        return ydataService.downloadMonthData(response, longTime);
    }
}
