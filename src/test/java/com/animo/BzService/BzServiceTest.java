package com.animo.BzService;

import com.animo.BaseService.BaseServiceTest;
import com.animo.common.Pager;
import com.animo.pojo.Bz;
import com.animo.service.BzService;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * Created by CHEN JX on 2017/12/24.
 */
public class BzServiceTest extends BaseServiceTest {

    @Autowired
    private BzService bzService;

    @Test
    public void BzSave() {
        Bz bz = new Bz();
        bz.setBzname("多金宝");
        bzService.save(bz);
    }
    @Test
    public void BzDxmodeldeleteByPrimaryKey() {
        bzService.removeById(1);
    }
    @Test
    public void BzUpdateByPrimaryKey() {
        Bz bz = new Bz();
        bz.setBzid(5);
        bz.setBzname("普金宝");
        bzService.update(bz);
    }
    @Test
    public void BzListPager() {
        Pager pager = bzService.listPager(1, 2);
        System.out.println(pager);
    }
}
