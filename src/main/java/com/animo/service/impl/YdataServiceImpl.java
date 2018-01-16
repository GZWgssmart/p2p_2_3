package com.animo.service.impl;

import com.animo.common.ServerResponse;
import com.animo.dao.YdataMapper;
import com.animo.pojo.Ydata;
import com.animo.service.BaseService;
import com.animo.service.YdataService;
import com.animo.vo.StatisticalReportVO;
import org.apache.poi.hssf.usermodel.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.text.SimpleDateFormat;
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

    @Override
    public ServerResponse downloadMonthData(HttpServletResponse response, Long longTime) {
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

        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date date = new Date();
        date.setTime(longTime);
        String time = simpleDateFormat.format(date);
        Ydata ydata = ydataMapper.getYdataByTime(time);
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
        SimpleDateFormat format = new SimpleDateFormat("yyyy年MM月份");
        String fileName = format.format(date)+"运营数据统计报表";
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
        try {
            response.setHeader("Content-Disposition", "attachment;filename="+ new String((fileName + ".xls").getBytes(), "iso-8859-1"));
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        ServletOutputStream out = null;
        try {
            out = response.getOutputStream();
        } catch (IOException e) {
            e.printStackTrace();
        }
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
            if (bis != null) try {
                bis.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
            if (bos != null) try {
                bos.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        try {
            out.flush();
            return ServerResponse.createBySuccess("下载成功");
        } catch (IOException e) {
            return ServerResponse.createByError("下载失败");
        }
    }


}
