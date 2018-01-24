package com.hwua.mall.common.service;

import com.hwua.mall.common.po.Member;

import java.util.Map;

public interface MemberService {

    public Member login(String name,String pass);
    public Map<String,Object> register(String name, String pass);

}
