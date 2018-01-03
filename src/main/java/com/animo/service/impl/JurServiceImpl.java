package com.animo.service.impl;

import com.animo.dao.JurMapper;
import com.animo.pojo.Jur;
import com.animo.service.JurService;
import com.animo.vo.RoleJurVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class JurServiceImpl extends AbstractServiceImpl implements JurService {

    private JurMapper jurMapper;

    @Autowired
    public void setJurMapper(JurMapper jurMapper){
        super.setBaseMapper(jurMapper);
        this.jurMapper = jurMapper;
    }

    @Override
    public List<Jur> listAll() {
        return jurMapper.listAll();
    }

    @Override
    public List<RoleJurVO> listByRid(Integer rid) {
        return jurMapper.listByRid(rid);
    }
}
