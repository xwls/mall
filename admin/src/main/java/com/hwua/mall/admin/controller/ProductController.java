package com.hwua.mall.admin.controller;

import com.alibaba.fastjson.JSON;
import com.hwua.mall.admin.util.Config;
import com.hwua.mall.common.po.Brand;
import com.hwua.mall.common.po.Category;
import com.hwua.mall.common.po.Product;
import com.hwua.mall.common.service.BrandService;
import com.hwua.mall.common.service.CategoryService;
import com.hwua.mall.common.service.ProductService;
import com.qiniu.common.Zone;
import com.qiniu.http.Response;
import com.qiniu.storage.Configuration;
import com.qiniu.storage.UploadManager;
import com.qiniu.storage.model.DefaultPutRet;
import com.qiniu.util.Auth;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static com.hwua.mall.common.util.CommonUtil.ADMIN_PRODUCT_PAGE_SIZE;

@Controller
@RequestMapping("/product")
public class ProductController {

    @Autowired
    private ProductService productService;

    @Autowired
    private BrandService brandService;

    @Autowired
    private CategoryService categoryService;

    @Autowired
    private Config config;

    private Logger logger = Logger.getLogger(ProductController.class);

    @RequestMapping("/list")
    public String index(Integer cid, Integer bid, @RequestParam(required = false,defaultValue = "1") Integer page, String keyWord, Map<String,Object> map){
        logger.debug("cid = [" + cid + "], bid = [" + bid + "], page = [" + page + "], keyWord = [" + keyWord + "], map = [" + map + "]");
        map.put("title","商品");
        Map<String, Object> param = new HashMap<>();
        param.put("cid", cid);
        param.put("bid", bid);
        param.put("page", page);
        param.put("keyWord", keyWord);
        param.put("orderBy", "pid");
        param.put("start",(page - 1) * ADMIN_PRODUCT_PAGE_SIZE);
        param.put("pageSize",ADMIN_PRODUCT_PAGE_SIZE);
        param.put("admin","");
        Map<String, Object> result = productService.query(param);
        logger.debug("result = " + JSON.toJSONString(result));
        result.get("products");
        map.putAll(result);
        return "product";
    }

    @RequestMapping("/form")
    public String form(Integer pid,Map<String,Object> map){
        System.out.println("pid = [" + pid + "]");
        List<Brand> brands = brandService.queryAll();
        List<Category> categories = categoryService.queryAll();
        map.put("brands",brands);
        map.put("categories",categories);
        if (pid != null) {
            Product product = productService.get(pid);
            map.put("product",product);
        }
        return "product-form";
    }

    @ResponseBody
    @RequestMapping(value = "/saveOrUpdate",produces = "application/json;charset=utf-8")
    public String saveOrUpdate(MultipartFile file, Product product) throws IOException {
        System.out.println("file = [" + file + "], product = [" + product + "]");
        byte[] bytes = file.getBytes();
        //构造一个带指定Zone对象的配置类
        Configuration configuration = new Configuration(Zone.zone0());
        UploadManager uploadManager = new UploadManager(configuration);
        //生成上传凭证，然后准备上传
        Auth auth = Auth.create(config.getAccessKey(), config.getSecretKey());
        String uploadToken = auth.uploadToken(config.getBucket());
        //key：如果不设置key，会使用文件内容的hash值作为key
        //同一个文件hash值相同
        Response response = uploadManager.put(bytes, null, uploadToken);
        //获取响应体的字符串
        String bodyString = response.bodyString();
        DefaultPutRet putRet = JSON.parseObject(bodyString, DefaultPutRet.class);
        String imgUrl = config.getDomain()+putRet.key;
        product.setImgUrl(imgUrl);
//        productService.
        return JSON.toJSONString(product);
    }
}
