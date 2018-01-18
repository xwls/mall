<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <%@include file="common/head.jsp" %>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">

    <%@include file="common/header.jsp" %>
    <!-- Left side column. contains the logo and sidebar -->
    <%@include file="common/main-sidebar.jsp" %>

    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <h1>
                品牌管理
            </h1>
            <ol class="breadcrumb">
                <li><a href="index"><i class="fa fa-dashboard"></i>首页</a></li>
                <li class="active">品牌管理</li>
            </ol>
        </section>

        <!-- Main content -->
        <section class="content">
            <!-- Small boxes (Stat box) -->
            <!-- /.row -->
            <!-- Main row -->
            <div class="row">
                <!-- Left col -->
                <div class="col-md-8">
                    <div class="box box-success">
                        <div class="box-header with-border">
                            <h3 class="box-title">品牌列表</h3>
                            <div class="box-tools">
                                <div class="input-group input-group-sm" style="width: 200px;">
                                    <input type="text" name="table_search" class="form-control pull-right"
                                           placeholder="Search">
                                    <div class="input-group-btn">
                                        <button type="submit" class="btn btn-default"><i class="fa fa-search"></i>
                                        </button>
                                        <button onclick="add()" class="btn btn-default" style="margin-left: 2px"><i
                                                class="fa fa-plus"></i></button>
                                        <button class="btn btn-default" style="margin-left: 2px"><i
                                                class="fa fa-refresh"></i></button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- /.box-header -->
                        <div class="box-body">
                            <table class="table table-bordered table-hover text-center">
                                <tr>
                                    <th>#</th>
                                    <th style="width: 120px">名称</th>
                                    <th style="width: 100px">商品数量</th>
                                    <th>百分比</th>
                                    <th>添加时间</th>
                                    <th>状态</th>
                                    <th style="width: 100px">操作</th>
                                </tr>
                                <c:forEach items="${requestScope.brands}" var="brand">
                                    <tr>
                                        <td>${brand.bid}.</td>
                                        <td>${brand.name}</td>
                                        <td><span class="badge bg-light-blue">${brand.count}</span></td>
                                        <td width="120px">
                                            <div class="progress progress-sm" data-toggle="tooltip" data-original-title="${brand.percent}">
                                                <div class="progress-bar progress-bar-danger"
                                                     style="width: ${brand.percent}">
                                                </div>
                                            </div>
                                        </td>
                                        <td>${brand.create_time}</td>
                                        <td>
                                            <c:if test="${brand.status == 1}">
                                                <span class="label label-success">启用</span>
                                            </c:if>
                                            <c:if test="${brand.status == 0}">
                                                <span class="label label-danger">禁用</span>
                                            </c:if>
                                        </td>
                                        <td>
                                            <a class="fa fa-edit" href="#brand-form" title="编辑" onclick="edit('${brand.bid}','${brand.name}','${brand.status}')">&nbsp;编辑</a>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </table>
                        </div>
                        <!-- /.box-body -->
                        <div class="box-footer clearfix">
                            <span class="text-muted">共 ${requestScope.pageNum} 页， ${requestScope.count} 个</span>
                            <ul class="pagination pagination-sm no-margin pull-right">
                                <c:forEach begin="1" end="${requestScope.pageNum}" varStatus="status">
                                    <li <c:if test="${requestScope.page == status.index}">class="active"</c:if>>
                                        <a href="${path}/brand/list?page=${status.index}">${status.index}</a>
                                    </li>
                                </c:forEach>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <a name="brand-form"></a>
                    <div class="box box-success">
                        <div class="box-header with-border">
                            <h3 class="box-title">品牌 - 编辑或添加</h3>
                            <p class="help-block text-sm">点击表格单元行中的“编辑”进行编辑，点击表格左上方“加号”进行添加</p>
                        </div>
                        <form role="form" id="brand-form">
                            <div class="box-body">
                                <div class="form-group">
                                    <input type="hidden" name="bid"/>
                                    <label for="name">品牌名称</label>
                                    <input type="text" class="form-control" name="name" id="name" placeholder="输入分类的名称" required/>
                                </div>
                                <div class="form-group">
                                    <label for="status">状态</label>
                                    <select id="status" name="status" class="form-control" required>
                                        <option value="" disabled selected>-请选择-</option>
                                        <option value="1">启用</option>
                                        <option value="0">禁用</option>
                                    </select>
                                </div>
                            </div>
                            <div class="box-footer">
                                <button type="button" onclick="saveOrUpdate()" class="btn btn-primary">提交</button>
                            </div>
                        </form>
                    </div>
                </div>

                <!-- /.Left col -->
                <!-- right col (We are only adding the ID to make the widgets sortable)-->
                <section class="col-lg-5 connectedSortable">


                </section>
                <!-- right col -->
            </div>
            <!-- /.row (main row) -->

        </section>
        <!-- /.content -->
    </div>
    <!-- /.content-wrapper -->
    <%@include file="common/main-footer.jsp" %>

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
        </div>
    </aside>
    <!-- /.control-sidebar -->
    <!-- Add the sidebar's background. This div must be placed
         immediately after the control sidebar -->
    <div class="control-sidebar-bg"></div>
</div>
<!-- ./wrapper -->
<%@include file="common/script.jsp" %>
<script type="text/javascript"src="${path}/static/dist/js/pages/brand.js"></script>
</body>
</html>
