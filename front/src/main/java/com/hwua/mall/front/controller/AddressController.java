package com.hwua.mall.front.controller;

import com.hwua.mall.common.po.Address;
import com.hwua.mall.common.po.Member;
import com.hwua.mall.common.service.AddressService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/address")
public class AddressController {

    @Autowired
    private AddressService addressService;

    @RequestMapping
    public String main(HttpSession session, Map<String,Object> map){
        Member member = (Member) session.getAttribute("member");
        List<Address> addresses = addressService.getByMid(member.getMid());
        map.put("addresses",addresses);
        return "address";
    }
}
