package com.hwua.mall.common.po;

public class Product {
    private Integer pid;
    private Category category;
    private Brand brand;
    private String name;
    private String description;
    private Double originalPrice;
    private Double price;
    private String imgUrl;
    private Integer inventory;
    private Integer salesVolume;
    private String createTime;
    private Integer status;

    public Integer getPid() {
        return pid;
    }

    public void setPid(Integer pid) {
        this.pid = pid;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public Brand getBrand() {
        return brand;
    }

    public void setBrand(Brand brand) {
        this.brand = brand;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Double getOriginalPrice() {
        return originalPrice;
    }

    public void setOriginalPrice(Double originalPrice) {
        this.originalPrice = originalPrice;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public String getImgUrl() {
        return imgUrl;
    }

    public void setImgUrl(String imgUrl) {
        this.imgUrl = imgUrl;
    }

    public Integer getInventory() {
        return inventory;
    }

    public void setInventory(Integer inventory) {
        this.inventory = inventory;
    }

    public Integer getSalesVolume() {
        return salesVolume;
    }

    public void setSalesVolume(Integer salesVolume) {
        this.salesVolume = salesVolume;
    }

    public String getCreateTime() {
        return createTime;
    }

    public void setCreateTime(String createTime) {
        this.createTime = createTime;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Product{" +
                "pid=" + pid +
                ", category=" + category +
                ", brand=" + brand +
                ", name='" + name + '\'' +
                ", description='" + description + '\'' +
                ", originalPrice=" + originalPrice +
                ", price=" + price +
                ", imgUrl='" + imgUrl + '\'' +
                ", inventory=" + inventory +
                ", salesVolume=" + salesVolume +
                ", createTime=" + createTime +
                ", status=" + status +
                '}';
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Product product = (Product) o;

        if (pid != null ? !pid.equals(product.pid) : product.pid != null) return false;
        if (category != null ? !category.equals(product.category) : product.category != null) return false;
        if (brand != null ? !brand.equals(product.brand) : product.brand != null) return false;
        if (name != null ? !name.equals(product.name) : product.name != null) return false;
        if (description != null ? !description.equals(product.description) : product.description != null) return false;
        if (originalPrice != null ? !originalPrice.equals(product.originalPrice) : product.originalPrice != null)
            return false;
        if (price != null ? !price.equals(product.price) : product.price != null) return false;
        if (imgUrl != null ? !imgUrl.equals(product.imgUrl) : product.imgUrl != null) return false;
        if (inventory != null ? !inventory.equals(product.inventory) : product.inventory != null) return false;
        if (salesVolume != null ? !salesVolume.equals(product.salesVolume) : product.salesVolume != null) return false;
        if (createTime != null ? !createTime.equals(product.createTime) : product.createTime != null) return false;
        return status != null ? status.equals(product.status) : product.status == null;
    }

    @Override
    public int hashCode() {
        int result = pid != null ? pid.hashCode() : 0;
        result = 31 * result + (category != null ? category.hashCode() : 0);
        result = 31 * result + (brand != null ? brand.hashCode() : 0);
        result = 31 * result + (name != null ? name.hashCode() : 0);
        result = 31 * result + (description != null ? description.hashCode() : 0);
        result = 31 * result + (originalPrice != null ? originalPrice.hashCode() : 0);
        result = 31 * result + (price != null ? price.hashCode() : 0);
        result = 31 * result + (imgUrl != null ? imgUrl.hashCode() : 0);
        result = 31 * result + (inventory != null ? inventory.hashCode() : 0);
        result = 31 * result + (salesVolume != null ? salesVolume.hashCode() : 0);
        result = 31 * result + (createTime != null ? createTime.hashCode() : 0);
        result = 31 * result + (status != null ? status.hashCode() : 0);
        return result;
    }
}
