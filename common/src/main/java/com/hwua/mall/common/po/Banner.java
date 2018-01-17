package com.hwua.mall.common.po;

public class Banner {
    private Integer id;
    private String img;
    private String href;

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Banner banner = (Banner) o;

        if (id != null ? !id.equals(banner.id) : banner.id != null) return false;
        if (img != null ? !img.equals(banner.img) : banner.img != null) return false;
        return href != null ? href.equals(banner.href) : banner.href == null;
    }

    @Override
    public int hashCode() {
        int result = id != null ? id.hashCode() : 0;
        result = 31 * result + (img != null ? img.hashCode() : 0);
        result = 31 * result + (href != null ? href.hashCode() : 0);
        return result;
    }

    @Override
    public String toString() {
        return "Banner{" +
                "id=" + id +
                ", img='" + img + '\'' +
                ", href='" + href + '\'' +
                '}';
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public String getHref() {
        return href;
    }

    public void setHref(String href) {
        this.href = href;
    }
}
