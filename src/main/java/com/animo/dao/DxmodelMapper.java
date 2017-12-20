package com.animo.dao;

import com.animo.pojo.Dxmodel;

public interface DxmodelMapper {
    int deleteByPrimaryKey(Integer dxid);

    int insert(Dxmodel record);

    int insertSelective(Dxmodel record);

    Dxmodel selectByPrimaryKey(Integer dxid);

    int updateByPrimaryKeySelective(Dxmodel record);

    int updateByPrimaryKey(Dxmodel record);
}