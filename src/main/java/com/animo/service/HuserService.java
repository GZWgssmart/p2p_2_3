package com.animo.service;

import com.animo.pojo.Huser;

/**
 * Created by Administrator on 2017/12/25.
 */
public interface HuserService extends BaseService{

    Huser getByPhonePwd(String phone, String pwd);
    int getByPhone(String phone);
    int saveHuser(Huser huser);
}
