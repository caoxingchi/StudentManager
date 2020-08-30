package com.stusys.utils;

import org.springframework.core.convert.converter.Converter;

import java.util.Date;

/**
 * 自定义一个日期转换类，然后用该类替换spring默认的日期转换器
 */
public class DateConvert implements Converter<String, Date> {
    @Override
    public Date convert(String s) {
        return DateFormatUtil.stringToDateAnyWhere(s);
    }
}
