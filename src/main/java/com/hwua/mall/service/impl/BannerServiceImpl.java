package com.hwua.mall.service.impl;

import com.hwua.mall.dao.BannerMapper;
import com.hwua.mall.po.Banner;
import com.hwua.mall.service.BannerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Set;

/**
 *
 */
@SuppressWarnings("ALL")
@Service("bannerService")
public class BannerServiceImpl implements BannerService {

    @Autowired
    private BannerMapper bannerMapper;

    @Override
    public Set<Banner> getLast3() {
        return bannerMapper.queryLast(3);
    }

    @Override
    public Set<Banner> getLast4() {
        return bannerMapper.queryLast(4);
    }
}
