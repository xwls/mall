package com.hwua.mall.service;

import com.hwua.mall.po.Product;

import java.util.Map;
import java.util.Set;

public interface ProductService {
    public Set<Product> specials();
    public Map<String,Object> query(Map<String,Object> param,Integer page);
}
