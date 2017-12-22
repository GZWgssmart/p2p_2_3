package com.animo.service;

import com.animo.common.ServerResponse;
import com.animo.pojo.Role;

public interface RoleService {

    ServerResponse<String> save(Role role);
}