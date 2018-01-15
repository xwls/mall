package com.hwua.mall.service;

import com.hwua.mall.po.Product;

import java.util.Set;

public interface ProductService {
    public Set<Product> specials();
    public Set<Product> getByCid(Integer cid,Integer page,Integer pageSize);
    public Set<Product> getByBid(Integer bid,Integer page,Integer pageSize);
    public Set<Product> getByCidAndBid(Integer cid, Integer bid,Integer page,Integer pageSize);
    public Set<Product> search(String keyWord,Integer page,Integer pageSize);

}
