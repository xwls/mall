package com.hwua.mall.common.po;

import java.util.Date;

public class Brand {
    private Integer bid;
    private String name;
    private Date create_time;
    private Integer status;

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Brand brand = (Brand) o;

        if (bid != null ? !bid.equals(brand.bid) : brand.bid != null) return false;
        if (name != null ? !name.equals(brand.name) : brand.name != null) return false;
        if (create_time != null ? !create_time.equals(brand.create_time) : brand.create_time != null) return false;
        return status != null ? status.equals(brand.status) : brand.status == null;
    }

    @Override
    public int hashCode() {
        int result = bid != null ? bid.hashCode() : 0;
        result = 31 * result + (name != null ? name.hashCode() : 0);
        result = 31 * result + (create_time != null ? create_time.hashCode() : 0);
        result = 31 * result + (status != null ? status.hashCode() : 0);
        return result;
    }

    @Override
    public String toString() {
        return "Brand{" +
                "bid=" + bid +
                ", name='" + name + '\'' +
                ", create_time=" + create_time +
                ", status=" + status +
                '}';
    }

    public Integer getBid() {
        return bid;
    }

    public void setBid(Integer bid) {
        this.bid = bid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Date getCreate_time() {
        return create_time;
    }

    public void setCreate_time(Date create_time) {
        this.create_time = create_time;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }
}
