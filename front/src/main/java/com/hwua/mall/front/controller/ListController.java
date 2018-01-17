package com.hwua.mall.front.controller;

import com.alibaba.fastjson.JSON;
import com.hwua.mall.common.service.ProductService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.HashMap;
import java.util.Map;

@Controller
public class ListController {

    @Autowired
    private ProductService productService;

    private Logger logger = Logger.getLogger(ListController.class);

    @RequestMapping("/list")
    public String list(Integer cid, Integer bid, Integer page, String keyWord, Map<String, Object> map) {
        logger.debug("cid = [" + cid + "], bid = [" + bid + "], page = [" + page + "], keyWord = [" + keyWord + "]");
        Map<String, Object> param = new HashMap<>();
        param.put("cid", cid);
        param.put("bid", bid);
        param.put("keyWord", keyWord);
        page = page == null ? 1 : page;
        Map<String, Object> result = productService.query(param, page);
        logger.debug("result = " + JSON.toJSONString(result));
        map.put("result", result);
        return "list";
    }
}
