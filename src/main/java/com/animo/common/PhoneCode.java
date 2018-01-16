package com.animo.common;

/**
 * Created by Animo on 2017-08-23.
 */
public class PhoneCode {
    // 得到随机字符

    public static String randomStr() {

        String str1 = "1234567890";

        String str2 = "";

        int len = str1.length() - 1;

        double r;

        for (int i = 0; i < 6; i++) {

            r = (Math.random()) * len;

            str2 = str2 + str1.charAt((int) r);

        }
        return str2;
    }
}
