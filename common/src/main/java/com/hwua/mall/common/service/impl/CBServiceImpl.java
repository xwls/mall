package com.hwua.mall.common.service.impl;

import com.hwua.mall.common.dao.CategoryBrandMapper;
import com.hwua.mall.common.po.CategoryBrand;
import com.hwua.mall.common.service.CBService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
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
