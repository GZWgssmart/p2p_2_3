package com.animo.pojo;

import java.math.BigDecimal;

public class RewardSetting {
    private Integer rwsid;

    private BigDecimal minmoney;

    private BigDecimal maxmoney;

    private Double percent;

    public Integer getRwsid() {
        return rwsid;
    }

    public void setRwsid(Integer rwsid) {
        this.rwsid = rwsid;
    }

    public BigDecimal getMinmoney() {
        return minmoney;
    }

    public void setMinmoney(BigDecimal minmoney) {
        this.minmoney = minmoney;
    }

    public BigDecimal getMaxmoney() {
        return maxmoney;
    }

    public void setMaxmoney(BigDecimal maxmoney) {
        this.maxmoney = maxmoney;
    }

    public Double getPercent() {
        return percent;
    }

    public void setPercent(Double percent) {
        this.percent = percent;
    }
}