package com.animo.dao;

import com.animo.pojo.Reward;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface RewardMapper extends BaseMapper{

    Reward selectByUid(Integer uid);

    List<Reward> selectByStatus(@Param("status") String status);


}