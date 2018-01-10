package com.animo.service;

import com.animo.common.ServerResponse;
import org.springframework.stereotype.Repository;

/**
 * Created by Animo on 2017-12-28.
 */
@Repository
public interface UserMoneyService extends BaseService {

    ServerResponse selectByUid(Integer uid);

    ServerResponse selectAvailableMoney(Integer id);

    ServerResponse updateUserMoney(Integer id);
}
