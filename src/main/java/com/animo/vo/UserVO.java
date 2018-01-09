package com.animo.vo;

import java.util.Date;

/**
 * Created by Animo on 2017-12-20.
 */
public class UserVO {

    //User,Revip,Recommend三表
    private int uid;
    private String uname;//昵称
    private String phone;
    private Integer tzm;
    private String idtype;
    private String idno;
    private String email;
    private String rname;//真实姓名
    private String sex;
    private Integer isvip;
    private String xl;
    private String ism;
    private String bschool;
    private String addr;
    private String work;
    private Integer age;
    private String tname;//推荐人姓名
    private Date createdTime;//推荐时间


    private String resstr2;

    public String getResstr2() {
        return resstr2;
    }

    public void setResstr2(String resstr2) {
        this.resstr2 = resstr2;
    }

    private Integer tid;

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    public String getUname() {
        return uname;
    }

    public void setUname(String uname) {
        this.uname = uname;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public Integer getTzm() {
        return tzm;
    }

    public void setTzm(Integer tzm) {
        this.tzm = tzm;
    }

    public String getIdtype() {
        return idtype;
    }

    public void setIdtype(String idtype) {
        this.idtype = idtype;
    }

    public String getIdno() {
        return idno;
    }

    public void setIdno(String idno) {
        this.idno = idno;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getRname() {
        return rname;
    }

    public void setRname(String rname) {
        this.rname = rname;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public Integer getIsvip() {
        return isvip;
    }

    public void setIsvip(Integer isvip) {
        this.isvip = isvip;
    }

    public String getXl() {
        return xl;
    }

    public void setXl(String xl) {
        this.xl = xl;
    }

    public String getIsm() {
        return ism;
    }

    public void setIsm(String ism) {
        this.ism = ism;
    }

    public String getBschool() {
        return bschool;
    }

    public void setBschool(String bschool) {
        this.bschool = bschool;
    }

    public String getAddr() {
        return addr;
    }

    public void setAddr(String addr) {
        this.addr = addr;
    }

    public String getWork() {
        return work;
    }

    public void setWork(String work) {
        this.work = work;
    }

    public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }

    public String getTname() {
        return tname;
    }

    public void setTname(String tname) {
        this.tname = tname;
    }

    public Date getCreatedTime() {
        return createdTime;
    }

    public void setCreatedTime(Date createdTime) {
        this.createdTime = createdTime;
    }

    public Integer getTid() {
        return tid;
    }

    public void setTid(Integer tid) {
        this.tid = tid;
    }
}
