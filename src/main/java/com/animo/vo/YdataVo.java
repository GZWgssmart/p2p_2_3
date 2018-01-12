package com.animo.vo;

import java.util.Date;

/**
 * Created by 123456 on 2018/1/10.
 */
public class YdataVo {

    private Integer yid;
    private Date date;
    private String stringDate;

    public Integer getYid() {
        return yid;
    }

    public void setYid(Integer yid) {
        this.yid = yid;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getStringDate() {
        return stringDate;
    }

    public void setStringDate(String stringDate) {
        this.stringDate = stringDate;
    }

    @Override
    public String toString() {
        return "YdataVo{" +
                "yid=" + yid +
                ", date=" + date +
                '}';
    }
}
