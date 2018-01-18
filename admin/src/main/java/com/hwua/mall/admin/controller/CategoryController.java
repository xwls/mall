package com.hwua.mall.admin.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.hwua.mall.common.po.Category;
import com.hwua.mall.common.service.CategoryService;
import com.hwua.mall.common.util.CommonUtil;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/category")
public class CategoryController {

    @Autowired
    private CategoryService categoryService;

    private Logger logger = Logger.getLogger(CategoryController.class);

    @RequestMapping("/list")
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

    @ResponseBody
    @RequestMapping(value = "/saveOrUpdate",produces = "application/json;charset=UTF-8")
    public String saveOrUpdate(Category category){
        logger.debug("category = [" + category + "]");
        Integer result = categoryService.saveOrUpdate(category);
        JSONObject jsonObject = new JSONObject();
        if (result == null){
            jsonObject.put("success",false);
            jsonObject.put("reason","分类名称\""+category.getName()+"\"已经存在");
        }else if (result > 0){
            jsonObject.put("success",true);
        }else {
            jsonObject.put("success",false);
            jsonObject.put("reason","未知错误");
        }
        return jsonObject.toJSONString();
    }
}
