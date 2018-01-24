<%--
  Created by IntelliJ IDEA.
  User: kevin.wang
  Date: 2018/1/18 0018
  Time: 16:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <%@ include file="common/head.jsp" %>
    <link type="text/css" rel="stylesheet" href="${path}/static/bower_components/select2/dist/css/select2.min.css"/>
    <!-- iCheck for checkboxes and radio inputs -->
    <link rel="stylesheet" href="${path}/static/plugins/iCheck/all.css">
    <title>商品添加或修改</title>
</head>
<body>
<div class="wrapper">
    <section class="content">
        <div class="row">
            <div class="col-md-12">
                <div class="box box-primary">
                    <!-- /.box-header -->
                    <!-- form start -->
                    <form id="product-form" role="form"  method="post"
                          enctype="multipart/form-data">
                        <div class="box-body">
                            <div class="form-group">
                                <label for="name">商品名</label>
                                <div class="input-group">
                                    <div class="input-group-addon">
                                        <i class="fa fa-pencil"></i>
                                    </div>
                                    <input value="${requestScope.product.name}" type="text" name="name"
                                           class="form-control" id="name" placeholder="输入商品名" required/>
                                </div>
                                <%--<div class="pull-right" style="width: 100px;height: 100px;background-color: #0d6aad"></div>--%>
                            </div>
                            <div class="form-group">
                                <label for="description">商品描述</label>
                                <div class="input-group">
                                    <div class="input-group-addon" <c:if
                                            test="${requestScope.product != null}"> style="padding: 0"</c:if>>
                                        <c:choose>
                                            <c:when test="${requestScope.product != null}">
                                                <div style="width: 70px;height: 70px">
                                                    <img src="${requestScope.product.imgUrl}?imageView2/1/w/70/h/70/q/75|imageslim"
                                                         alt="">
                                                </div>
                                            </c:when>
                                            <c:otherwise>
                                                <i class="fa fa-quote-left"></i>
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                    <%--<input type="text" class="form-control" id="description" placeholder="输入商品描述">--%>
                                    <textarea id="description" name="description" class="form-control" rows="3"
                                              placeholder="输入商品描述">${requestScope.product.description}</textarea>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="cid">分类</label>
                                <div class="input-group">
                                    <div class="input-group-addon">
                                        <i class="fa fa-suitcase"></i>
                                    </div>
                                    <select id="cid" name="cid" class="form-control select2" style="width: 100%;">
                                        <option value="" disabled selected>-- 请选择 --</option>
                                        <c:forEach items="${requestScope.categories}" var="category">
                                            <option value="${category.cid}"
                                                    <c:if test="${category.cid == requestScope.product.category.cid}">selected</c:if>
                                                    <c:if test="${category.status == 0}">disabled="disabled"</c:if>>${category.name}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="bid">品牌</label>
                                <div class="input-group">
                                    <div class="input-group-addon">
                                        <i class="fa fa-book"></i>
                                    </div>
                                    <select id="bid" name="bid" class="form-control select2" style="width: 100%;">
                                        <option value="" disabled selected>-- 请选择 --</option>
                                        <c:forEach items="${requestScope.brands}" var="brand">
                                            <option value="${brand.bid}"
                                                    <c:if test="${brand.bid == requestScope.product.brand.bid}">selected</c:if>
                                                    <c:if test="${brand.status == 0}">disabled="disabled"</c:if>>${brand.name}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                            <c:if test="${requestScope.product == null}">
                                <%--修改商品信息，不修改图片，图片单独修改--%>
                                <div class="form-group">
                                    <label for="imgUrl">商品图片</label>
                                    <input type="file" name="file" id="imgUrl">
                                    <p class="help-block">商品主图，尺寸：450px*450px.</p>
                                </div>
                            </c:if>
                            <div class="form-group">
                                <label for="originalPrice">厂商售价</label>
                                <div class="input-group">
                                    <div class="input-group-addon">
                                        <i class="fa fa-rmb"></i>
                                    </div>
                                    <input type="number" step="0.01" class="form-control" id="originalPrice"
                                           name="originalPrice"
                                           placeholder="输入厂商售价" value="${requestScope.product.originalPrice}">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="price">商品售价</label>
                                <div class="input-group">
                                    <div class="input-group-addon">
                                        <i class="fa fa-rmb"></i>
                                    </div>
                                    <input type="number" step="0.01" class="form-control" name="price" id="price"
                                           placeholder="输入商品售价" value="${requestScope.product.price}">
                                </div>
                            </div>
                            <div class="row">
                                <div class="form-group col-xs-6">
                                    <label for="inventory">库存</label>
                                    <div class="input-group">
                                        <div class="input-group-addon">
                                            <i class="fa fa-cart-plus"></i>
                                        </div>
                                        <input type="number" id="inventory" name="inventory" class="form-control"
                                               placeholder="输入库存"
                                               value="${requestScope.product.inventory}"/>
                                    </div>
                                </div>
                                <div class="form-group col-xs-6">
                                    <label for="sales_volume">销量</label>
                                    <div class="input-group">
                                        <div class="input-group-addon">
                                            <i class="fa fa-line-chart"></i>
                                        </div>
                                        <input type="number" id="sales_volume" name="salesVolume" readonly
                                               class="form-control"
                                               value="${requestScope.product.salesVolume}"/>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label>
                                    <input type="radio" value="1" name="status" class="minimal"
                                           <c:if test="${requestScope.product.status == 1}">checked</c:if>>
                                    启用
                                </label>
                                <label>
                                    <input type="radio" value="0" name="status" class="minimal"
                                           <c:if test="${requestScope.product.status == 0}">checked</c:if>>
                                    禁用
                                </label>
                            </div>
                        </div>
                        <!-- /.box-body -->
                        <div class="box-footer">
                            <button type="button" id="btn-submit" class="btn btn-primary">提交</button>
                            <button type="button" class="btn btn-default">关闭</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </section>
</div>
<%@ include file="common/script.jsp" %>
<script type="text/javascript" src="${path}/static/bower_components/select2/dist/js/select2.full.min.js"></script>
<!-- iCheck 1.0.1 -->
<script src="${path}/static/plugins/iCheck/icheck.min.js"></script>
<script src="https://cdn.bootcss.com/jquery.form/4.2.2/jquery.form.min.js"></script>
<script type="text/javascript">
    $(document).ready(function () {
        $(".select2").select2();
        $("input[type='radio']").iCheck({
            radioClass: 'iradio_minimal-blue'
        });
        $("#btn-submit").click(function () {
            $("#product-form").ajaxSubmit({
                type: "post",
                url: "${path}/product/saveOrUpdate",
                success: function (res) {
                    console.log(res);
                },
                error: function (res) {
                    console.log(res);
                }
            });
        });
    });
</script>
</body>
</html>
