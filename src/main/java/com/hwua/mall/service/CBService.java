package com.hwua.mall.service;

import com.hwua.mall.po.CategoryBrand;

import java.util.Set;

/**
 * 获取分类及分类对应的品牌
 */
public interface CBService {
    public Set<CategoryBrand> getCBs();
}
