package com.animo.service;

import com.animo.pojo.Huser;
import org.apache.ibatis.annotations.Param;

/**
 * Created by Administrator on 2017/12/25.
 */
public interface HuserService extends BaseService{

    Huser getByPhonePwd(String phone, String pwd);
    int getByPhone(String phone);
    int saveHuser(Huser huser);
    void updatePwd(String pwd, Integer huid);
}
