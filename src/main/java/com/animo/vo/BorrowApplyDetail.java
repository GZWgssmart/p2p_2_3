package com.animo.vo;

import com.fasterxml.jackson.annotation.JsonFormat;
import org.springframework.format.annotation.DateTimeFormat;

import javax.validation.constraints.DecimalMin;
import java.math.BigDecimal;
import java.util.Date;

/**
 * Created by 7025 on 2017/12/26.
 */
public class BorrowApplyDetail {
    private String rname;

    @DecimalMin(value="10000",message = "最小借款金额不能低于10000")
    private BigDecimal money;

    private Integer uid;

    private Integer bzid;

    private Integer type;

    private Integer term;
    /**
     * 对应borrowdetail表的money，为已投资金额
     */
    private BigDecimal moneyCount;

    private Date cktime;

    private Integer ckstatus;

    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date deadline;

    private Integer bdid;

    private Integer baid;

    private String bzname;

    private String fpic;

    private String ypic;

    private String qpic;

    private String tpic;

    private String mpurpose;

    private String hksource;

    private String suggest;

    private String xmdes;

    private String guarantee;

    private Float nprofit;

    private String way;

    private String cpname;

    public String getRname() {
        return rname;
    }

    public void setRname(String rname) {
        this.rname = rname;
    }

    public BigDecimal getMoney() {
        return money;
    }

    public void setMoney(BigDecimal money) {
        this.money = money;
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public Integer getBzid() {
        return bzid;
    }

    public void setBzid(Integer bzid) {
        this.bzid = bzid;
    }

    public String getBzname() {
        return bzname;
    }

    public void setBzname(String bzname) {
        this.bzname = bzname;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public Integer getTerm() {
        return term;
    }

    public void setTerm(Integer term) {
        this.term = term;
    }

    public BigDecimal getMoneyCount() {
        return moneyCount;
    }

    public void setMoneyCount(BigDecimal moneyCount) {
        this.moneyCount = moneyCount;
    }

    @JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")
    public Date getDeadline() {
        return deadline;
    }

    public void setDeadline(Date deadline) {
        this.deadline = deadline;
    }

    public Integer getBdid() {
        return bdid;
    }

    public void setBdid(Integer bdid) {
        this.bdid = bdid;
    }

    public String getFpic() {
        return fpic;
    }

    public void setFpic(String fpic) {
        this.fpic = fpic;
    }

    public String getYpic() {
        return ypic;
    }

    public void setYpic(String ypic) {
        this.ypic = ypic;
    }

    public String getQpic() {
        return qpic;
    }

    public void setQpic(String qpic) {
        this.qpic = qpic;
    }

    public String getTpic() {
        return tpic;
    }

    public void setTpic(String tpic) {
        this.tpic = tpic;
    }

    public String getMpurpose() {
        return mpurpose;
    }

    public void setMpurpose(String mpurpose) {
        this.mpurpose = mpurpose;
    }

    public String getHksource() {
        return hksource;
    }

    public void setHksource(String hksource) {
        this.hksource = hksource;
    }

    public String getSuggest() {
        return suggest;
    }

    public void setSuggest(String suggest) {
        this.suggest = suggest;
    }

    public String getXmdes() {
        return xmdes;
    }

    public void setXmdes(String xmdes) {
        this.xmdes = xmdes;
    }

    public String getGuarantee() {
        return guarantee;
    }

    public void setGuarantee(String guarantee) {
        this.guarantee = guarantee;
    }

    public Float getNprofit() {
        return nprofit;
    }

    public void setNprofit(Float nprofit) {
        this.nprofit = nprofit;
    }

    public String getWay() {
        return way;
    }

    public void setWay(String way) {
        this.way = way;
    }

    public String getCpname() {
        return cpname;
    }

    public void setCpname(String cpname) {
        this.cpname = cpname;
    }

    public Date getCktime() {
        return cktime;
    }

    public void setCktime(Date cktime) {
        this.cktime = cktime;
    }

    public Integer getCkstatus() {
        return ckstatus;
    }

    public void setCkstatus(Integer ckstatus) {
        this.ckstatus = ckstatus;
    }

    public Integer getBaid() {
        return baid;
    }

    public void setBaid(Integer baid) {
        this.baid = baid;
    }
}
