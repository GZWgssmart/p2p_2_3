package com.animo.service;

import java.math.BigDecimal;

/**
 * Created by Animo on 2017-12-28.
 */
public interface RewardSettingService extends BaseService{

    Double selectpercent(BigDecimal money);

}
