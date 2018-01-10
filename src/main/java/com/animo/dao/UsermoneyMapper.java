package com.animo.dao;

import com.animo.pojo.Usermoney;
import org.springframework.stereotype.Repository;

import java.math.BigDecimal;

/**
 * Created by Animo on 2017-12-28.
 */

@Repository
public interface UsermoneyMapper extends BaseMapper{

    Usermoney selectByUid(Integer uid);

    Usermoney selectAvailableMoney(Integer id);

    int updateUserMoney(Object object);

}
