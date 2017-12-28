package com.animo.service.impl;

import com.animo.dao.UsermoneyMapper;
import com.animo.service.UserMoneyService;
import org.springframework.stereotype.Service;

/**
 * Created by Animo on 2017-12-28.
 */
@Service
public class UserMoneyServiceImpl extends AbstractServiceImpl implements UserMoneyService{

    private UsermoneyMapper usermoneyMapper;

    public void setUsermoneyMapper(UsermoneyMapper usermoneyMapper) {
        super.setBaseMapper(usermoneyMapper);
        this.usermoneyMapper = usermoneyMapper;
    }
}
