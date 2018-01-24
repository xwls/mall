package com.hwua.mall.front.controller;

import com.alibaba.fastjson.JSONObject;
import com.hwua.mall.common.po.*;
import com.hwua.mall.common.service.CartService;
import com.hwua.mall.common.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/cart")
public class CartController {

    @Autowired
    private CartService cartService;

    @Autowired
    private ProductService productService;

    @RequestMapping("/add")
    public String add(Map<String,Object> map,HttpSession session, Integer pid, Integer quantity){
        System.out.println("pid = [" + pid + "], quantity = [" + quantity + "]");
        Member member = (Member) session.getAttribute("member");
        Integer saveOrUpdate = cartService.saveOrUpdate(member.getMid(), pid, quantity);
        if (saveOrUpdate == 1){
            Product product = productService.get(pid);
            map.put("product",product);
            map.put("quantity",quantity);
        }
        return "result";
    }

    @RequestMapping("/list")
    public String list(HttpSession session,Map<String,Object> map){
        Member member = (Member) session.getAttribute("member");
        Map<String, Object> result = cartService.getByMid(member.getMid());
        map.putAll(result);
        return "cart";
    }

    @ResponseBody
    @RequestMapping(value = "/minus/{id}",produces = "application/json;charset=utf-8")
    public String minus(HttpSession session, @PathVariable Integer id){
        Member member = (Member) session.getAttribute("member");
        CartTotal cartTotal = cartService.minus(member.getMid(), id);
        return cartTotal2Json(cartTotal);
    }

    @ResponseBody
    @RequestMapping(value = "/plus/{id}",produces = "application/json;charset=utf-8")
    public String plus(HttpSession session, @PathVariable Integer id){
        Member member = (Member) session.getAttribute("member");
        CartTotal cartTotal = cartService.plus(member.getMid(), id);
        return cartTotal2Json(cartTotal);
    }

    @ResponseBody
    @RequestMapping(value = "/delete/{id}",produces = "application/json;charset=utf-8")
    public String delete(HttpSession session, @PathVariable Integer id){
        Member member = (Member) session.getAttribute("member");
        CartTotal cartTotal = cartService.delete(member.getMid(), id);
        return cartTotal2Json(cartTotal);
    }

    private String cartTotal2Json(CartTotal cartTotal){
        JSONObject jsonObject = new JSONObject();
        if (cartTotal != null) {
            jsonObject.put("success",true);
            jsonObject.put("total",cartTotal);
        }else {
            jsonObject.put("success",false);
            jsonObject.put("reason","未知错误");
        }
        return jsonObject.toJSONString();
    }
}
