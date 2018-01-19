package com.animo.service;

import com.animo.pojo.Home;

/**
 * Created by Administrator on 2018/1/17.
 */
public interface HomeService extends BaseService {
    Home listhome();
    int updhid(Integer hid);
    int updhids(Integer hid);
}
