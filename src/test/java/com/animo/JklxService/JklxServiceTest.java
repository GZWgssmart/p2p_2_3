package com.animo.JklxService;

import com.animo.BaseService.BaseServiceTest;
import com.animo.common.Pager;
import com.animo.pojo.Jklx;
import com.animo.service.JklxService;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * Created by CHEN JX on 2017/12/27.
 */
public class JklxServiceTest extends BaseServiceTest {


    @Autowired
    private JklxService jklxService;

    @Test
    public void save() {

        Jklx jklx = new Jklx();
        jklx.setLxname("旅游借款");
        jklxService.save(jklx);
    }
    @Test
    public void pager(){
        Pager pager = jklxService.listPager(1, 2);
        System.out.println(pager);
    }
}
