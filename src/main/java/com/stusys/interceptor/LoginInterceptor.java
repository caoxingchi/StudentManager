package com.stusys.interceptor;

import org.springframework.web.servlet.HandlerAdapter;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.HandlerMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *@author  xingchi -->> itcolors <<----
 *@date  2020/8/20 20:00
 *@version 1.0
 *@description 登录拦截器，登录失败后将会进行页面跳转，配置文件在springMVC-config.xml文件中-->
 */
public class LoginInterceptor implements HandlerInterceptor {
    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {

    }

    @Override
    public boolean preHandle(HttpServletRequest req, HttpServletResponse resp, Object handler) throws Exception {
        String uri= req.getRequestURI();
        String contextPath=req.getContextPath();
        System.out.println(uri);
        HandlerMapping hm=null;
        HandlerAdapter ha=null;
        Object login = req.getSession().getAttribute("login");
        if(login!=null){
            return true;
        }
        resp.sendRedirect(contextPath+"/index.jsp");
        return false;
    }
}
