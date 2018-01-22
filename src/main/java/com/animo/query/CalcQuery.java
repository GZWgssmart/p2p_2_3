package com.animo.query;

import java.math.BigDecimal;

/**
 * Created by qingfeng on 2018/1/8.
 */
public class CalcQuery {
    private BigDecimal totalMoney;
    private Double nprofit;
    private Integer type;
    private Integer month;

    public BigDecimal getTotalMoney() {
        return totalMoney;
    }

    public void setTotalMoney(BigDecimal totalMoney) {
        this.totalMoney = totalMoney;
    }

    public Double getNprofit() {
        return nprofit;
    }

    public void setNprofit(Double nprofit) {
        this.nprofit = nprofit;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public Integer getMonth() {
        return month;
    }

    public void setMonth(Integer month) {
        this.month = month;
    }
}
