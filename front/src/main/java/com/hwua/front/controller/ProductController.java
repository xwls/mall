package com.hwua.front.controller;

import com.hwua.common.po.Product;
import com.hwua.front.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Map;

@Controller
public class ProductController {

    @Autowired
    private ProductService productService;

    @RequestMapping("/product")
    public String product(Integer pid, Map<String,Object> map){
        Product product = productService.get(pid);
        map.put("product",product);
        return "product";
    }

}
