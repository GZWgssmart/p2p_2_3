package com.animo.controller;


import java.util.Arrays;
import java.util.Collections;
import java.util.List;

class ranable {
    /**
     * 生成一个四位数，包括字母
     * @return
     */
    public static String getRandomFourNum() {
        String[] beforeShuffle = new String[] {"1", "2", "3", "4", "5", "6", "7",
                "8", "9" };
        List list = Arrays.asList(beforeShuffle);
        Collections.shuffle(list);
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < list.size(); i++) {
            sb.append(list.get(i));
        }
        String afterShuffle = sb.toString();
        String result = afterShuffle.substring(2,8 );
        return result;
    }
    public static void main(String args[]) {
        System.out.println(getRandomFourNum());
    }

}