package com.hwua.mall.common.service.impl;

import com.hwua.mall.common.dao.ProductMapper;
import com.hwua.mall.common.po.Product;
import com.hwua.mall.common.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Iterator;
import java.util.Map;
import java.util.Set;

import static com.hwua.mall.common.util.CommonUtil.ADMIN_PRODUCT_PAGE_SIZE;
import static com.hwua.mall.common.util.CommonUtil.PAGE_SIZE;

@SuppressWarnings("ALL")
@Service("productService")
public class ProductServiceImpl implements ProductService {

    @Autowired
    private ProductMapper productMapper;

    @Override
    public Set<Product> specials() {
        return productMapper.querySpecials();
    }

    @Override
    public Map<String,Object> query(Map<String, Object> param) {
        Set<Product> products = productMapper.query(param);
        if (param.containsKey("admin")){
            //如果是后台管理进行查询，将商品名换行处理
            for (Product product : products) {
                StringBuilder name = new StringBuilder(product.getName());
                for (int i = 1; i <= name.length(); i++) {
                    if (i % 46 == 0){
                        name.insert(i,"<br/>");
                    }
                }
                product.setName(name.toString());
            }
        }
        Integer count = productMapper.getCount(param);
        param.put("products",products);
        param.put("count",count);
        param.put("pageNum",Math.ceil((double) count/ADMIN_PRODUCT_PAGE_SIZE));
        if (param.get("cid") != null){
            Iterator<Product> iterator = products.iterator();
            Product product = iterator.next();
            param.put("cname",product.getCategory().getName());
        }
        if (param.get("bid") != null){
            Iterator<Product> iterator = products.iterator();
            Product product = iterator.next();
            param.put("bname",product.getBrand().getName());
        }
        return param;
    }

    @Override
    public Product get(Integer pid) {
        return productMapper.queryByPid(pid);
    }

    @Override
    public Integer saveOrUpdate(Product product) {

        return null;
    }

}
