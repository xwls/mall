package com.hwua.front.service;


import com.hwua.common.po.Banner;

import java.util.Set;

public interface BannerService {
    public Set<Banner> getLast3();
    public Set<Banner> getLast4();
}
