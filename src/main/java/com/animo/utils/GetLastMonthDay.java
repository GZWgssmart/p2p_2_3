package com.animo.utils;

import java.text.SimpleDateFormat;
import java.util.Calendar;

/**
 * 获取月的最后一天：年-月-日
 */
public class GetLastMonthDay {
    public static String getToday(){
        Calendar calendar = Calendar.getInstance();
        calendar.set(Calendar.DAY_OF_MONTH,calendar.getActualMaximum(Calendar.DAY_OF_MONTH));
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
        return simpleDateFormat.format(calendar.getTime());
    }
}
