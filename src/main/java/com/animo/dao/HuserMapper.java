package com.animo.dao;

import com.animo.pojo.Huser;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface HuserMapper extends BaseMapper{

    Huser getByPhonePwd(@Param("phone") String phone, @Param("pwd") String pwd);
    int getByPhone(String phone);
    int saveHuser(Huser huser);
    void updatePwd(@Param("pwd")String pwd, @Param("huid")int huid);

}