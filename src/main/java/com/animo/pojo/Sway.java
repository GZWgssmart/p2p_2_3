package com.animo.pojo;

public class Sway {
    private Integer sid;

    private String way;

    private String fw;

    private Integer status;

    public Integer getSid() {
        return sid;
    }

    public void setSid(Integer sid) {
        this.sid = sid;
    }

    public String getWay() {
        return way;
    }

    public void setWay(String way) {
        this.way = way == null ? null : way.trim();
    }

    public String getFw() {
        return fw;
    }

    public void setFw(String fw) {
        this.fw = fw == null ? null : fw.trim();
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }
}