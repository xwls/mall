package com.hwua.mall.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Map;

@Controller
public class ProductController {
    @RequestMapping("/product")
    public String index(Map<String,Object> map){
        map.put("title","商品");
        return "product";
    }
}
