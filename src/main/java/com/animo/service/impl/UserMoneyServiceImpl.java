package com.animo.service.impl;

import com.animo.dao.UsermoneyMapper;
import com.animo.pojo.Usermoney;
import com.animo.service.UserMoneyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by Animo on 2017-12-28.
 */
@Service
public class UserMoneyServiceImpl extends AbstractServiceImpl implements UserMoneyService{

    private UsermoneyMapper usermoneyMapper;

    @Autowired
    public void setUsermoneyMapper(UsermoneyMapper usermoneyMapper) {
        super.setBaseMapper(usermoneyMapper);
        this.usermoneyMapper = usermoneyMapper;
    }

    @Override
    public Usermoney selectByUid(Integer uid) {
        return usermoneyMapper.selectByUid(uid);
    }


    @Override
    public Usermoney selectAvailableMoney(Integer id) {
        return  usermoneyMapper.selectAvailableMoney(id);
    }

}
