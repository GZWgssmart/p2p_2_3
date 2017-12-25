package com.animo.service;

import com.animo.pojo.User;

/**
 * Created by Administrator on 2017/12/25.
 */
public interface UserService {

    User getByTzm(Integer tzm);
    int saveUser(String phone, String upwd);
    int getByPhone(String phone);
    User getByPhonePwd(String phone, String upwd);

}
