package com.hwua.mall.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Map;

@Controller
public class CategoryBrandController {
    @RequestMapping("/category-brand")
    public String index(Map<String,Object> map){
        map.put("title","分类&品牌");
        return "category-brand";
    }
}
