package com.hwua.mall.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Map;

@Controller
public class MemberController {
    @RequestMapping("/member")
    public String index(Map<String,Object> map){
        map.put("title","会员");
        return "member";
    }
}
