package com.animo.controller;

import javax.servlet.http.HttpServletRequest;

/**
 * 是否是Ajax请求
 */
public class WebUtilsPro {

    public static boolean isAjaxRequest(HttpServletRequest request) {
        String requestedWith = request.getHeader("x-requested-with");
        if (requestedWith != null && requestedWith.equalsIgnoreCase("XMLHttpRequest")) {
            return true;
        } else {
            return false;
        }
    }
}
