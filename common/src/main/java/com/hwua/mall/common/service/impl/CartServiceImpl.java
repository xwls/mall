package com.hwua.mall.common.service.impl;

import com.hwua.mall.common.dao.CartMapper;
import com.hwua.mall.common.po.Cart;
import com.hwua.mall.common.po.CartTotal;
import com.hwua.mall.common.po.ProductInCart;
import com.hwua.mall.common.service.CartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service("cartService")
public class CartServiceImpl implements CartService {

    @SuppressWarnings("SpringJavaAutowiringInspection")
    @Autowired
    private CartMapper cartMapper;

    @Override
    public Integer saveOrUpdate(Integer mid, Integer pid, Integer quantity) {
        //判断用户的购物车是否已经存在此商品
        Cart byMidAndPid = cartMapper.queryByMidAndPid(mid, pid);
        if (byMidAndPid == null){
            //没有，添加
            return cartMapper.doInsert(new Cart(mid,pid,quantity));
        }else {
            //有，修改数量
            return cartMapper.updateQuantity(byMidAndPid.getId(),quantity);
        }
    }

    @Override
    public Map<String,Object> getByMid(Integer mid) {
        List<ProductInCart> carts = cartMapper.queryByMid(mid);
        CartTotal total = cartMapper.queryTotal(mid);
        Map<String,Object> map = new HashMap<>();
        map.put("carts",carts);
        map.put("total",total);
        return map;
    }

    @Override
    public CartTotal minus(Integer mid, Integer id) {
        Integer minus = cartMapper.minus(mid, id);
        if (minus == 1){
            return cartMapper.queryTotal(mid);
        }
        return null;
    }

    @Override
    public CartTotal plus(Integer mid, Integer id) {
        Integer plus = cartMapper.plus(mid, id);
        if (plus == 1){
            return cartMapper.queryTotal(mid);
        }
        return null;
    }

    @Override
    public CartTotal delete(Integer mid, Integer id) {
        Integer delete = cartMapper.doDelete(mid, id);
        if (delete == 1){
            return cartMapper.queryTotal(mid);
        }
        return null;
    }
}
