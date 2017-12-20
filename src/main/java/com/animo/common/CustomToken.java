package com.animo.common;

import org.apache.shiro.authc.UsernamePasswordToken;

/**
 *
 *  账号  密码  验证码
 *
 *
 */
public class CustomToken extends UsernamePasswordToken {
    private String verifyCode;

    public CustomToken(String username, String password, String verifyCode){
        super(username, password);
        this.verifyCode = verifyCode;
    }
    public String getVerifyCode() {
        return verifyCode;
    }

    public void setVerifyCode(String verifyCode) {
        this.verifyCode = verifyCode;
    }
}
