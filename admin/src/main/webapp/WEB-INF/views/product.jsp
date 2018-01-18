<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<%@include file="common/head.jsp"%>
<style type="text/css">
    .table tbody tr td{
        vertical-align: middle;
    }
</style>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">

  <%@include file="common/header.jsp"%>
  <!-- Left side column. contains the logo and sidebar -->
  <%@include file="common/main-sidebar.jsp"%>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        商品管理
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> 首页</a></li>
        <li class="active">商品管理</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">
      <!-- Small boxes (Stat box) -->
      <div class="row">
          <div class="col-xs-12">
              <div class="box">
                  <div class="box-header">
                      <h3 class="box-title">商品列表</h3>
                      <div class="box-tools">
                          <div class="input-group input-group-sm" style="width: 200px;">
                              <input type="text" name="table_search" class="form-control pull-right" placeholder="Search">

                              <div class="input-group-btn">
                                  <button type="submit" class="btn btn-default"><i class="fa fa-search"></i></button>
                                  <button onclick="add()" class="btn btn-default" style="margin-left: 2px"><i
                                          class="fa fa-plus"></i></button>
                                  <button class="btn btn-default" style="margin-left: 2px"><i
                                          class="fa fa-refresh"></i></button>
                              </div>
                          </div>
                      </div>
                  </div>
                  <!-- /.box-header -->
                  <div class="box-body no-padding">
                      <table class="table table-bordered table-hover text-center">
                          <tr>
                              <th>#</th>
                              <th>图片</th>
                              <th style="text-align: left">商品名</th>
                              <th>分类</th>
                              <th>品牌</th>
                              <th>售价</th>
                              <th>库存</th>
                              <th>销量</th>
                              <th>操作</th>
                          </tr>
                          <c:forEach items="${requestScope.products}" var="product">
                              <tr>
                                  <td>${product.pid}</td>
                                  <td>
                                      <div class="pull-left image">
                                          <img style="width: 60px;height: 60px;padding: 5px" src="/front/${product.imgUrl}" class="img-thumbnail" alt="Product Image">
                                      </div>
                                  </td>
                                  <td style="text-align: left">${product.name}</td>
                                  <td>${product.category.name}(${product.category.cid})</td>
                                  <td>${product.brand.name}(${product.brand.bid})</td>
                                  <td>${product.price}</td>
                                  <td>${product.inventory}</td>
                                  <td>${product.salesVolume}</td>
                                  <td>
                                      <a class="fa fa-edit" href="#" title="编辑" onclick="edit('${product.pid}')">&nbsp;编辑</a>
                                  </td>
                              </tr>
                          </c:forEach>
                      </table>
                  </div>
                  <!-- /.box-body -->
                  <div class="box-footer clearfix">
                      <ul class="pagination pagination-sm no-margin pull-right">
                          <c:forEach begin="1" end="${requestScope.pageNum}" varStatus="status">
                              <li <c:if test="${requestScope.page == status.index}">class="active"</c:if> >
                                  <a href="${path}/product/list?page=${status.index}">${status.index}</a>
                              </li>
                          </c:forEach>
                      </ul>
                  </div>
              </div>
              <!-- /.box -->
          </div>
      </div>
      <!-- /.row -->
      <!-- Main row -->
      <!-- /.row (main row) -->

    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
  <%@include file="common/main-footer.jsp"%>

  <!-- Control Sidebar -->
  <aside class="control-sidebar control-sidebar-dark">
    <!-- Create the tabs -->
    <%--<ul class="nav nav-tabs nav-justified control-sidebar-tabs">
      <li><a href="#control-sidebar-home-tab" data-toggle="tab"><i class="fa fa-home"></i></a></li>
      <li><a href="#control-sidebar-settings-tab" data-toggle="tab"><i class="fa fa-gears"></i></a></li>
    </ul>--%>
    <!-- Tab panes -->
    <div class="tab-content">
      <!-- Home tab content -->
      <div class="tab-pane" id="control-sidebar-home-tab">

      </div>
      <!-- /.tab-pane -->
      <!-- Stats tab content -->
      <!-- /.tab-pane -->
    </div>
  </aside>
  <!-- /.control-sidebar -->
  <!-- Add the sidebar's background. This div must be placed
       immediately after the control sidebar -->
  <div class="control-sidebar-bg"></div>
</div>
<!-- ./wrapper -->
<%@include file="common/script.jsp"%>
<script type="text/javascript" src="${path}/static/dist/js/pages/product.js"></script>
</body>
</html>
