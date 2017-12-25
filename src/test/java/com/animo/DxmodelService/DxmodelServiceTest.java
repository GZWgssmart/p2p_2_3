package com.animo.DxmodelService;

import com.animo.BaseService.BaseServiceTest;
import com.animo.common.Pager;
import com.animo.pojo.Dxmodel;
import com.animo.service.DxmodelService;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * Created by CHEN JX on 2017/12/22.
 */
public class DxmodelServiceTest extends BaseServiceTest {

    @Autowired
    private DxmodelService dxmodelService;

    @Test
    public void DxmodelSave() {
        Dxmodel dxmodel = new Dxmodel();
        dxmodel.setContent("我是第三个短信模板！！");
        dxmodelService.save(dxmodel);
    }
    @Test
    public void DxmodeldeleteByPrimaryKey() {
        dxmodelService.removeById(2);
    }
    @Test
    public void DxmodelUpdateByPrimaryKey() {

        Dxmodel dxmodel = new Dxmodel();
        dxmodel.setDxid(4);
        dxmodel.setContent("我再次修改了短信模板");
        dxmodelService.update(dxmodel);
    }

    /**
     * 分页查询
     */
    @Test
    public void DxmodelListPager() {
        Pager pager = dxmodelService.listPager(1, 2);
        System.out.println(pager);
    }
}
