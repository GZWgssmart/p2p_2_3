package com.animo.dao;

import com.animo.pojo.Home;
import org.springframework.stereotype.Repository;

@Repository
public interface HomeMapper extends BaseMapper {
    Home listhome();
    int updhid(Integer hid);
    int updhids(Integer hid);
}