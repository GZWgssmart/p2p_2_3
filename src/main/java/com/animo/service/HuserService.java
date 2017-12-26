package com.animo.service;

import com.animo.pojo.Huser;

/**
 * Created by Administrator on 2017/12/25.
 */
public interface HuserService {

    Huser getByPhonePwd(String phone, String pwd);
}
