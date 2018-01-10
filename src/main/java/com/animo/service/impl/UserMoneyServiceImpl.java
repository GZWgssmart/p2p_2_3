package com.animo.service.impl;

import com.animo.common.ServerResponse;
import com.animo.dao.UsermoneyMapper;
import com.animo.service.UserMoneyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by Animo on 2017-12-28.
 */
@Service
public class UserMoneyServiceImpl extends AbstractServiceImpl implements UserMoneyService {

    private UsermoneyMapper usermoneyMapper;

    @Autowired
    public void setUsermoneyMapper(UsermoneyMapper usermoneyMapper) {
        super.setBaseMapper(usermoneyMapper);
        this.usermoneyMapper = usermoneyMapper;
    }


    @Override
    public ServerResponse selectByUid(Integer uid) {
        return ServerResponse.createBySuccess(usermoneyMapper.selectByUid(uid));
    }


    @Override
    public ServerResponse selectAvailableMoney(Integer id) {
        return  ServerResponse.createBySuccess(usermoneyMapper.selectAvailableMoney(id));
    }

    @Override
    public ServerResponse updateUserMoney(Integer id) {
        return ServerResponse.createBySuccess(usermoneyMapper.updateUserMoney(id));
    }

}
