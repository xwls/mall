package com.hwua.mall.common.service;


import com.hwua.mall.common.po.CategoryBrand;

import java.util.List;
import java.util.Map;
import java.util.Set;

/**
 * 获取分类及分类对应的品牌
 */
public interface CBService {
    public Set<CategoryBrand> getCBs();
}
