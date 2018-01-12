package com.animo.controller;

import com.animo.common.Pager;
import com.animo.common.ServerResponse;
import com.animo.pojo.DataBean;
import com.animo.pojo.Ydata;
import com.animo.service.YdataService;
import com.animo.utils.GetFirstMonthDay;
import com.animo.utils.GetLastMonthDay;
import com.animo.vo.StatisticalReportVO;
import org.apache.poi.hssf.usermodel.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

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

    @RequestMapping("pager")
    public Pager listStatisticalReport(){
        return ydataService.listPager(1,24);
    }

    @RequestMapping("time")
    public Ydata getBytime(String time){
        time = "2018-02-01 00:00:00";
        Ydata ydata = ydataService.getYdataByTime(time);
        return ydata;
    }

    @RequestMapping("downloadMonthData")
    public String excelDownload(HttpServletResponse response, String time) throws IOException {
        // 1.创建一个workbook，对应一个Excel文件
        HSSFWorkbook wb = new HSSFWorkbook();
        // 2.在workbook中添加一个sheet，对应Excel中的一个sheet
        HSSFSheet sheet = wb.createSheet("sheet1");
        // 3.在sheet中添加表头第0行，老版本poi对excel行数列数有限制short
        HSSFRow row = sheet.createRow((int) 0);
        // 4.创建单元格，设置值表头，设置表头居中
        HSSFCellStyle style = wb.createCellStyle();
        // 居中格式
//        style.setAlignment(HSSFCellStyle.ALIGN_CENTER);
        HSSFCell cell = row.createCell(0);
        cell.setCellValue("STORERKEY");
        cell.setCellStyle(style);

        cell = row.createCell(1);
        cell.setCellValue("编号");
        cell.setCellStyle(style);

        cell = row.createCell(2);
        cell.setCellValue("生成时间");
        cell.setCellStyle(style);

        cell = row.createCell(3);
        cell.setCellValue("交易总额");
        cell.setCellStyle(style);

        cell = row.createCell(4);
        cell.setCellValue("月交易总额");
        cell.setCellStyle(style);

        cell = row.createCell(5);
        cell.setCellValue("总用户数");
        cell.setCellStyle(style);

        cell = row.createCell(6);
        cell.setCellValue("月注册数");
        cell.setCellStyle(style);

        cell = row.createCell(7);
        cell.setCellValue("总投资人数");
        cell.setCellStyle(style);

        cell = row.createCell(8);
        cell.setCellValue("月投资人数");
        cell.setCellStyle(style);

        cell = row.createCell(9);
        cell.setCellValue("总贷款人数");
        cell.setCellStyle(style);

        cell = row.createCell(10);
        cell.setCellValue("月贷款人数");
        cell.setCellStyle(style);

        cell = row.createCell(11);
        cell.setCellValue("总贷款笔数");
        cell.setCellStyle(style);

        cell = row.createCell(12);
        cell.setCellValue("月贷款笔数");
        cell.setCellStyle(style);

        Ydata ydata = ydataService.getYdataByTime(time);
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat();
        row = sheet.createRow(1);
        row.createCell(0).setCellValue(1);
        row.createCell(1).setCellValue(ydata.getYid());
        row.createCell(2).setCellValue(simpleDateFormat.format(ydata.getCreatedTime()));
        row.createCell(3).setCellValue(ydata.getTmoney().doubleValue());
        row.createCell(4).setCellValue(ydata.getMmoney().doubleValue());
        row.createCell(5).setCellValue(ydata.getTuser());
        row.createCell(6).setCellValue(ydata.getMuser());
        row.createCell(7).setCellValue(ydata.getTtzno());
        row.createCell(8).setCellValue(ydata.getMtzno());
        row.createCell(9).setCellValue(ydata.getTdkno());
        row.createCell(10).setCellValue(ydata.getMdkno());
        row.createCell(11).setCellValue(ydata.getTdkbno());
        row.createCell(12).setCellValue(ydata.getMdkbno());

        String fileName = time+"月运营报表";
        ByteArrayOutputStream os = new ByteArrayOutputStream();
        try {
            wb.write(os);
        } catch (IOException e) {
            e.printStackTrace();
        }
        byte[] content = os.toByteArray();
        InputStream is = new ByteArrayInputStream(content);

        // 设置response参数，可以打开下载页面
        response.reset();
        response.setContentType("application/vnd.ms-excel;charset=utf-8");
        response.setHeader("Content-Disposition", "attachment;filename="+ new String((fileName + ".xls").getBytes(), "iso-8859-1"));
        ServletOutputStream out = response.getOutputStream();
        BufferedInputStream bis = null;
        BufferedOutputStream bos = null;

        try {
            bis = new BufferedInputStream(is);
            bos = new BufferedOutputStream(out);
            byte[] buff = new byte[2048];
            int bytesRead;
            // Simple read/write loop.
            while (-1 != (bytesRead = bis.read(buff, 0, buff.length))) {
                bos.write(buff, 0, bytesRead);
            }
        } catch (Exception e) {
            // TODO: handle exception
            e.printStackTrace();
        } finally {
            if (bis != null)
                bis.close();
            if (bos != null)
                bos.close();
        }
        out.flush();
        return "";
    }
}
