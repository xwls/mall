package com.hwua.mall.dao;

import com.hwua.mall.po.Banner;

import java.util.Set;

public interface BannerMapper {
    public Set<Banner> queryLast(Integer count);
}
