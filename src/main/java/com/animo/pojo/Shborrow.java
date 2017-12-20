package com.animo.pojo;

import java.util.Date;

public class Shborrow {
    private Integer shid;

    private Integer huid;

    private Integer isok;

    private String excuse;

    private Date cktime;

    private Integer baid;

    public Integer getShid() {
        return shid;
    }

    public void setShid(Integer shid) {
        this.shid = shid;
    }

    public Integer getHuid() {
        return huid;
    }

    public void setHuid(Integer huid) {
        this.huid = huid;
    }

    public Integer getIsok() {
        return isok;
    }

    public void setIsok(Integer isok) {
        this.isok = isok;
    }

    public String getExcuse() {
        return excuse;
    }

    public void setExcuse(String excuse) {
        this.excuse = excuse == null ? null : excuse.trim();
    }

    public Date getCktime() {
        return cktime;
    }

    public void setCktime(Date cktime) {
        this.cktime = cktime;
    }

    public Integer getBaid() {
        return baid;
    }

    public void setBaid(Integer baid) {
        this.baid = baid;
    }
}