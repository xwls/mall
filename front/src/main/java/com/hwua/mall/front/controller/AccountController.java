package com.hwua.mall.front.controller;

import com.hwua.mall.common.po.Member;
import com.hwua.mall.common.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/account")
public class AccountController {

    @Autowired
    private MemberService memberService;

    @RequestMapping()
    public String account(){
        return "account";
    }

    @RequestMapping("/login")
    public String login(String name, String pass, @RequestParam(required = false,defaultValue = "/index") String callBack, HttpSession session){
        Member member = memberService.login(name, pass);
        if (member != null){
            //登录成功
            session.setAttribute("member",member);
        }
        return "redirect:"+callBack;
    }

    @RequestMapping("/logout")
    public String logout(HttpSession session){
        session.invalidate();
        return "redirect:/index";
    }
}
