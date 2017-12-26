package com.animo.dao;

import com.animo.pojo.Role;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface RoleMapper extends BaseMapper{
    List<Role> listAll();
}