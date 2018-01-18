package com.hwua.mall.front.controller;

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
public class ListController {

    @Autowired
    private ProductService productService;

    private Logger logger = Logger.getLogger(ListController.class);

    @RequestMapping("/list")
    public String list(Integer cid, Integer bid, @RequestParam(required = false,defaultValue = "1") Integer page, String keyWord, Map<String, Object> map) {
        logger.debug("cid = [" + cid + "], bid = [" + bid + "], page = [" + page + "], keyWord = [" + keyWord + "]");
        Map<String, Object> param = new HashMap<>();
        param.put("cid", cid);
        param.put("bid", bid);
        param.put("keyWord", keyWord);
        param.put("start",(page - 1) * PAGE_SIZE);
        param.put("pageSize",PAGE_SIZE);
        Map<String, Object> result = productService.query(param);
        logger.debug("result = " + JSON.toJSONString(result));
        map.put("result", result);
        return "list";
    }
}
