package com.hwua.mall.common.dao;


import com.hwua.mall.common.po.Brand;

import java.util.List;
import java.util.Map;

public interface BrandMapper {
    public List<Map<String,Object>> query(Map<String, Object> param);
    public Integer getCount(Map<String, Object> param);
    public Integer doInsert(Brand brand);
    public Integer doUpdate(Brand brand);
    public Brand queryByName(String name);
    List<Brand> queryAll();
}
