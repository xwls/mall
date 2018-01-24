package com.hwua.mall.front.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/profile")
public class ProfileController {
    @RequestMapping
    public String main(){
        return "profile";
    }
}
