package com.animo.pojo;

import java.util.Date;

public class UserTicket {
    private Integer ukid;

    private Integer uid;

    private Integer kid;

    private Date tktime;

    public Integer getUkid() {
        return ukid;
    }

    public void setUkid(Integer ukid) {
        this.ukid = ukid;
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public Integer getKid() {
        return kid;
    }

    public void setKid(Integer kid) {
        this.kid = kid;
    }

    public Date getTktime() {
        return tktime;
    }

    public void setTktime(Date tktime) {
        this.tktime = tktime;
    }
}