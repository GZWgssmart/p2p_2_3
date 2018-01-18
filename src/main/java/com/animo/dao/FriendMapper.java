package com.animo.dao;

import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface FriendMapper extends BaseMapper{

    List<Object> list();

}