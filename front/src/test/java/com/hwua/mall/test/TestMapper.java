package com.hwua.mall.test;

import com.alibaba.fastjson.JSON;
import com.hwua.mall.common.dao.ProductMapper;
import com.hwua.mall.common.po.Product;
import org.junit.Test;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.Set;

public class TestMapper {
    @Test
    public void testCBs(){
        ClassPathXmlApplicationContext ctx = new ClassPathXmlApplicationContext("applicationContext.xml");
        /*CategoryBrandMapper bean = ctx.getBean(CategoryBrandMapper.class);
        Set<CategoryBrand> cBs = bean.getCBs();
        System.out.println("JSON.toJSONString(cBs) = " + JSON.toJSONString(cBs));*/
        ProductMapper productMapper = ctx.getBean(ProductMapper.class);
        Set<Product> products = productMapper.querySpecials();
        System.out.println(JSON.toJSONString(products));
    }
}
