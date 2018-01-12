package com.animo.vo;

import java.math.BigDecimal;

/**
 * 报表统计VO
 */
public class StatisticalReportVO {
    //总交易额
    private BigDecimal tmoney;
    //总投资用户数
    private Integer ttzno;
    //总交易笔数
    private Integer allTrade;
    //总用户数
    private Integer tuser;
    //总贷款人数
    private Integer tdkno;
    //总贷款笔数
    private Integer tdkbno;
    //用户总收益
    private BigDecimal usersProfit;
    //已还本金
    private BigDecimal alreadyMoney;
    //待还本金
    private BigDecimal stillreturnMoney;

    public BigDecimal getTmoney() {
        return tmoney;
    }

    public void setTmoney(BigDecimal tmoney) {
        this.tmoney = tmoney;
    }

    public Integer getTtzno() {
        return ttzno;
    }

    public void setTtzno(Integer ttzno) {
        this.ttzno = ttzno;
    }

    public Integer getAllTrade() {
        return allTrade;
    }

    public void setAllTrade(Integer allTrade) {
        this.allTrade = allTrade;
    }

    public Integer getTuser() {
        return tuser;
    }

    public void setTuser(Integer tuser) {
        this.tuser = tuser;
    }

    public Integer getTdkno() {
        return tdkno;
    }

    public void setTdkno(Integer tdkno) {
        this.tdkno = tdkno;
    }

    public Integer getTdkbno() {
        return tdkbno;
    }

    public void setTdkbno(Integer tdkbno) {
        this.tdkbno = tdkbno;
    }

    public BigDecimal getUsersProfit() {
        return usersProfit;
    }

    public void setUsersProfit(BigDecimal usersProfit) {
        this.usersProfit = usersProfit;
    }

    public BigDecimal getAlreadyMoney() {
        return alreadyMoney;
    }

    public void setAlreadyMoney(BigDecimal alreadyMoney) {
        this.alreadyMoney = alreadyMoney;
    }

    public BigDecimal getStillreturnMoney() {
        return stillreturnMoney;
    }

    public void setStillreturnMoney(BigDecimal stillreturnMoney) {
        this.stillreturnMoney = stillreturnMoney;
    }
}
