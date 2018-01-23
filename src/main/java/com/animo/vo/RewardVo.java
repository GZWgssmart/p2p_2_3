package com.animo.vo;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.math.BigDecimal;
import java.util.Date;

public class RewardVo {

    private BigDecimal tmoney;
    private BigDecimal money;
    private String  status;
    private Date rewardTime;
    private String uname;
    private String phone;

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

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss",timezone = "GMT+8")
    public Date getRewardTime() {
        return rewardTime;
    }

    public void setRewardTime(Date rewardTime) {
        this.rewardTime = rewardTime;
    }

    public String getUname() {
        return uname;
    }

    public void setUname(String uname) {
        this.uname = uname;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }
}
