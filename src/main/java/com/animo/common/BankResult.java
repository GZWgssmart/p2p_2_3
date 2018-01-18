package com.animo.common;

/**
 * Created by Animo on 2018-01-12.
 */
public class BankResult {

    private Integer code;
    private String message;

    public BankResult() {

    }

    public BankResult(Integer code, String message) {
        this.code = code;
        this.message = message;
    }

    public Integer getCode() {
        return code;
    }

    public void setCode(Integer code) {
        this.code = code;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
}
