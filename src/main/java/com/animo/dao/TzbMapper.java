package com.animo.dao;

import com.animo.common.Pager;
import com.animo.pojo.Tzb;
import com.animo.vo.TzCountVO;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
public interface TzbMapper extends BaseMapper{

    List<Object> listPagerByBaid(@Param("pager") Pager pager,@Param("baid") Integer baid,@Param("uid") Integer uid);

    Long countByBaid(@Param("baid") Integer baid,@Param("uid") Integer uid);

    List<Tzb> listTzb(@Param("uid") Integer uid,@Param("baid") Integer baid);

    List<Object> listInvestByUid(@Param("pager") Pager pager,@Param("uid") Integer uid);

    Long countByUid(Integer uid);

    List<TzCountVO>  getTotalTzMoney(Integer baid);

    List<Tzb> getByBaid(Integer baid);
}