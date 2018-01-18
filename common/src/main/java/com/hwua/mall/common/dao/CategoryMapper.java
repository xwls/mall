package com.hwua.mall.common.dao;

import com.hwua.mall.common.po.Category;

import java.util.List;
import java.util.Map;

public interface CategoryMapper {
    public List<Map<String,Object>> query(Map<String,Object> param);
    public Integer getCount(Map<String,Object> param);
    public Integer doInsert(Category category);
    public Integer doUpdate(Category category);
    public Category queryByName(String name);
}
