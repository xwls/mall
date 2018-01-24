package com.hwua.mall.common.po;

public class Cart {
    private Integer id;
    private Integer mid;
    private Integer pid;
    private Integer quantity;

    public Cart() {
    }

    public Cart(Integer mid, Integer pid, Integer quantity) {
        this.mid = mid;
        this.pid = pid;
        this.quantity = quantity;
    }

    @Override
    public String toString() {
        return "Cart{" +
                "id=" + id +
                ", mid=" + mid +
                ", pid=" + pid +
                ", quantity=" + quantity +
                '}';
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getMid() {
        return mid;
    }

    public void setMid(Integer mid) {
        this.mid = mid;
    }

    public Integer getPid() {
        return pid;
    }

    public void setPid(Integer pid) {
        this.pid = pid;
    }

    public Integer getQuantity() {
        return quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }
}
