package com.animo.controller;

import com.alibaba.druid.support.json.JSONUtils;
import org.apache.shiro.authz.AuthorizationException;
import org.apache.shiro.authz.UnauthorizedException;
import org.springframework.web.bind.annotation.ExceptionHandler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

/**
 * shiro权限控制异常处理
 */
public class ShiroExecptionController {

    /**
     * 权限异常
     */
    @ExceptionHandler({ UnauthorizedException.class, AuthorizationException.class })
    public Map<String, Object> authorizationException(HttpServletRequest request, HttpServletResponse response){
        Map<String,Object> map = new HashMap<>();
        map.put("message", "对不起，操作失败，您无权限访问，请联系管理员");
        return map;
    }
}
