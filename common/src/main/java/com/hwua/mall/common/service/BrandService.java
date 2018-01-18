package com.hwua.mall.common.service;

import com.hwua.mall.common.po.Brand;

import java.util.Map;

public interface BrandService {
    public Map<String,Object> getBrands(Map<String, Object> param);
    public Integer saveOrUpdate(Brand brand);
}
