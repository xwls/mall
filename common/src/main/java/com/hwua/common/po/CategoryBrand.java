package com.hwua.common.po;

import java.util.Set;

public class CategoryBrand extends Category{

    private Set<Brand> brands;

    public Set<Brand> getBrands() {
        return brands;
    }

    public void setBrands(Set<Brand> brands) {
        this.brands = brands;
    }
}
