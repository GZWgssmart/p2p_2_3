package com.animo.vo;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.math.BigDecimal;
import java.util.Date;

/**
 * Created by Animo on 2017-12-25.
 */
public class BorrowapplyVo {

    //标种id
    private Integer bzid;
    //借款id
    private Integer baid;

    //标种名称
    private String bzname;
    //产品名称
    private String cpname;
    //目标金额
    private BigDecimal money;
    //已投总金额
    private BigDecimal ymoney;
    //借款期限
    private int term;
    //年化收益
    private float nprofit;

    private Integer ckstatus;

    private Integer bdid;

    private Integer uid;

    private String way;

    private Date deadline;

    public Integer getBzid() {
        return bzid;
    }

    public void setBzid(Integer bzid) {
        this.bzid = bzid;
    }

    public Integer getBaid() {
        return baid;
    }

    public void setBaid(Integer baid) {
        this.baid = baid;
    }

    public String getBzname() {
        return bzname;
    }

    public void setBzname(String bzname) {
        this.bzname = bzname;
    }

    public String getCpname() {
        return cpname;
    }

    public void setCpname(String cpname) {
        this.cpname = cpname;
    }

    public BigDecimal getMoney() {
        return money;
    }

    public void setMoney(BigDecimal money) {
        this.money = money;
    }

    public BigDecimal getYmoney() {
        return ymoney;
    }

    public void setYmoney(BigDecimal ymoney) {
        this.ymoney = ymoney;
    }

    public int getTerm() {
        return term;
    }

    public void setTerm(int term) {
        this.term = term;
    }

    public float getNprofit() {
        return nprofit;
    }

    public void setNprofit(float nprofit) {
        this.nprofit = nprofit;
    }

    public Integer getBdid() {
        return bdid;
    }

    public void setBdid(Integer bdid) {
        this.bdid = bdid;
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public Integer getCkstatus() {
        return ckstatus;
    }

    public void setCkstatus(Integer ckstatus) {
        this.ckstatus = ckstatus;
    }

    public String getWay() {
        return way;
    }

    public void setWay(String way) {
        this.way = way;
    }

    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss",timezone = "GMT+8")
    public Date getDeadline() {
        return deadline;
    }

    public void setDeadline(Date deadline) {
        this.deadline = deadline;
    }
}
