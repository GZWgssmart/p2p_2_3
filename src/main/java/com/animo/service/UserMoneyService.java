package com.animo.service;

import com.animo.pojo.Usermoney;
import org.springframework.stereotype.Repository;
import com.animo.common.ServerResponse;
import com.animo.pojo.Usermoney;

import java.math.BigDecimal;
/**
 * Created by Animo on 2017-12-28.
 */
@Repository
public interface UserMoneyService extends BaseService{

    Usermoney selectByUid(Integer uid);


    Usermoney selectAvailableMoney(Integer id);
}
