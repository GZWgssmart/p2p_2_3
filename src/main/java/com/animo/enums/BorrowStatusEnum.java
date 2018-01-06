package com.animo.enums;

/**
 * Created by 7025 on 2017/12/27.
 * 借款状态枚举
 */
public enum BorrowStatusEnum {

    /**
     * 审核中
     */
    CKING(0,"审核中"),
    /**
     * 审核失败
     */
    CK_FAIL(1,"审核失败"),
    /**
     * 借款中
     */
    BORROWING(2,"投标中"),
    /**
     * 已流标，借款失败
     */
    BORROW_FAIL(3,"已流标"),
    /**
     * 还款中
     */
    REPAYMENT(4,"还款中"),
    /**
     * 已完成
     */
    COMPLETE(5,"已完成"),
    /**
     * 前台列表不需要显示审核中、审核失败、已流标的特殊状态标记
     */
    OTHER(6,"前台特殊情况");

    private int code;
    private String message;

    BorrowStatusEnum(int code, String message) {
        this.code = code;
        this.message = message;
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
}
