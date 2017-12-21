package com.animo.service.impl;

import com.animo.dao.UserMapper;
import com.animo.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by Animo on 2017-12-20.
 */
@Service
public class UserServiceImpl extends UserService{

    @Autowired
    private UserMapper userMapper;

}
