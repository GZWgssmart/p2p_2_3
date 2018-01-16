package com.animo;

import com.animo.common.IndustrySMS;
import com.animo.pojo.Bankcard;
import com.animo.service.BankCardService;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * Created by qm on 2017/12/25.
 *
 * @author qm
 * @date 2017-12-25 19:17
 */
public class BankCardServiceTest extends BaseTest {

    @Autowired
    private BankCardService bankCardService;
    @Test
    public void  BankCardSave(){
//        Bankcard bankcard = new Bankcard();
//        bankcard.setCardno(" 6228480402564890018 ");
//        bankcard.setType("农业银行");
//        bankcard.setRname("小王");
//        bankcard.setIdno(" 410322199202152910");
//        bankCardService.save(bankcard);

        String code = IndustrySMS.execute("17607974221");
        System.out.println(code);

    }
}
