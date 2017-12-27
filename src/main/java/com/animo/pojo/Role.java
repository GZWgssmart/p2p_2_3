package com.animo.pojo;

import org.hibernate.validator.constraints.NotBlank;

public class Role {

    private Integer rid;

//    @NotBlank(message = "部门不能为空")
    private Integer pid;

//    @NotBlank(message = "不能为空")
    private String rname;

    private String content;

    public Integer getRid() {
        return rid;
    }

    public void setRid(Integer rid) {
        this.rid = rid;
    }

    public Integer getPid() {
        return pid;
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
        this.content = content == null ? null : content.trim();
    }
}