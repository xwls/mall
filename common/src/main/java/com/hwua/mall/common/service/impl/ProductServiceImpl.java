package com.hwua.mall.common.service.impl;

import com.hwua.mall.common.dao.ProductMapper;
import com.hwua.mall.common.po.Product;
import com.hwua.mall.common.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Iterator;
import java.util.Map;
import java.util.Set;

@SuppressWarnings("ALL")
@Service("productService")
public class ProductServiceImpl implements ProductService {

    @Autowired
    private ProductMapper productMapper;

    private static final int PAGE_SIZE = 4;

    @Override
    public Set<Product> specials() {
        return productMapper.querySpecials();
    }

    @Override
    public Map<String,Object> query(Map<String, Object> param,Integer page) {
        param.put("start",(page - 1) * PAGE_SIZE);
        param.put("pageSize",PAGE_SIZE);
        Set<Product> products = productMapper.query(param);
        Integer count = productMapper.getCount(param);
        param.put("products",products);
        param.put("count",count);
        param.put("pageNum",Math.ceil((double) count/PAGE_SIZE));
        if (param.get("cid") != null){
            Iterator<Product> iterator = products.iterator();
            Product product = iterator.next();
            param.put("cname",product.getCategory().getName());
        }
        if (param.get("bid") != null){
            Iterator<Product> iterator = products.iterator();
            Product product = iterator.next();
            param.put("bname",product.getBrand().getName());
        }
        return param;
    }

    @Override
    public Product get(Integer pid) {
        return productMapper.queryByPid(pid);
    }

}
