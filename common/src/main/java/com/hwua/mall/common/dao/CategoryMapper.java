package com.hwua.mall.common.dao;

import java.util.List;
import java.util.Map;

public interface CategoryMapper {
    public List<Map<String,Object>> query(Map<String,Object> param);
    public Integer getCount(Map<String,Object> param);
}
