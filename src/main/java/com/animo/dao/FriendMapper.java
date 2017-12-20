package com.animo.dao;

import com.animo.pojo.Friend;

public interface FriendMapper {
    int deleteByPrimaryKey(Integer fid);

    int insert(Friend record);

    int insertSelective(Friend record);

    Friend selectByPrimaryKey(Integer fid);

    int updateByPrimaryKeySelective(Friend record);

    int updateByPrimaryKey(Friend record);
}