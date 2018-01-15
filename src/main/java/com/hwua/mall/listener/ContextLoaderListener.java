package com.hwua.mall.listener;

import com.alibaba.fastjson.JSON;
import com.hwua.mall.po.CategoryBrand;
import com.hwua.mall.service.CBService;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;
import java.util.Set;

@WebListener
public class ContextLoaderListener implements ServletContextListener{
    @Override
    public void contextInitialized(ServletContextEvent servletContextEvent) {
        ServletContext servletContext = servletContextEvent.getServletContext();
        WebApplicationContext ctx = WebApplicationContextUtils.getWebApplicationContext(servletContext);
        CBService cbService = ctx.getBean(CBService.class);
        Set<CategoryBrand> cbs = cbService.getCBs();
        servletContext.setAttribute("cbs",cbs);
        System.out.println("JSON.toJSONString(cbs) = " + JSON.toJSONString(cbs));
    }

    @Override
    public void contextDestroyed(ServletContextEvent servletContextEvent) {

    }
}
