package com.animo.com.animo.UserService;

import com.animo.BaseService.BaseServiceTest;
import com.animo.pojo.User;
import com.animo.service.UserService;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * Created by Administrator on 2018/3/3.
 */
public class UserServiceTest extends BaseServiceTest {

    @Autowired
    private UserService userService;

    @Test
    public void aa() {
        User user = new User();
    }


}
