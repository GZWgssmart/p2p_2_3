package com.animo.dao;

import com.animo.pojo.Hkb;

public interface HkbMapper {
    int deleteByPrimaryKey(Integer hkid);

    int insert(Hkb record);

    int insertSelective(Hkb record);

    Hkb selectByPrimaryKey(Integer hkid);

    int updateByPrimaryKeySelective(Hkb record);

    int updateByPrimaryKey(Hkb record);
}