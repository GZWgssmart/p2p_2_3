package com.animo;

import com.animo.pojo.User;
import org.junit.Test;

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

}
