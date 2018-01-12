package com.animo.utils;

import java.text.SimpleDateFormat;
import java.util.Calendar;

/**
 * 获取月的第一天：年-月-日
 */
public class GetFirstMonthDay {
    public static String getFistMothDay(){
        Calendar calendar = Calendar.getInstance();
        calendar.add(Calendar.MONTH, 0);
        calendar.set(Calendar.DAY_OF_MONTH,1);
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
        return simpleDateFormat.format(calendar.getTime());
    }
}
