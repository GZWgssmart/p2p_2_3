package com.animo.service;

import com.animo.pojo.Role;

import java.util.List;

public interface RoleService extends BaseService{
    List<Role> listAll();
}