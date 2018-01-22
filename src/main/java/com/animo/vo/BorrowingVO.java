package com.animo.vo;

import java.math.BigDecimal;
import java.util.Date;

/**
 * Created by 7025 on 2018/1/12.
 * 查找所有借款中的标，用来判断是否流标
 */
public class BorrowingVO {
    private Integer baid;
    private Integer juid;
    private Date deadline;
    private BigDecimal moneyCount;
    private String way;
    private Integer term;
    private Float nprofit;
    private Date cktime;

    public Integer getBaid() {
        return baid;
    }

    public void setBaid(Integer baid) {
        this.baid = baid;
    }

    public Integer getJuid() {
        return juid;
    }

    public void setJuid(Integer juid) {
        this.juid = juid;
    }

    public Date getDeadline() {
        return deadline;
    }

    public void setDeadline(Date deadline) {
        this.deadline = deadline;
    }

    public BigDecimal getMoneyCount() {
        return moneyCount;
    }

    public void setMoneyCount(BigDecimal moneyCount) {
        this.moneyCount = moneyCount;
    }

    public String getWay() {
        return way;
    }

    public void setWay(String way) {
        this.way = way;
    }

    public Integer getTerm() {
        return term;
    }

    public void setTerm(Integer term) {
        this.term = term;
    }

    public Float getNprofit() {
        return nprofit;
    }

    public void setNprofit(Float nprofit) {
        this.nprofit = nprofit;
    }

    public Date getCktime() {
        return cktime;
    }

    public void setCktime(Date cktime) {
        this.cktime = cktime;
    }
}
