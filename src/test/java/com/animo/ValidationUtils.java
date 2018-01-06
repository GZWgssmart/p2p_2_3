package com.animo;

import com.animo.pojo.User;
import org.junit.Test;

import java.math.BigDecimal;

/**
 * Created by Animo on 2017-12-20.
 */
public class ValidationUtils {

    @Test
    public void testV(){
        User user = new User();
        user.setEmail("2");
        System.out.println(com.animo.utils.ValidationUtils.validateProperty(user,"email").getErrorMsg());
    }

    @Test
    public  void testB(){
        int scal = 2;
        BigDecimal bigDecimal = new BigDecimal(1000);
        System.out.println(bigDecimal.divide(new BigDecimal(6),3,BigDecimal.ROUND_HALF_UP));
    }

}
