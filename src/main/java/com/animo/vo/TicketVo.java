package com.animo.vo;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.math.BigDecimal;
import java.util.Date;

/**
 * Created by Animo on 2018-01-22.
 */
public class TicketVo {

    private Integer type;
    private BigDecimal tkmoney;
    private Integer isvip;
    private Date tktime;
    private Date ttime;
    private Integer ukid;

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public BigDecimal getTkmoney() {
        return tkmoney;
    }

    public void setTkmoney(BigDecimal tkmoney) {
        this.tkmoney = tkmoney;
    }

    public Integer getIsvip() {
        return isvip;
    }

    public void setIsvip(Integer isvip) {
        this.isvip = isvip;
    }

    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss",timezone = "GMT+8")
    public Date getTktime() {
        return tktime;
    }

    public void setTktime(Date tktime) {
        this.tktime = tktime;
    }

    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss",timezone = "GMT+8")
    public Date getTtime() {
        return ttime;
    }

    public void setTtime(Date ttime) {
        this.ttime = ttime;
    }

    public Integer getUkid() {
        return ukid;
    }

    public void setUkid(Integer ukid) {
        this.ukid = ukid;
    }
}
