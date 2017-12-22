package com.animo.pojo;

import com.fasterxml.jackson.annotation.JsonInclude;
import org.hibernate.validator.constraints.NotBlank;

@JsonInclude(JsonInclude.Include.NON_NULL)
public class Jklx {
    private Integer lxid;

    @NotBlank(message = "类型名称不为空")
    private String lxname;

    private Integer status;

    public Integer getLxid() {
        return lxid;
    }

    public void setLxid(Integer lxid) {
        this.lxid = lxid;
    }

    public String getLxname() {
        return lxname;
    }

    public void setLxname(String lxname) {
        this.lxname = lxname == null ? null : lxname.trim();
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }
}