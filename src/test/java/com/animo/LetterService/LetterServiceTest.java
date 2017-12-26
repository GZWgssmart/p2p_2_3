package com.animo.LetterService;

import com.animo.BaseService.BaseServiceTest;
import com.animo.common.Pager;
import com.animo.pojo.Letter;
import com.animo.service.LetterService;
import com.animo.utils.DateFormateUtils;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * Created by CHEN JX on 2017/12/26.
 */
public class LetterServiceTest extends BaseServiceTest {

    @Autowired
    private LetterService letterService;


    @Test
    public void LetteSave() {

        Letter letter = new Letter();
        letter.setTitle("站nei");
        letter.setContent("又有活动啦");
        letter.setCreatedTime(DateFormateUtils.Formate());
        letterService.save(letter);
    }
    @Test
    public void pager() {

        Pager pager = letterService.listPager(1, 2);
        System.out.println(pager);
    }
}
