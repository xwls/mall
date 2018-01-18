package com.hwua.mall.common.service;

import com.hwua.mall.common.po.Category;

import java.util.List;
import java.util.Map;

public interface CategoryService {
    public Map<String,Object> getCategories(Map<String,Object> param);
    public Integer saveOrUpdate(Category category);
}
