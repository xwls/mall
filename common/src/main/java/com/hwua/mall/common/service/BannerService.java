package com.hwua.mall.common.service;


import com.hwua.mall.common.po.Banner;

import java.util.Set;

public interface BannerService {
    public Set<Banner> getLast3();
    public Set<Banner> getLast4();
}
