package com.hwua.mall.common.service.impl;

import com.hwua.mall.common.dao.AddressMapper;
import com.hwua.mall.common.po.Address;
import com.hwua.mall.common.service.AddressService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("addressService")
public class AddressServiceImpl implements AddressService{

    @SuppressWarnings("SpringJavaAutowiringInspection")
    @Autowired
    private AddressMapper addressMapper;

    @Override
    public List<Address> getByMid(Integer mid) {
        return addressMapper.queryByMid(mid);
    }
}
