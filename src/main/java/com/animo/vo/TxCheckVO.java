package com.animo.vo;

import java.math.BigDecimal;

/**
 * Created by qm on 2018/1/9.
 *
 * @author qm
 * @date 2018-01-09 16:26
 */
public class TxCheckVO {

    private Integer txid;
    private Integer uid;
    private BigDecimal money;
    private Integer status;
    private String excuse;
    private Integer huid;

    public Integer getTxid() {
        return txid;
    }

    public void setTxid(Integer txid) {
        this.txid = txid;
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
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

    public String getExcuse() {
        return excuse;
    }

    public void setExcuse(String excuse) {
        this.excuse = excuse;
    }

    public Integer getHuid() {
        return huid;
    }

    public void setHuid(Integer huid) {
        this.huid = huid;
    }
}
