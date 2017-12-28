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
public class HuserServiceImpl extends AbstractServiceImpl implements HuserService {

    private HuserMapper huserMapper;


    @Autowired
   public void setHuserMapper(HuserMapper huserMapper) {
        super.setBaseMapper(huserMapper);
        this.huserMapper = huserMapper;
    }

    @Override
    public Huser getByPhonePwd(String phone, String pwd) {
        return huserMapper.getByPhonePwd(phone, pwd);
    }

    @Override
    public int getByPhone(String phone) {
        return huserMapper.getByPhone(phone);
    }

    @Override
    public int saveHuser(Huser huser) {
        return huserMapper.saveHuser(huser);
    }

    @Override
    public void updatePwd(String pwd, Integer huid) {
        huserMapper.updatePwd(pwd, huid);
    }
}
