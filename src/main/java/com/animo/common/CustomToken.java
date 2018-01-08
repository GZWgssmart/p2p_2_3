package com.animo.common;

import org.apache.shiro.authc.UsernamePasswordToken;

/**
 *
 *  账号  密码  验证码
 *
 *
 */
public class CustomToken extends UsernamePasswordToken {
    private String codeInSession;
    private String verifyCode;

    public CustomToken(String username, String password, String codeInSession, String verifyCode){
        super(username, password);
        this.codeInSession = codeInSession;
        this.verifyCode = verifyCode;
    }

    public String getCodeInSession() {
        return codeInSession;
    }

    public void setCodeInSession(String codeInSession) {
        this.codeInSession = codeInSession;
    }

    public String getVerifyCode() {
        return verifyCode;
    }

    public void setVerifyCode(String verifyCode) {
        this.verifyCode = verifyCode;
    }
}
