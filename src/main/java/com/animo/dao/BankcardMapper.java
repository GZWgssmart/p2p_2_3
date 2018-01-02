package com.animo.dao;

import com.animo.pojo.Bankcard;
import org.springframework.stereotype.Repository;

@Repository
public interface BankcardMapper extends BaseMapper{

    Bankcard getByUid(Integer id);

}