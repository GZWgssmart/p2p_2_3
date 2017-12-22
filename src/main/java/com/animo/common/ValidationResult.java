package com.animo.common;



/**
 * Created by Animo on 2017-12-08.
 */
public class ValidationResult {

    //校验结果是否有错
    private boolean hasErrors;

    //校验错误信息
    private String errorMsg;

    public boolean isHasErrors() {
        return hasErrors;
    }

    public void setHasErrors(boolean hasErrors) {
        this.hasErrors = hasErrors;
    }

    public String getErrorMsg() {
        return errorMsg;
    }

    public void setErrorMsg(String errorMsg) {
        this.errorMsg = errorMsg;
    }
}
