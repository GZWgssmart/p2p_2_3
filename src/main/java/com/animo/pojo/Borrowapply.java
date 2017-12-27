package com.animo.pojo;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonInclude;
import org.hibernate.validator.constraints.NotBlank;

import javax.validation.constraints.DecimalMin;
import javax.validation.constraints.NotNull;
import java.math.BigDecimal;
import java.util.Date;

@JsonInclude(JsonInclude.Include.NON_NULL)
public class Borrowapply {
    private Integer baid;

    @NotBlank(message = "姓名不能为空")
    private String rname;

    @DecimalMin(value = "10000",message = "借款金额最少10000")
    private BigDecimal money;

    private Integer uid;

    @NotNull(message = "请选择标种")
    private Integer bzid;

    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss",timezone = "GMT+8")
    private Date cktime;

    private Integer ckstatus;

    @NotNull(message = "请选择借款类型")
    private Integer type;

    private Integer term;

    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss",timezone = "GMT+8")
    private Date deadline;

    private Integer resint1;

    private Integer resint2;

    private String resstr1;

    private String resstr2;

    public Integer getBaid() {
        return baid;
    }

    public void setBaid(Integer baid) {
        this.baid = baid;
    }

    public String getRname() {
        return rname;
    }

    public void setRname(String rname) {
        this.rname = rname == null ? null : rname.trim();
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

    public Date getDeadline() {
        return deadline;
    }

    public void setDeadline(Date deadline) {
        this.deadline = deadline;
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