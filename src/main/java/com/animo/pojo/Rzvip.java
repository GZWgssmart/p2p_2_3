package com.animo.pojo;

public class Rzvip {
    private Integer rzid;

    private Integer uid;

    private String xl;

    private String ism;

    private String bschool;

    private String addr;

    private String work;

    private Integer age;

    private Integer resint1;

    private Integer resint2;

    private String resstr1;

    private String resstr2;

    public Integer getRzid() {
        return rzid;
    }

    public void setRzid(Integer rzid) {
        this.rzid = rzid;
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public String getXl() {
        return xl;
    }

    public void setXl(String xl) {
        this.xl = xl == null ? null : xl.trim();
    }

    public String getIsm() {
        return ism;
    }

    public void setIsm(String ism) {
        this.ism = ism == null ? null : ism.trim();
    }

    public String getBschool() {
        return bschool;
    }

    public void setBschool(String bschool) {
        this.bschool = bschool == null ? null : bschool.trim();
    }

    public String getAddr() {
        return addr;
    }

    public void setAddr(String addr) {
        this.addr = addr == null ? null : addr.trim();
    }

    public String getWork() {
        return work;
    }

    public void setWork(String work) {
        this.work = work == null ? null : work.trim();
    }

    public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age;
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