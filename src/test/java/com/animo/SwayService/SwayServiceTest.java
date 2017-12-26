package com.animo.SwayService;

import com.animo.BaseService.BaseServiceTest;
import com.animo.common.Pager;
import com.animo.common.ServerResponse;
import com.animo.pojo.Sway;
import com.animo.service.SwayService;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * Created by CHEN JX on 2017/12/25.
 */
public class SwayServiceTest extends BaseServiceTest{

    @Autowired
    private SwayService swayService;
    @Test
    public void SwaySave() {
        Sway sway = new Sway();
        sway.setWay("三期免息");
        sway.setFw("前三期不用钱");
        swayService.save(sway);
    }


    @Test
    public void SwayDeleteByPrimaryKey() {
         swayService.removeById(1);
    }

    @Test
    public void SwayUpdateByPrimaryKey() {
        Sway sway = new Sway();
        sway.setSid(1);
        sway.setWay("到期本息一起");
        sway.setFw("时间一到把利息和本金一起还");
        swayService.update(sway);
    }

    /**
     * 分页查询
     */
    @Test
    public void pager() {
        Pager pager = swayService.listPager(1, 2);
        System.out.println(pager);
    }

}
