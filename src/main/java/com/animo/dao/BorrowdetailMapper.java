package com.animo.dao;

import com.animo.pojo.Borrowdetail;

public interface BorrowdetailMapper {
    int deleteByPrimaryKey(Integer bdid);

    int insert(Borrowdetail record);

    int insertSelective(Borrowdetail record);

    Borrowdetail selectByPrimaryKey(Integer bdid);

    int updateByPrimaryKeySelective(Borrowdetail record);

    int updateByPrimaryKey(Borrowdetail record);
}