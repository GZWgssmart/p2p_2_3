package com.animo.enums;

/**
 * Created by Animo on 2017-11-27.
 * @author Animo
 */
public enum ResultEnum {
    /**
     * 0 成功
     */
    SUCCESS(0,"SUCCESS"),
    /**
     * 1 失败
     */
    ERROR(1,"ERROR");

    private Integer code;
    private String type;

    ResultEnum(Integer code, String type){
        this.code = code;
        this.type = type;
    }

    public Integer getCode() {
        return code;
    }

    public String getType() {
        return type;
    }
}
