package com.animo.dao;

import org.springframework.stereotype.Repository;

@Repository
public interface RzvipMapper extends BaseMapper{

    int saveUid(Integer uid);

}