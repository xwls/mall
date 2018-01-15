package com.hwua.mall.test;

import com.alibaba.fastjson.JSON;
import com.hwua.mall.po.Product;
import com.hwua.mall.service.ProductService;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.Set;

public class TestService {
    @Test
    public void testService(){
        ApplicationContext ctx = new ClassPathXmlApplicationContext("applicationContext.xml");
        ProductService productService = ctx.getBean(ProductService.class);
//        Set<Product> products = productService.getByBid(4, null, null);
        Set<Product> products = productService.getByCid(2, 1, 4);
        System.out.println("JSON.toJSONString(products) = " + JSON.toJSONString(products));
    }
}
