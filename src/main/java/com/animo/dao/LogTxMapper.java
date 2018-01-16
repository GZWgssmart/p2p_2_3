package com.animo.dao;

import com.animo.common.Pager;
import com.animo.pojo.LogTx;
import com.animo.pojo.Usermoney;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface LogTxMapper extends BaseMapper {


    List<Object> listPagerByUid(@Param("pager") Pager pager, @Param("uid") Integer uid);

    Long countByUid(@Param("uid") Integer uid);

    Usermoney selectAvailableMoney(Integer id);

    List<Object> listAll(@Param("pager") Pager pager);

    int updateStatus(@Param("txid") Integer txid,@Param("status")Integer status);

}