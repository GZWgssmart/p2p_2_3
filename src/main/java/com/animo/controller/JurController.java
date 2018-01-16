package com.animo.controller;

import com.animo.common.Pager;
import com.animo.common.ServerResponse;
import com.animo.pojo.Jur;
import com.animo.service.JurService;
import com.animo.utils.ShiroAuthorizationUtil;
import com.animo.vo.RoleJurVO;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.util.ArrayList;
import java.util.List;

/**
 * @author ye
 * 描述：权限的crud
 */


@RestController
@RequestMapping("/jur/data/json")
public class JurController {

    @Autowired
    private JurService jurService;

    @RequestMapping("initJur")
    public List<Jur> initJur(String filePath) throws Exception {
        filePath="E:\\权限初始化.xlsx";
        System.out.println(filePath);
        List<Jur> jurList = new ArrayList<>();
        FileInputStream fileInputStream = new FileInputStream(filePath);
        Workbook workbook = new HSSFWorkbook(fileInputStream);
        //获取Excel文档中的第一个表单
        Sheet sheet = workbook.getSheetAt(0);
        //对Sheet中的每一行进行迭代
        for (Row row : sheet){
            //如果当前行的行号（从0开始）未达到2（第三行）则从新循环
            if (row.getRowNum() < 1){
                continue;
            }
            Jur jur = new Jur();
            jur.setJid(Integer.valueOf(row.getCell(0).getStringCellValue()));
            jur.setJurl(row.getCell(1).getStringCellValue());
            jur.setContent(row.getCell(2).getStringCellValue());
            jurList.add(jur);
        }
        fileInputStream.close();
        for (int i = 0; i < jurList.size(); i++){
            jurService.save(jurList.get(i));
        }
        return jurList;
    }

    @RequestMapping("listJurByRid")
    public List<RoleJurVO> listByRid(Integer rid){
        return jurService.listByRid(rid);
    }

    /**
     * 添加角色时，分配权限
     * @return
     */
    @RequestMapping("all")
    public List<Jur> listAll(){
        return jurService.listAll();
    }

    /**
     * 权限分页
     * @param page
     * @param limit
     * @return
     */
    @RequestMapping("pager")
    public Pager pagerJur(Integer page, Integer limit){
        return jurService.listPager(page, limit);
    }

    /**
     * 更新权限
     * @param jur
     * @return
     */
    @RequestMapping("updateJur")
    public ServerResponse updateJur(Jur jur){
        ShiroAuthorizationUtil.clearAuthAndCache();
        return jurService.update(jur);
    }

}
