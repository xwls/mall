package com.hwua.mall.common.dao;

import com.hwua.mall.common.po.Address;

import java.util.List;

public interface AddressMapper {
    List<Address> queryByMid(Integer mid);
}
