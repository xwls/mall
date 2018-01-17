package com.hwua.mall.common.service.impl;

import com.hwua.mall.common.dao.BrandMapper;
import com.hwua.mall.common.service.BrandService;
import com.hwua.mall.common.util.CommonUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@SuppressWarnings("ALL")
@Service("brandService")
public class BrandServiceImpl implements BrandService {

    @Autowired
    private BrandMapper brandMapper;

    @Override
    public Map<String, Object> getBrands(Map<String, Object> param) {
        List<Map<String, Object>> brands = brandMapper.query(param);
        Integer count = brandMapper.getCount(param);
        param.put("brands",brands);
        param.put("count",count);
        param.put("pageNum",(int)Math.ceil((double) count/ CommonUtil.PAGE_SIZE));
        return param;
    }
}
