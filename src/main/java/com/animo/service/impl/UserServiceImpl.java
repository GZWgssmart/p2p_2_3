package com.animo.service.impl;

import com.animo.common.Pager;
import com.animo.dao.UserMapper;
import com.animo.pojo.User;
import com.animo.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by Administrator on 2017/12/25.
 */
@Service
public class UserServiceImpl extends AbstractServiceImpl implements UserService {


    private UserMapper userMapper;

    @Autowired
    public void setUserMapper(UserMapper userMapper) {
        super.setBaseMapper(userMapper);
        this.userMapper = userMapper;
    }

    @Override
    public User getByTzm(Integer tzm) {
        return userMapper.getByTzm(tzm);
    }

    @Override
    public int getByPhone(String phone) {
        return userMapper.getByPhone(phone);
    }

    @Override
    public User getByPhonePwd(String phone, String upwd) {
        return userMapper.getByPhonePwd(phone, upwd);
    }

    @Override
    public Pager listPagerCriteria(Integer beginIndex, Integer pageSize, String resstr2) {
        Pager pager = new Pager(beginIndex, pageSize);
        pager.setRows(userMapper.listPagerCriteria(pager ,resstr2));
        pager.setTotal(userMapper.countCriteria(resstr2));
        return pager;
    }

    @Override
    public int getByEmail(String email) {
        return userMapper.getByEmail(email);
    }

}
