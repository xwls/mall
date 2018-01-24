package com.hwua.mall.front.controller;

import com.alibaba.fastjson.JSON;
import com.hwua.mall.common.po.Address;
import com.hwua.mall.common.po.Member;
import com.hwua.mall.common.service.AddressService;
import com.hwua.mall.common.service.CartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/checkout")
public class CheckoutController {

    @Autowired
    private CartService cartService;

    @Autowired
    private AddressService addressService;

    @RequestMapping
    public String main(HttpSession session,Map<String,Object> map){
        Member member = (Member) session.getAttribute("member");
        Integer mid = member.getMid();
        Map<String, Object> products = cartService.getByMid(mid);
        List<Address> addresses = addressService.getByMid(mid);
        System.out.println("products = " + JSON.toJSONString(products));
        map.put("products",products);
        map.put("addresses",addresses);
        return "checkout";
    }
}
