package com.animo.dao;

import com.animo.pojo.Usermoney;
import org.springframework.stereotype.Repository;

/**
 * Created by Animo on 2017-12-28.
 */
@Repository
public interface UsermoneyMapper extends BaseMapper{

    Usermoney selectByUid(Integer uid);

}
