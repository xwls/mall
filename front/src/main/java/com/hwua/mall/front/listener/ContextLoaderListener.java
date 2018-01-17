package com.hwua.mall.front.listener;

import com.alibaba.fastjson.JSON;
import com.hwua.mall.common.po.CategoryBrand;
import com.hwua.mall.common.service.CBService;
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
        //1.获取ServletContext
        ServletContext servletContext = servletContextEvent.getServletContext();
        //2.获取Spring的ApplicationContext
        WebApplicationContext ctx = WebApplicationContextUtils.
                getWebApplicationContext(servletContext);
        //3.从IOC容器中获取需要使用的Service
        CBService cbService = ctx.getBean(CBService.class);
        //4.调用Service中的方法查询需要的数据
        Set<CategoryBrand> cbs = cbService.getCBs();
        //5.将查询到的数据放入application作用域
        servletContext.setAttribute("cbs",cbs);
        System.out.println("JSON.toJSONString(cbs) = " + JSON.toJSONString(cbs));
    }

    @Override
    public void contextDestroyed(ServletContextEvent servletContextEvent) {

    }
}
