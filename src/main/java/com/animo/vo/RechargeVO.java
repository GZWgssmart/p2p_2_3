package com.animo.vo;

import java.math.BigDecimal;
import java.util.Date;

/**
 * Created by qm on 2018/1/2.
 *
 * @author qm
 * @date 2018-01-02 16:09
 */
public class RechargeVO {

    private  Integer cardno;
    private String type;
    private BigDecimal money;
    private Integer status;
    private Date created_time;

    public Integer getCardno() {
        return cardno;
    }

    public void setCardno(Integer cardno) {
        this.cardno = cardno;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public BigDecimal getMoney() {
        return money;
    }

    public void setMoney(BigDecimal money) {
        this.money = money;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Date getCreated_time() {
        return created_time;
    }

    public void setCreated_time(Date created_time) {
        this.created_time = created_time;
    }
}
