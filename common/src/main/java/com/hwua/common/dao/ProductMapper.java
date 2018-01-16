package com.hwua.common.dao;

import com.hwua.common.po.Product;

import java.util.Map;
import java.util.Set;

public interface ProductMapper {
    /**
     * 查询特价商品，4条记录
     * @return 特价商品
     */
    public Set<Product> querySpecials();

    /**
     * 多条件查询，根据名称模糊查询、根据品牌查询、根据类型查询、分页查询
     * @param param 名称：name，品牌：bid，类型：cid，分页：start/pageSize
     * @return 根据条件查询出的商品
     */
    public Set<Product> query(Map<String, Object> param);

    public Integer getCount(Map<String, Object> param);

    /**
     * 根据商品的id查询商品详细信息
     * @param pid 商品id
     * @return 查询出的商品
     */
    public Product queryByPid(Integer pid);

}
