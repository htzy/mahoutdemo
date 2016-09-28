<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: root
  Date: 9/27/16
  Time: 7:32 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>title name</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <script type="text/javascript" src="${basePath}/lib/js/jquery-1.12.2.js"></script>
  <script type="text/javascript" src="${basePath}/lib/bootstrap-3.3.5/js/bootstrap.js"></script>
  <link rel="stylesheet" type="text/css" href="${basePath}/lib/font-awesome/css/font-awesome.min.css">
  <link rel="stylesheet" href="${basePath}/lib/bootstrap-3.3.5/css/pingendo-default-bootstrap.css">
</head>
<body>
<div class="cover">
  <div class="navbar">
    <div class="container">
      <div class="navbar-header">
        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-ex-collapse">
          <span class="sr-only">Toggle navigation</span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand" href="#"><span>组名</span></a>
      </div>
      <div class="collapse navbar-collapse" id="navbar-ex-collapse">
        <ul class="nav navbar-nav navbar-right">
          <li class="dropdown">
            <c:choose>
            <c:when test="${userInfo == null}">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown">visitor<span class="caret"></span></a>
              <ul class="dropdown-menu" role="menu">
                <li><a href="${basePath}/login">login</a></li>
              </ul>
          </c:when>
          <c:otherwise>
              <a href="#" class="dropdown-toggle" data-toggle="dropdown">${userInfo.username}<span class="caret"></span></a>
              <ul class="dropdown-menu" role="menu">
                <li><a href="${basePath}/logout">logout</a></li>
              </ul>
          </c:otherwise>
          </c:choose>
        </li>
        </ul>
      </div>
    </div>
  </div>
  <div class="cover-image" style="background-image: url(https://unsplash.imgix.net/photo-1418065460487-3e41a6c84dc5?q=25&amp;fm=jpg&amp;s=127f3a3ccf4356b7f79594e05f6c840e);"></div>
  <div class="container">
    <div class="row">
      <div class="col-md-12 text-center">
        <h1 class="text-inverse">智能电影推荐系统</h1>
        <p class="text-inverse">我们能做的远远不止这些！</p>
        <br>
        <br>
        <a class="btn btn-lg btn-primary" href="${basePath}/mahout">看片</a>
      </div>
    </div>
  </div>
</div>
<div class="section">
  <div class="container">
    <div class="row">
      <div class="col-md-12">
        <h1 class="text-center text-primary">Team</h1>
        <p class="text-center">We are a group of skilled individuals.</p>
      </div>
    </div>
    <div id="carousel-next" data-interval="5000" class="carousel slide" data-ride="carousel">
      <div class="carousel-inner">
        <div class="item active">
          <div class="row">
            <div class="col-md-3">
              <img src="${basePath}/lib/photos/user_placeholder.png" class="center-block img-circle img-responsive">
              <h3 class="text-center">郝凯</h3>
              <p class="text-center">组长</p>
            </div>
            <div class="col-md-3">
              <img src="${basePath}/lib/photos/huangshihe.jpg" class="center-block img-circle img-responsive">
              <h3 class="text-center">黄诗鹤</h3>
              <p class="text-center">Lead Programmer</p>
            </div>
            <div class="col-md-3">
              <img src="${basePath}/lib/photos/user_placeholder.png" class="center-block img-circle img-responsive">
              <h3 class="text-center">John Doe</h3>
              <p class="text-center">Programmer, Product Testing, Project Manager, UI Designer</p>
            </div>
            <div class="col-md-3">
              <img src="${basePath}/lib/photos/user_placeholder.png" class="center-block img-circle img-responsive">
              <h3 class="text-center">John Doe</h3>
              <p class="text-center">Programmer, Product Testing, Project Manager, UI Designer</p>
            </div>
          </div>
        </div>
        <div class="item">
          <div class="row">
            <div class="col-md-3">
              <img src="${basePath}/lib/photos/user_placeholder.png" class="center-block img-circle img-responsive">
              <h3 class="text-center">郝凯1</h3>
              <p class="text-center">组长1</p>
            </div>
            <div class="col-md-3">
              <img src="${basePath}/lib/photos/huangshihe.jpg" class="center-block img-circle img-responsive">
              <h3 class="text-center">黄诗鹤1</h3>
              <p class="text-center">Lead Programmer</p>
            </div>
            <div class="col-md-3">
              <img src="${basePath}/lib/photos/user_placeholder.png" class="center-block img-circle img-responsive">
              <h3 class="text-center">John Doe1</h3>
              <p class="text-center">Programmer, Product Testing, Project Manager, UI Designer</p>
            </div>
            <div class="col-md-3">
              <img src="${basePath}/lib/photos/user_placeholder.png" class="center-block img-circle img-responsive">
              <h3 class="text-center">John Doe</h3>
              <p class="text-center">Programmer, Product Testing, Project Manager, UI Designer</p>
            </div>
          </div>
        </div>
      </div>
      <a class="left carousel-control" href="#carousel-next" data-slide="prev"><i class="icon-prev  fa fa-angle-left"></i></a>
      <a class="right carousel-control" href="#carousel-next" data-slide="next"><i class="icon-next fa fa-angle-right"></i></a>
    </div>
  </div>
</div>
<footer class="section section-primary">
  <div class="container">
    <div class="row">
      <div class="col-sm-6">
        <h1>about </h1>
        <p>thanks bootstrap and pingendo support
          <br>if you have any question or suggest, &nbsp;please contact me.
          <br>contact@huangshihe.com</p>
      </div>
      <div class="col-sm-6">
        <p class="text-info text-right">
          <br>
          <br>
        </p>
        <div class="row">
          <div class="col-md-12 hidden-lg hidden-md hidden-sm text-left">
            <a href="#"><i class="fa fa-3x fa-fw fa-inverse fa-mortar-board"></i></a>
            <a href="#"><i class="fa fa-3x fa-fw fa-inverse fa-wechat"></i></a>
            <a href="#"><i class="fa fa-3x fa-fw fa-inverse fa-android"></i></a>
            <a href="#"><i class="fa fa-3x fa-fw hub fa-inverse fa-html5"></i></a>
          </div>
        </div>
        <div class="row">
          <div class="col-md-12 hidden-xs text-right">
            <a href="#"><i class="fa fa-3x fa-fw fa-inverse fa-mortar-board"></i></a>
            <a href="#"><i class="fa fa-3x fa-fw fa-inverse fa-wechat"></i></a>
            <a href="#"><i class="fa fa-3x fa-fw fa-inverse fa-android"></i></a>
            <a href="#"><i class="fa fa-3x fa-fw hub fa-inverse fa-html5"></i></a>
          </div>
        </div>
      </div>
    </div>
    <div class="text-center">
      <a href="http://www.miitbeian.gov.cn/" class="alert-info">测试中</a>
    </div>
  </div>
</footer>
</body>
</html>