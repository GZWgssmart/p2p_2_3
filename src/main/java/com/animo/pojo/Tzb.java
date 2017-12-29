package com.animo.pojo;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.math.BigDecimal;
import java.util.Date;

public class Tzb {
    private Integer tzid;

    private Integer uid;

    private Integer juid;

    private BigDecimal money;

    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss",timezone = "GMT+8")
    private Date tztime;

    private Float nprofit;

    private String cpname;

    private Integer baid;

    private Integer resint1;

    private Integer resint2;

    private String resstr1;

    private String resstr2;

    public Integer getTzid() {
        return tzid;
    }

    public void setTzid(Integer tzid) {
        this.tzid = tzid;
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public Integer getJuid() {
        return juid;
    }

    public void setJuid(Integer juid) {
        this.juid = juid;
    }

    public BigDecimal getMoney() {
        return money;
    }

    public void setMoney(BigDecimal money) {
        this.money = money;
    }

    public Date getTztime() {
        return tztime;
    }

    public void setTztime(Date tztime) {
        this.tztime = tztime;
    }

    public Float getNprofit() {
        return nprofit;
    }

    public void setNprofit(Float nprofit) {
        this.nprofit = nprofit;
    }

    public String getCpname() {
        return cpname;
    }

    public void setCpname(String cpname) {
        this.cpname = cpname == null ? null : cpname.trim();
    }

    public Integer getBaid() {
        return baid;
    }

    public void setBaid(Integer baid) {
        this.baid = baid;
    }

    public Integer getResint1() {
        return resint1;
    }

    public void setResint1(Integer resint1) {
        this.resint1 = resint1;
    }

    public Integer getResint2() {
        return resint2;
    }

    public void setResint2(Integer resint2) {
        this.resint2 = resint2;
    }

    public String getResstr1() {
        return resstr1;
    }

    public void setResstr1(String resstr1) {
        this.resstr1 = resstr1 == null ? null : resstr1.trim();
    }

    public String getResstr2() {
        return resstr2;
    }

    public void setResstr2(String resstr2) {
        this.resstr2 = resstr2 == null ? null : resstr2.trim();
    }
}