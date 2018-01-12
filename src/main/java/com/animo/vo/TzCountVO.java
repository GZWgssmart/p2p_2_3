package com.animo.vo;

import java.math.BigDecimal;

/**
 * Created by 7025 on 2018/1/11.
 * 用户投资总额计算
 */
public class TzCountVO {
    private BigDecimal totalMoney;
    private Integer uid;

    public BigDecimal getTotalMoney() {
        return totalMoney;
    }

    public void setTotalMoney(BigDecimal totalMoney) {
        this.totalMoney = totalMoney;
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }
}
