package com.hwua.front.service;


import com.hwua.common.po.CategoryBrand;

import java.util.Set;

/**
 * 获取分类及分类对应的品牌
 */
public interface CBService {
    public Set<CategoryBrand> getCBs();
}
