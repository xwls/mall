package com.hwua.common.dao;

import com.hwua.common.po.Banner;

import java.util.Set;

public interface BannerMapper {
    public Set<Banner> queryLast(Integer count);
}
