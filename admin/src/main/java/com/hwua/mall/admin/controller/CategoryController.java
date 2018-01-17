package com.hwua.mall.admin.controller;

import com.alibaba.fastjson.JSON;
import com.hwua.mall.common.service.CategoryService;
import com.hwua.mall.common.util.CommonUtil;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class CategoryController {

    @Autowired
    private CategoryService categoryService;

    private Logger logger = Logger.getLogger(CategoryController.class);

    @RequestMapping("/category")
    public String index(Map<String,Object> map, @RequestParam(required = false,defaultValue = "1") Integer page, String name){
        map.put("title","分类");
        Map<String,Object> param = new HashMap<>();
        param.put("page",page);
        param.put("start",(page -  1) * CommonUtil.PAGE_SIZE);
        param.put("pageSize",CommonUtil.PAGE_SIZE);
        param.put("name",name);
        param = categoryService.getCategories(param);
        map.putAll(param);
        logger.debug("result = " + JSON.toJSONString(map));
        return "category";
    }
}
