package com.hwua.front.service.impl;

import com.hwua.common.dao.CategoryBrandMapper;
import com.hwua.common.po.CategoryBrand;
import com.hwua.front.service.CBService;
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
