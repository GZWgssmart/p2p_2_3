package com.animo.service.impl;

import com.animo.common.ServerResponse;
import com.animo.dao.JurMapper;
import com.animo.dao.RolejurMapper;
import com.animo.pojo.Jur;
import com.animo.service.JurService;
import com.animo.utils.ShiroAuthorizationUtil;
import com.animo.vo.RoleJurVO;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@Service
public class JurServiceImpl extends AbstractServiceImpl implements JurService {

    private JurMapper jurMapper;
    @Autowired
    private RolejurMapper rolejurMapper;

    @Autowired
    public void setJurMapper(JurMapper jurMapper){
        super.setBaseMapper(jurMapper);
        this.jurMapper = jurMapper;
    }

    @Override
    public List<Jur> listAll() {
        return jurMapper.listAll();
    }

    @Override
    public List<RoleJurVO> listByRid(Integer rid) {
        return jurMapper.listByRid(rid);
    }

    @Override
    public ServerResponse insertJurList(String filePath) {
        List<Jur> jurList = new ArrayList<>();
        FileInputStream fileInputStream = null;
        try {
            fileInputStream = new FileInputStream(filePath);
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        }
        Workbook workbook = null;
        try {
            workbook = new XSSFWorkbook(fileInputStream);
        } catch (IOException e) {
            try {
                workbook = new HSSFWorkbook(fileInputStream);
            } catch (IOException e1) {
                e1.printStackTrace();
            }
            e.printStackTrace();
        }
        //获取Excel文档中的第一个表单
        Sheet sheet = workbook.getSheetAt(0);
        //对Sheet中的每一行进行迭代
        for (Row row : sheet){
            //如果当前行的行号（从0开始）未达到2（第三行）则从新循环
            if (row.getRowNum() < 1){
                continue;
            }
            Jur jur = new Jur();
            jur.setJurl(row.getCell(1).getStringCellValue());
            jur.setContent(row.getCell(2).getStringCellValue());
            jurList.add(jur);
        }
        try {
            fileInputStream.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
        try {
            //清空表数据
            rolejurMapper.deleteAll();
            jurMapper.deleteAll();
            jurMapper.saveJurList(jurList);
            ShiroAuthorizationUtil.clearAuthAndCache();
            return ServerResponse.createByError("初始化成功");
        }catch (Exception e){
            return ServerResponse.createByError("初始化失败");
        }
    }
}
