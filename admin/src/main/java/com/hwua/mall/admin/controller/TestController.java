package com.hwua.mall.admin.controller;

import com.alibaba.fastjson.JSON;
import com.qiniu.common.Zone;
import com.qiniu.http.Response;
import com.qiniu.storage.Configuration;
import com.qiniu.storage.UploadManager;
import com.qiniu.storage.model.DefaultPutRet;
import com.qiniu.util.Auth;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.Map;

//@Controller
@RequestMapping("/test")
public class TestController {

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

    @RequestMapping("/uploadPage")
    public String upload(){
        return "upload";
    }

    @RequestMapping("/fileUpload")
    public String fileUpload(MultipartFile file,String productName, Map<String,Object> map) throws IOException {
        byte[] bytes = file.getBytes();
        //构造一个带指定Zone对象的配置类
        Configuration configuration = new Configuration(Zone.zone0());
        UploadManager uploadManager = new UploadManager(configuration);
        //生成上传凭证，然后准备上传
        Auth auth = Auth.create(accessKey, secretKey);
        String uploadToken = auth.uploadToken(bucket);
        //key：如果不设置key，会使用文件内容的hash值作为key
        //同一个文件hash值相同
        Response response = uploadManager.put(bytes, null, uploadToken);
        //获取响应体的字符串
        String bodyString = response.bodyString();
        DefaultPutRet putRet = JSON.parseObject(bodyString, DefaultPutRet.class);
        String imgUrl = domain+putRet.key;
        map.put("imgUrl",imgUrl);
        map.put("productName",productName);
        return "success";
    }

}
