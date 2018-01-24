package com.hwua.mall.common.dao;

import com.hwua.mall.common.po.Member;

import java.util.List;

public interface MemberMapper {
    public Member queryOne(Member member);
    public List<Member> query(Member member);
    public Integer doInsert(Member member);
}
