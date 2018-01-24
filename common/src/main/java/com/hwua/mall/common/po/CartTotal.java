package com.hwua.mall.common.po;

public class CartTotal {
    private Integer totalCount;
    private Double totalPrice;

    @Override
    public String toString() {
        return "CartTotal{" +
                "totalCount=" + totalCount +
                ", totalPrice=" + totalPrice +
                '}';
    }

    public Integer getTotalCount() {
        return totalCount;
    }

    public void setTotalCount(Integer totalCount) {
        this.totalCount = totalCount;
    }

    public Double getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(Double totalPrice) {
        this.totalPrice = totalPrice;
    }
}
