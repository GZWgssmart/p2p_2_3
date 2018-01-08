package com.animo.vo;

import com.animo.pojo.Rolejur;

import java.util.List;

/**
 * @author ye
 */

public class RoleJurVO {

    private String jurString;

    private Integer rid;

    private Integer pid;

    private Integer rjid;

    private String rname;

    private String content;

    private String jurl;

    public String getJurl() {
        return jurl;
    }

    public void setJurl(String jurl) {
        this.jurl = jurl;
    }

    public String getJurString() {
        return jurString;
    }

    public void setJurString(String jurString) {
        this.jurString = jurString;
    }

    public Integer getRid() {
        return rid;
    }

    public void setRid(Integer rid) {
        this.rid = rid;
    }

    public Integer getPid() {
        return pid;
    }

    public Integer getRjid() {
        return rjid;
    }

    public void setRjid(Integer rjid) {
        this.rjid = rjid;
    }

    public void setPid(Integer pid) {
        this.pid = pid;
    }

    public String getRname() {
        return rname;
    }

    public void setRname(String rname) {
        this.rname = rname == null ? null : rname.trim();
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }
}
