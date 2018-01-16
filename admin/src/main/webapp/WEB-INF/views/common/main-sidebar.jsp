<%--
  Created by IntelliJ IDEA.
  User: kevin.wang
  Date: 2018/1/16 0016
  Time: 9:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<aside class="main-sidebar">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
        <!-- Sidebar user panel -->
        <div class="user-panel">
            <div class="pull-left image">
                <img src="${ctx}/static/dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">
            </div>
            <div class="pull-left info">
                <p>Alexander Pierce</p>
                <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
            </div>
        </div>
        <!-- search form -->
        <%--<form action="#" method="get" class="sidebar-form">
          <div class="input-group">
            <input type="text" name="q" class="form-control" placeholder="Search...">
            <span class="input-group-btn">
                  <button type="submit" name="search" id="search-btn" class="btn btn-flat"><i class="fa fa-search"></i>
                  </button>
                </span>
          </div>
        </form>--%>
        <!-- /.search form -->
        <!-- sidebar menu: : style can be found in sidebar.less -->
        <ul class="sidebar-menu" data-widget="tree">
            <li class="active treeview">
                <a href="#">
                    <i class="fa fa-dashboard"></i> <span>控制台</span>
                    <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
                </a>
                <ul class="treeview-menu">
                    <li <c:if test='${requestScope.title == "仪表盘"}'> class="active"</c:if> ><a href="index"><i class="fa fa-circle-o"></i>体表盘</a></li>
                    <li <c:if test='${requestScope.title == "分类&品牌"}'> class="active"</c:if> ><a href="category-brand"><i class="fa fa-circle-o"></i>分类&品牌</a></li>
                    <li <c:if test='${requestScope.title == "商品"}'> class="active"</c:if> ><a href="product"><i class="fa fa-circle-o"></i>商品管理</a></li>
                    <li <c:if test='${requestScope.title == "会员"}'> class="active"</c:if> ><a href="member"><i class="fa fa-circle-o"></i>会员管理</a></li>
                </ul>
            </li>
        </ul>
    </section>
    <!-- /.sidebar -->
</aside>
