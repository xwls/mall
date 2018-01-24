package com.hwua.mall.common.service;

import com.hwua.mall.common.po.Address;

import java.util.List;

public interface AddressService {
    List<Address> getByMid(Integer mid);
}
