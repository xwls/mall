package com.hwua.mall.common.service.impl;

import com.hwua.mall.common.dao.BrandMapper;
import com.hwua.mall.common.po.Brand;
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

    @Override
    public Integer saveOrUpdate(Brand brand) {
        //根据名字进行查询
        Brand byName = brandMapper.queryByName(brand.getName());
        if (byName != null && !byName.getBid().equals(brand.getBid())){
//            分类名称已经存在，无法添加
            return null;
        }
        if (brand.getBid() == null){
            //添加
            return brandMapper.doInsert(brand);
        }else {
            return brandMapper.doUpdate(brand);
        }
    }

    @Override
    public List<Brand> queryAll() {
        return brandMapper.queryAll();
    }
}
