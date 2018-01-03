package com.animo.pojo;

import java.math.BigDecimal;
import java.util.Date;

public class Reward {
    private Integer rwid;

    private Integer uid;

    private BigDecimal tmoney;

    private BigDecimal money;

    private String status;

    private Date rewardTime;

    public Integer getRwid() {
        return rwid;
    }

    public void setRwid(Integer rwid) {
        this.rwid = rwid;
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public BigDecimal getTmoney() {
        return tmoney;
    }

    public void setTmoney(BigDecimal tmoney) {
        this.tmoney = tmoney;
    }

    public BigDecimal getMoney() {
        return money;
    }

    public void setMoney(BigDecimal money) {
        this.money = money;
    }


    public Date getRewardTime() {
        return rewardTime;
    }

    public void setRewardTime(Date rewardTime) {
        this.rewardTime = rewardTime;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}