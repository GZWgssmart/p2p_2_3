package com.animo.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.math.BigDecimal;

@Repository
public interface BorrowdetailMapper extends BaseMapper {

    int updateMoney(@Param("money") BigDecimal money,@Param("baid") Integer baid);

    BigDecimal selectMoney(Integer baid);

}