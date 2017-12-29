package com.animo.vo;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.math.BigDecimal;
import java.util.Date;

/**
 * Created by Animo on 2017-12-28.
 */
public class TzbVo {

    private String rname;
    private BigDecimal money;
    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss",timezone = "GMT+8")
    private Date tztime;

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

    public Date getTztime() {
        return tztime;
    }

    public void setTztime(Date tztime) {
        this.tztime = tztime;
    }
}
