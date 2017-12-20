package com.animo.dao;

import com.animo.pojo.Borrowapply;

public interface BorrowapplyMapper {
    int deleteByPrimaryKey(Integer baid);

    int insert(Borrowapply record);

    int insertSelective(Borrowapply record);

    Borrowapply selectByPrimaryKey(Integer baid);

    int updateByPrimaryKeySelective(Borrowapply record);

    int updateByPrimaryKey(Borrowapply record);
}