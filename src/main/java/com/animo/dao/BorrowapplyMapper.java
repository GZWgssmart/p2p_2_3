package com.animo.dao;

import com.animo.common.Pager;
import com.animo.pojo.Borrowapply;
import com.animo.vo.BorrowApplyDetail;
import com.animo.vo.BorrowapplyVo;
import com.animo.vo.BorrowingVO;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;

public interface BorrowapplyMapper extends BaseMapper{

    int updateTime (@Param("baid") Integer baid,@Param("ckstatus") Integer ckstatus,@Param("cktime") Date cktime);

    List<Object> three(Integer bzid);

    List<Object> listPagerCriteria(@Param("pager") Pager pager, @Param("query") Object obj);

    Long countCriteria(@Param("query") Object obj);

    Object getById(Integer baid);


   Object getByIdVo(Integer baid);

    int updateStatusAndTime(@Param("id") Integer id,@Param("status") Integer status, @Param("ckTime") Date ckTime);

    List<Borrowapply> list(Integer ckstatus);

    List<BorrowApplyDetail> getByCkstaus(Integer ckstatus);

    List<Object> listByJuid(@Param("pager") Pager pager, @Param("juid") Integer juid);
    Long  countByJuid(Integer juid);

    int updateStatus(@Param("baid") Integer baid,@Param("ckstatus") Integer ckstatus);

    List<BorrowingVO> borrowingList();

}