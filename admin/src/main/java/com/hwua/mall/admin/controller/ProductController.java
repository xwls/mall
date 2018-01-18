package com.hwua.mall.admin.controller;

import com.alibaba.fastjson.JSON;
import com.hwua.mall.common.service.ProductService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.HashMap;
import java.util.Map;

import static com.hwua.mall.common.util.CommonUtil.PAGE_SIZE;

@Controller
@RequestMapping("/product")
public class ProductController {

    @Autowired
    private ProductService productService;
    private Logger logger = Logger.getLogger(ProductController.class);

    @RequestMapping("/list")
    public String index(Integer cid, Integer bid, @RequestParam(required = false,defaultValue = "1") Integer page, String keyWord, Map<String,Object> map){
        logger.debug("cid = [" + cid + "], bid = [" + bid + "], page = [" + page + "], keyWord = [" + keyWord + "], map = [" + map + "]");
        map.put("title","商品");
        Map<String, Object> param = new HashMap<>();
        param.put("cid", cid);
        param.put("bid", bid);
        param.put("page", page);
        param.put("keyWord", keyWord);
        param.put("orderBy", "pid");
        param.put("start",(page - 1) * PAGE_SIZE);
        param.put("pageSize",PAGE_SIZE);
        param.put("admin","");
        Map<String, Object> result = productService.query(param);
        logger.debug("result = " + JSON.toJSONString(result));
        result.get("products");
        map.putAll(result);
        return "product";
    }
}
