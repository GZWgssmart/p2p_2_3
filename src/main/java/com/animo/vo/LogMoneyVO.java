package com.animo.vo;

import java.math.BigDecimal;
import java.util.Date;

/**
 * Created by qm on 2018/1/4.
 *
 * @author qm
 * @date 2018-01-04 20:43
 */
public class LogMoneyVO {

    private Integer type;

    private BigDecimal income;

    private BigDecimal outlay;

    private BigDecimal kymoney;

    private Date createdTime;

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public BigDecimal getIncome() {
        return income;
    }

    public void setIncome(BigDecimal income) {
        this.income = income;
    }

    public BigDecimal getOutlay() {
        return outlay;
    }

    public void setOutlay(BigDecimal outlay) {
        this.outlay = outlay;
    }

    public BigDecimal getKymoney() {
        return kymoney;
    }

    public void setKymoney(BigDecimal kymoney) {
        this.kymoney = kymoney;
    }

    public Date getCreatedTime() {
        return createdTime;
    }

    public void setCreatedTime(Date createdTime) {
        this.createdTime = createdTime;
    }
}
