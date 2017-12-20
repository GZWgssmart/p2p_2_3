package com.animo.utils;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;

/**
 * Created by Animo on 2017-12-07.
 */
public class ShiroUtils {

    public static final String HASH_ALGORITHM_NAME = "MD5";

    public static final int HASHITERATIONS = 1024;

    /**
     * shiro密码加密
     * @param password
     * @param salt
     * @return
     */
    public static String sha256(String password, String salt) {
        return new SimpleHash(HASH_ALGORITHM_NAME, password, salt, HASHITERATIONS).toString();
    }

    /**
     * 获取session
     * @return
     */
    public static Session getSession(){
        return SecurityUtils.getSubject().getSession();
    }

    /**
     * 获取Subject
     * @return
     */
    public static Subject getSubJect(){
        return SecurityUtils.getSubject();
    }
}
