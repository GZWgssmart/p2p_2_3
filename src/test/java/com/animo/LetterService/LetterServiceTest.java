package com.animo.LetterService;

import com.animo.BaseService.BaseServiceTest;
import com.animo.common.Pager;
import com.animo.pojo.Letter;
import com.animo.service.LetterService;
import com.animo.utils.DateFormateUtils;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.sql.Timestamp;
import java.util.Calendar;

/**
 * Created by CHEN JX on 2017/12/26.
 */
public class LetterServiceTest extends BaseServiceTest {

    @Autowired
    private LetterService letterService;


    @Test
    public void LetteSave() {

        Letter letter = new Letter();
        for(int i=0; i<100;i++) {
            letter.setTitle("站nei"+i);
            letter.setContent("又有活动啦"+i);
            letter.setCreatedTime(DateFormateUtils.Formate());
            letterService.save(letter);
        }
    }
    @Test
    public void pager() {

        Pager pager = letterService.listPager(1, 2);
        System.out.println(pager);
    }
    @Test
    public void update() {
        Letter letter = new Letter();
        letter.setLid(1);
        letter.setTitle("哎呦不错哦");
        letter.setContent("再次修改了站内信");
        letter.setCreatedTime(new Timestamp(Calendar.getInstance().getTimeInMillis()));
        letterService.update(letter);

    }
}
