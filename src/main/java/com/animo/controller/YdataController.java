package com.animo.controller;

import com.animo.common.Pager;
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
    public String excelDownload(HttpServletResponse response, Long longTime) throws IOException {
        // 1.����һ��workbook����Ӧһ��Excel�ļ�
        HSSFWorkbook wb = new HSSFWorkbook();
        // 2.��workbook�����һ��sheet����ӦExcel�е�һ��sheet
        HSSFSheet sheet = wb.createSheet("sheet1");
        // 3.��sheet����ӱ�ͷ��0�У��ϰ汾poi��excel��������������short
        HSSFRow row = sheet.createRow((int) 0);
        // 4.������Ԫ������ֵ��ͷ�����ñ�ͷ����
        HSSFCellStyle style = wb.createCellStyle();
        // ���и�ʽ
//        style.setAlignment(HSSFCellStyle.ALIGN_CENTER);
        HSSFCell cell = row.createCell(0);
        cell.setCellValue("STORERKEY");
        cell.setCellStyle(style);

        cell = row.createCell(1);
        cell.setCellValue("���");
        cell.setCellStyle(style);

        cell = row.createCell(2);
        cell.setCellValue("����ʱ��");
        cell.setCellStyle(style);

        cell = row.createCell(3);
        cell.setCellValue("�����ܶ�");
        cell.setCellStyle(style);

        cell = row.createCell(4);
        cell.setCellValue("�½����ܶ�");
        cell.setCellStyle(style);

        cell = row.createCell(5);
        cell.setCellValue("���û���");
        cell.setCellStyle(style);

        cell = row.createCell(6);
        cell.setCellValue("��ע����");
        cell.setCellStyle(style);

        cell = row.createCell(7);
        cell.setCellValue("��Ͷ������");
        cell.setCellStyle(style);

        cell = row.createCell(8);
        cell.setCellValue("��Ͷ������");
        cell.setCellStyle(style);

        cell = row.createCell(9);
        cell.setCellValue("�ܴ�������");
        cell.setCellStyle(style);

        cell = row.createCell(10);
        cell.setCellValue("�´�������");
        cell.setCellStyle(style);

        cell = row.createCell(11);
        cell.setCellValue("�ܴ������");
        cell.setCellStyle(style);

        cell = row.createCell(12);
        cell.setCellValue("�´������");
        cell.setCellStyle(style);

        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date date = new Date();
        date.setTime(longTime);
        String time = simpleDateFormat.format(date);
        Ydata ydata = ydataService.getYdataByTime(time);
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
        SimpleDateFormat format = new SimpleDateFormat("yyyy��MM�·�");
        String fileName = format.format(date)+"��Ӫ����ͳ�Ʊ���";
        ByteArrayOutputStream os = new ByteArrayOutputStream();
        try {
            wb.write(os);
        } catch (IOException e) {
            e.printStackTrace();
        }
        byte[] content = os.toByteArray();
        InputStream is = new ByteArrayInputStream(content);

        // ����response���������Դ�����ҳ��
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
