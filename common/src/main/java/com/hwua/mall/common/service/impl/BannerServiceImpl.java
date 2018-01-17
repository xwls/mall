package com.hwua.mall.common.service.impl;

import com.hwua.mall.common.dao.BannerMapper;
import com.hwua.mall.common.po.Banner;
import com.hwua.mall.common.service.BannerService;
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
