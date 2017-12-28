package com.animo.dao;

import java.math.BigDecimal;

public interface RewardSettingMapper extends BaseMapper{

    Double selectpercent(BigDecimal money);

}