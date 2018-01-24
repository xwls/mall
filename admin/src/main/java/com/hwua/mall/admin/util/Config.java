package com.hwua.mall.admin.util;

public class Config {
    private String accessKey;
    private String secretKey;
    private String bucket;
    private String domain;

    public void setDomain(String domain) {
        this.domain = domain;
    }

    public void setAccessKey(String accessKey) {
        this.accessKey = accessKey;
    }

    public void setSecretKey(String secretKey) {
        this.secretKey = secretKey;
    }

    public void setBucket(String bucket) {
        this.bucket = bucket;
    }

    public String getAccessKey() {
        return accessKey;
    }

    public String getSecretKey() {
        return secretKey;
    }

    public String getBucket() {
        return bucket;
    }

    public String getDomain() {
        return domain;
    }
}
