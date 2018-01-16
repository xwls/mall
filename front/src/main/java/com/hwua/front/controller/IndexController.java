package com.hwua.front.controller;

import com.hwua.common.po.Banner;
import com.hwua.common.po.Product;
import com.hwua.front.service.BannerService;
import com.hwua.front.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Map;
import java.util.Set;

@Controller
public class IndexController {

    @Autowired
    private ProductService productService;

    @Autowired
    private BannerService bannerService;

    @RequestMapping("/index")
    public String index(Map<String,Object> map){
        Set<Product> products = productService.specials();
        Set<Banner> banners = bannerService.getLast3();
        map.put("specialProducts",products);
        map.put("banners",banners);
        return "index";
    }
}
