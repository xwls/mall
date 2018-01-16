package com.hwua.front.service;


import com.hwua.common.po.Product;

import java.util.Map;
import java.util.Set;

public interface ProductService {
    public Set<Product> specials();
    public Map<String,Object> query(Map<String, Object> param, Integer page);
    public Product get(Integer pid);
}
