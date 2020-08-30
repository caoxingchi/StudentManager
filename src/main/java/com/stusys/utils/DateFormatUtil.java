package com.stusys.utils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * 该类用于将日期转为字符串或将字符串转为日期
 */
public class DateFormatUtil {
    private static SimpleDateFormat sdf1=new SimpleDateFormat("yyyy-MM-dd");
    private static SimpleDateFormat sdf2=new SimpleDateFormat("yyyy/MM/dd");
    private static SimpleDateFormat sdf3=new SimpleDateFormat("yyyyMMdd");
    private static SimpleDateFormat sdf4=new SimpleDateFormat("yyyy年MM月dd日");
    private static SimpleDateFormat[] sdfs={sdf1,sdf2,sdf3,sdf4};

    public static Date stringToDate(String dateString){
        if (dateString!=null&&!"".equals(dateString)){
            try {
                return sdf1.parse(dateString);
            } catch (ParseException e) {
                e.printStackTrace();
            }
        }
        return null;
    }

    //任何类型字符串转换成日期对象
    public static Date stringToDateAnyWhere(String dateString){
        if (dateString!=null&&!"".equals(dateString)){
            for (SimpleDateFormat sdf:sdfs){
                try {
                    return sdf.parse(dateString);
                } catch (ParseException e) {
                    continue;
                }
            }
        }
        return null;
    }

    //把日期对象转换成字符串
    public static String dateToString(Date date){
        if (date!=null){
            return sdf4.format(date);
        }
        return null;
    }
}
