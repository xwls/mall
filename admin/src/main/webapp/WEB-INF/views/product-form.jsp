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
    <%@ include file="common/head.jsp"%>
    <link type="text/css" rel="stylesheet" href="${path}/static/bower_components/select2/dist/css/select2.min.css"/>
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
                    <form role="form">
                        <div class="box-body">
                            <div class="form-group">
                                <label for="name">商品名</label>
                                <div class="input-group">
                                    <div class="input-group-addon">
                                        <i class="fa fa-pencil"></i>
                                    </div>
                                    <input type="text" class="form-control" id="name" placeholder="输入商品名" required/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="description">商品描述</label>
                                <div class="input-group">
                                    <div class="input-group-addon">
                                        <i class="fa fa-quote-left"></i>
                                    </div>
                                    <input type="text" class="form-control" id="description" placeholder="输入商品描述">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="cid">分类</label>
                                <div class="input-group">
                                    <div class="input-group-addon">
                                        <i class="fa fa-suitcase"></i>
                                    </div>
                                    <select id="cid" name="cid" class="form-control select2" style="width: 100%;">
                                        <option selected="selected">Alabama</option>
                                        <option>Alaska</option>
                                        <option disabled="disabled">California (disabled)</option>
                                        <option>Delaware</option>
                                        <option>Tennessee</option>
                                        <option>Texas</option>
                                        <option>Washington</option>
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
                                        <option selected="selected">Alabama</option>
                                        <option>Alaska</option>
                                        <option disabled="disabled">California (disabled)</option>
                                        <option>Delaware</option>
                                        <option>Tennessee</option>
                                        <option>Texas</option>
                                        <option>Washington</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="imgUrl">商品图片</label>
                                <input type="file" id="imgUrl">
                                <p class="help-block">商品主图，尺寸：450px*450px.</p>
                            </div>
                            <div class="form-group">
                                <label for="originalPrice">厂商售价</label>
                                <div class="input-group">
                                    <div class="input-group-addon">
                                        <i class="fa fa-rmb"></i>
                                    </div>
                                    <input type="number" step="0.01" class="form-control" id="originalPrice"
                                           placeholder="输入厂商售价">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="price">商品售价</label>
                                <div class="input-group">
                                    <div class="input-group-addon">
                                        <i class="fa fa-rmb"></i>
                                    </div>
                                    <input type="number" step="0.01" class="form-control" id="price"
                                           placeholder="输入商品售价">
                                </div>
                            </div>
                            <div class="checkbox">
                                <label>
                                    <input type="checkbox"> Check me out
                                </label>
                            </div>
                        </div>
                        <!-- /.box-body -->

                        <div class="box-footer">
                            <button type="submit" class="btn btn-primary">Submit</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </section>
</div>
<%@ include file="common/script.jsp"%>
<script type="text/javascript" src="${path}/static/bower_components/select2/dist/js/select2.full.min.js"></script>
<script type="text/javascript">
    $(document).ready(function () {
        $(".select2").select2();
    });
</script>
</body>
</html>
