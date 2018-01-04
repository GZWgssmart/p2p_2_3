package com.animo.service;

import com.animo.pojo.Bankcard;

/**
 * Created by qm on 2017/12/22.
 *
 * @author qm
 * @date 2017-12-22 8:55
 */
public interface BankCardService extends BaseService{

    Bankcard getByUid(Integer id);

}
