package com.hwua.mall.common.service.impl;

import com.hwua.mall.common.dao.CategoryMapper;
import com.hwua.mall.common.po.Category;
import com.hwua.mall.common.service.CategoryService;
import com.hwua.mall.common.util.CommonUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@SuppressWarnings("ALL")
@Service("categoryService")
public class CategoryServiceImpl implements CategoryService {

    @Autowired
    private CategoryMapper categoryMapper;

    @Override
    public Map<String, Object> getCategories(Map<String, Object> param) {
        List<Map<String, Object>> categories = categoryMapper.query(param);
        Integer count = categoryMapper.getCount(param);
        param.put("categories",categories);
        param.put("count",count);
        param.put("pageNum",(int)Math.ceil((double) count/ CommonUtil.PAGE_SIZE));
        return param;
    }

    @Override
    public Integer saveOrUpdate(Category category) {
        //根据名字进行查询
        Category byName = categoryMapper.queryByName(category.getName());
        if (byName != null && !byName.getCid().equals(category.getCid())){
//            分类名称已经存在，无法添加
            return null;
        }
        if (category.getCid() == null){
            //添加
            return categoryMapper.doInsert(category);
        }else {
            return categoryMapper.doUpdate(category);
        }
    }
}
