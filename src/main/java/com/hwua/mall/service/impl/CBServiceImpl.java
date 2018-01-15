package com.hwua.mall.service.impl;

import com.hwua.mall.dao.CategoryBrandMapper;
import com.hwua.mall.po.CategoryBrand;
import com.hwua.mall.service.CBService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Set;

/**
 *
 */
@SuppressWarnings("ALL")
@Service("cBService")
public class CBServiceImpl implements CBService {

    @Autowired
    private CategoryBrandMapper categoryBrandMapper;

    @Override
    public Set<CategoryBrand> getCBs() {
        return categoryBrandMapper.getCBs();
    }
}
