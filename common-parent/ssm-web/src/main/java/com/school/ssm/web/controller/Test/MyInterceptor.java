package com.school.ssm.web.controller.Test;


import com.school.ssm.po.User;
import org.apache.log4j.Logger;
import org.springframework.lang.Nullable;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;

public class MyInterceptor implements HandlerInterceptor {
    private static final Logger logger = Logger.getLogger(MyInterceptor.class);

    /**
     * 获取拦截器放行路径
     */
//    private List<String> interceptorList;
//    public List<String> getInterceptorList() {
//        return interceptorList;
//    }
//    public void setInterceptorList(List<String> interceptorList) {
//        this.interceptorList = interceptorList;
//    }

    /**
     *    1
     * 何时调用：
     *     只要配置了就会调用
     *  有何用：
     *      如果不需要进行其他操作就返回false；就不会进行后续拦截操作
     */
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        String requestName = request.getServletPath();
        logger.debug("拦截器启动 拦截路径为 :"+requestName);
        String requestType = request.getHeader("X-Requested-With");
        //放行路径 与 请求路径对比   存在则放行

        User user = (User)request.getSession().getAttribute("user");
        User manager = (User)request.getSession().getAttribute("Manager");
        if(requestName.contains("manage")){

            if(manager != null ){
                return true;
            }else{
                if ("XMLHttpRequest".equals(requestType)) {

                    response.getWriter().write("IsManagerAjax");
                } else {
                    request.getRequestDispatcher("/manager/intologin").forward(request, response);
                }
                return false;
            }
        }
        if(user != null ){
            return true;
        }else{
            if ("XMLHttpRequest".equals(requestType)) {

                response.getWriter().write("IsAjax");
            } else {
                request.getRequestDispatcher("/frame/intologin").forward(request, response);
            }
            return false;
        }
    }

    /**
     *   2
     * 何时调用：
     *     所有拦截器返回true时调用
     *  有何用：
     *      在该方法中对request请求进行处理
     */

    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, @Nullable ModelAndView modelAndView) throws Exception {
        System.out.println("postHandle执行了。。。。。。。。。。");
    }

    /**
     *   3
     * 何时调用：
     *      只当preHandle返回true时触发
     *  有何用：
     *      对一些资源进行清理操作
     */
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, @Nullable Exception ex) throws Exception {
        System.out.println("afterCompletion执行了。。。。。。。。。。");
    }
}
