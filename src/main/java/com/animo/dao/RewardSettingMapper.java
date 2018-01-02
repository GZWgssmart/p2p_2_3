package com.animo.dao;

import org.springframework.stereotype.Repository;

import java.math.BigDecimal;
@Repository
public interface RewardSettingMapper extends BaseMapper{

    Double selectpercent(BigDecimal money);

}