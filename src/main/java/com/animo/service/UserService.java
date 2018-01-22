package com.animo.service;

import com.animo.common.Pager;
import com.animo.pojo.User;

/**
 * Created by Administrator on 2017/12/25.
 */
public interface UserService extends BaseService {

    User getByTzm(Integer tzm);
    int getByPhone(String phone);
    User getByPhonePwd(String phone, String upwd);

    Pager listPagerCriteria(Integer beginIndex,Integer pageSize,String resstr2);

    int getByEmail(String email);

}
