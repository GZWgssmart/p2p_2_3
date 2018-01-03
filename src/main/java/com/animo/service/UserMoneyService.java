package com.animo.service;

import com.animo.pojo.Usermoney;
import org.springframework.stereotype.Repository;

/**
 * Created by Animo on 2017-12-28.
 */
@Repository
public interface UserMoneyService extends BaseService{

    Usermoney selectByUid(Integer uid);

}
