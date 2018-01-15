package com.hwua.mall.service;

import com.hwua.mall.po.Banner;

import java.util.Set;

public interface BannerService {
    public Set<Banner> getLast3();
    public Set<Banner> getLast4();
}
