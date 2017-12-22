package com.animo.service.impl;

import com.animo.common.ServerResponse;
import com.animo.common.ValidationResult;
import com.animo.dao.JklxMapper;
import com.animo.pojo.Jklx;
import com.animo.service.JklxService;
import com.animo.utils.ValidationUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by Animo on 2017-12-22.
 */
@Service
public class JklxServiceImpl implements JklxService{

    @Autowired
    private JklxMapper jklxMapper;

    @Override
    public ServerResponse<String> save(Jklx jklx) {
        if(jklx!=null){
            ValidationResult result = ValidationUtils.validateProperty(jklx,"lxname");
            if(result.isHasErrors()){
                return ServerResponse.createByError(result.getErrorMsg());
            }
            Integer integer = jklxMapper.insertSelective(jklx);
            if(integer==1){
                return ServerResponse.createBySuccess("添加成功");
            }
            return ServerResponse.createBySuccess("添加失败");
        }
        return ServerResponse.createByError("请输入内容");
    }
}
