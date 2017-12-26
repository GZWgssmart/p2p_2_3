package com.animo.service.impl;

import com.animo.dao.UserMapper;
import com.animo.pojo.User;
import com.animo.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by Administrator on 2017/12/25.
 */
@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userMapper;

    @Override
    public User getByTzm(Integer tzm) {
        return userMapper.getByTzm(tzm);
    }

    @Override
    public int saveUser(String phone, String upwd) {
        return userMapper.saveUser(phone, upwd);
    }

    @Override
    public int getByPhone(String phone) {
        return userMapper.getByPhone(phone);
    }

    @Override
    public User getByPhonePwd(String phone, String upwd) {
        return userMapper.getByPhonePwd(phone, upwd);
    }
}
