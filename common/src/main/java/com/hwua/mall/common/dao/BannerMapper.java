package com.hwua.mall.common.dao;

import com.hwua.mall.common.po.Banner;

import java.util.Set;

public interface BannerMapper {
    public Set<Banner> queryLast(Integer count);

}
