package com.hwua.mall.common.service;

import com.hwua.mall.common.po.Brand;

import java.util.List;
import java.util.Map;

public interface BrandService {
    Map<String,Object> getBrands(Map<String, Object> param);
    Integer saveOrUpdate(Brand brand);
    List<Brand> queryAll();
}
