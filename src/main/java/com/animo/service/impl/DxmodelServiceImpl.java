package com.animo.service.impl;

import com.animo.common.ServerResponse;
import com.animo.dao.DxmodelMapper;
import com.animo.dao.JklxMapper;
import com.animo.pojo.Dxmodel;
import com.animo.service.DxmodelService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by CHEN JX on 2017/12/22.
 */
@Service
public class DxmodelServiceImpl extends AbstractServiceImpl implements DxmodelService{

    private DxmodelMapper dxmodelMapper;


    @Autowired
    public void setDxmodelMapper(DxmodelMapper dxmodelMapper) {
        super.setBaseMapper(dxmodelMapper);
        this.dxmodelMapper = dxmodelMapper;
    }

}
