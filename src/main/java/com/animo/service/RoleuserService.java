package com.animo.service;

import com.animo.common.ServerResponse;
import com.animo.pojo.Role;
import com.animo.pojo.Roleuser;

import java.util.List;

public interface RoleuserService extends BaseService{
    ServerResponse save(String ridString, String huidString);
    List<Roleuser> listByHuid(Integer huid);
}