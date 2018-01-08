package com.animo.dao;

import com.animo.common.ServerResponse;
import com.animo.pojo.Roleuser;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface RoleuserMapper extends BaseMapper{
    //批量分配用户角色
    ServerResponse save(String ridString, String huidString);
    int saveRoleuser(List<Roleuser> roleuserList);
    //根据登录的后台用户的id查询角色
    List<Roleuser> listByHuid(Integer huid);
}