package com.hwua.mall.front.interceptor;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Map;
import java.util.Set;

public class LoginInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object o) throws Exception {
//        String requestURI = request.getRequestURI();
        StringBuilder servletPath = new StringBuilder(request.getServletPath());
        Map<String, String[]> parameterMap = request.getParameterMap();
        if (parameterMap != null) {
            servletPath.append("?");
            Set<String> keySet = parameterMap.keySet();
            for (String key : keySet) {
                String value = parameterMap.get(key)[0];
                servletPath.append(key+"="+value+"&");
            }
            int index = servletPath.lastIndexOf("&");
            if (index != -1){
                servletPath.deleteCharAt(index);
            }
        }
        if (request.getSession().getAttribute("member") == null){
            response.sendRedirect(request.getContextPath()+"/account?callBack="+servletPath);
            return false;
        }
        return true;
    }

    @Override
    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {

    }
}
