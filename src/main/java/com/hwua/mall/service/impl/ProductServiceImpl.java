package com.hwua.mall.service.impl;

import com.hwua.mall.dao.ProductMapper;
import com.hwua.mall.po.Product;
import com.hwua.mall.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;
import java.util.Set;

@SuppressWarnings("ALL")
@Service("productService")
public class ProductServiceImpl implements ProductService {

    @Autowired
    private ProductMapper productMapper;

    @Override
    public Set<Product> specials() {
        return productMapper.querySpecials();
    }

    @Override
    public Set<Product> getByCid(Integer cid, Integer page, Integer pageSize) {
        Map<String,Object> param = new HashMap<>();
        param.put("cid",cid);
        if (page != null && pageSize != null){
            param.put("start",(page - 1) * pageSize);
            param.put("pageSize",pageSize);
        }
        return productMapper.query(param);
    }

    @Override
    public Set<Product> getByBid(Integer bid, Integer page, Integer pageSize) {
        Map<String,Object> param = new HashMap<>();
        param.put("bid",bid);
        if (page != null && pageSize != null){
            param.put("start",(page - 1) * pageSize);
            param.put("pageSize",pageSize);
        }
        return productMapper.query(param);
    }

    @Override
    public Set<Product> getByCidAndBid(Integer cid, Integer bid, Integer page, Integer pageSize) {
        Map<String,Object> param = new HashMap<>();
        param.put("cid",cid);
        param.put("bid",bid);
        if (page != null && pageSize != null){
            param.put("start",(page - 1) * pageSize);
            param.put("pageSize",pageSize);
        }
        return productMapper.query(param);
    }

    @Override
    public Set<Product> search(String keyWord, Integer page, Integer pageSize) {
        Map<String,Object> param = new HashMap<>();
        param.put("keyWord",keyWord);
        if (page != null && pageSize != null){
            param.put("start",(page - 1) * pageSize);
            param.put("pageSize",pageSize);
        }
        return productMapper.query(param);
    }
}
