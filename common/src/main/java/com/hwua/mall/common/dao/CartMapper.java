package com.hwua.mall.common.dao;

import com.hwua.mall.common.po.Cart;
import com.hwua.mall.common.po.CartTotal;
import com.hwua.mall.common.po.ProductInCart;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface CartMapper {
    Integer doInsert(Cart cart);
    Cart queryByMidAndPid(@Param("mid") Integer mid, @Param("pid") Integer pid);
    Integer updateQuantity(@Param("id") Integer id,@Param("quantity") Integer quantity);
    List<ProductInCart> queryByMid(Integer mid);
    CartTotal queryTotal(Integer mid);
    Integer minus(@Param("mid") Integer mid, @Param("id") Integer id);
    Integer plus(@Param("mid") Integer mid, @Param("id") Integer id);
    Integer doDelete(@Param("mid") Integer mid, @Param("id") Integer id);
}
