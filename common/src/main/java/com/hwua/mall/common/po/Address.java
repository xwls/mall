package com.hwua.mall.common.po;

public class Address {
    private Integer aid;
    private String addr;
    private String name;
    private String tel;
    private Integer mid;
    private Integer isDefault;
    private Integer status;

    @Override
    public String toString() {
        return "Address{" +
                "aid=" + aid +
                ", addr='" + addr + '\'' +
                ", name='" + name + '\'' +
                ", tel='" + tel + '\'' +
                ", mid=" + mid +
                ", isDefault=" + isDefault +
                ", status=" + status +
                '}';
    }

    public Integer getAid() {
        return aid;
    }

    public void setAid(Integer aid) {
        this.aid = aid;
    }

    public String getAddr() {
        return addr;
    }

    public void setAddr(String addr) {
        this.addr = addr;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public Integer getMid() {
        return mid;
    }

    public void setMid(Integer mid) {
        this.mid = mid;
    }

    public Integer getIsDefault() {
        return isDefault;
    }

    public void setIsDefault(Integer isDefault) {
        this.isDefault = isDefault;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }
}
