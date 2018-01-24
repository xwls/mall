package com.hwua.mall.common.service.impl;

import com.hwua.mall.common.dao.MemberMapper;
import com.hwua.mall.common.po.Member;
import com.hwua.mall.common.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

@Service("memberService")
public class MemberServiceImpl implements MemberService {

    @SuppressWarnings("SpringJavaAutowiringInspection")
    @Autowired
    private MemberMapper memberMapper;

    @Override
    public Member login(String name, String pass) {
        Member member = new Member();
        member.setName(name);
        member.setPass(pass);
        return memberMapper.queryOne(member);
    }

    @Override
    public Map<String, Object> register(String name, String pass) {
        Map<String,Object> map = new HashMap<>();
        Member member = new Member();
        member.setName(name);
        Member registerMember = memberMapper.queryOne(member);
        if(registerMember != null){
            //用户名已经存在
            map.put("error","用户名已经存在");
        }else {
            member.setPass(pass);
            Integer integer = memberMapper.doInsert(member);
            if (integer == 1){
                map.put("success",true);
            }else{
                map.put("error","未知错误");
            }
        }
        return map;
    }
}
