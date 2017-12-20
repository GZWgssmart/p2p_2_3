package com.animo.dao;

import com.animo.pojo.Skb;

public interface SkbMapper {
    int deleteByPrimaryKey(Integer skid);

    int insert(Skb record);

    int insertSelective(Skb record);

    Skb selectByPrimaryKey(Integer skid);

    int updateByPrimaryKeySelective(Skb record);

    int updateByPrimaryKey(Skb record);
}