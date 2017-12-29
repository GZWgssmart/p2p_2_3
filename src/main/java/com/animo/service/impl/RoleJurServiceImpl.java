package com.animo.service.impl;

import com.animo.common.ServerResponse;
import com.animo.dao.RoleMapper;
import com.animo.dao.RolejurMapper;
import com.animo.pojo.Role;
import com.animo.pojo.Rolejur;
import com.animo.service.RoleJurService;
import com.animo.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class RoleJurServiceImpl extends AbstractServiceImpl implements RoleJurService {


    private RolejurMapper rolejurMapper;

    @Autowired
    public void setRolejurMapper(RolejurMapper rolejurMapper) {
        super.setBaseMapper(rolejurMapper);
        this.rolejurMapper = rolejurMapper;
    }

    @Transactional
    @Override
    public int saveRolejur(List<Rolejur> rolejurList) {
        return rolejurMapper.saveRolejur(rolejurList);
    }
}