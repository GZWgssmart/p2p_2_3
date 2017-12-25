package com.animo.service.impl;

import com.animo.dao.HuserMapper;
import com.animo.pojo.Huser;
import com.animo.service.HuserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by Administrator on 2017/12/25.
 */
@Service
public class HuserServiceImpl implements HuserService {

    @Autowired
    private HuserMapper huserMapper;

    @Override
    public Huser getByPhonePwd(String phone, String pwd) {
        return huserMapper.getByPhonePwd(phone, pwd);
    }
}
