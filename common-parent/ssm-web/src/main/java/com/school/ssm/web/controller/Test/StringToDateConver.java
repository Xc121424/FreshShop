package com.school.ssm.web.controller.Test;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.core.convert.converter.Converter;

public class StringToDateConver implements Converter<String, Date>{

    @Override
    public Date convert(String arg0) {
        //  yyyy-MM-dd
        SimpleDateFormat sd = new SimpleDateFormat("yyyy/MM/dd");
        try {
            return sd.parse(arg0);
        } catch (ParseException e) {
            //e.printStackTrace();
            throw new IllegalAccessError("日期转换出错！！");
        }
    }

}