package com.hwua.mall.dao;

import com.hwua.mall.po.CategoryBrand;

import java.util.Set;

public interface CategoryBrandMapper {

    /**
     * 获取导航栏需要显示的分类以及分类对应的品牌
     * @return
     */
    public Set<CategoryBrand> getCBs();

}
