package com.school.ssm.web.controller.Test;

import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CustomerExceptionReslover implements HandlerExceptionResolver {
    @Override
    public ModelAndView resolveException(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) {
        ModelAndView modelAndView = new ModelAndView();
        e.printStackTrace();
        CustomerException ce=null;
        if(e instanceof CustomerException) ce=(CustomerException)e;
        else ce=new CustomerException("请联系管理员");
        modelAndView.setViewName("user/error");
        modelAndView.addObject("cusomerException",ce.getMessage());
        return modelAndView;
    }
}
