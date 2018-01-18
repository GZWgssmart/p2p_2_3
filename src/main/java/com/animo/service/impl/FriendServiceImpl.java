package com.animo.service.impl;

import com.animo.common.ServerResponse;
import com.animo.dao.FriendMapper;
import com.animo.dao.JurMapper;
import com.animo.pojo.Jur;
import com.animo.service.FriendService;
import com.animo.service.JurService;
import com.animo.vo.RoleJurVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class FriendServiceImpl extends AbstractServiceImpl implements FriendService {

    private FriendMapper friendMapper;

    @Autowired
    public void setJurMapper(FriendMapper friendMapper){
        super.setBaseMapper(friendMapper);
        this.friendMapper = friendMapper;
    }

    @Override
    public ServerResponse list() {
        return ServerResponse.createBySuccess(friendMapper.list());
    }
}
