<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: root
  Date: 9/27/16
  Time: 7:16 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>小红花电影推荐系统</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <script type="text/javascript" src="${basePath}/lib/js/jquery-1.12.2.js"></script>
  <script type="text/javascript" src="${basePath}/lib/bootstrap-3.3.5/js/bootstrap.js"></script>
  <script type="text/javascript" src="${basePath}/lib/js/validateKit.js"></script>
  <script type="text/javascript" src="${basePath}/lib/js/main/login.js"></script>
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
        <a class="navbar-brand" href="${basePath}/"><span>小红花</span></a>
      </div>
      <div class="collapse navbar-collapse" id="navbar-ex-collapse">
        <ul class="nav navbar-nav navbar-right">
          <li class="dropdown">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">visitor<span class="caret"></span></a>
            <ul class="dropdown-menu" role="menu">
              <c:if test="${userInfo.id==1}">
                <li><a href="${basePath}/manage">manage</a></li>
              </c:if>
              <li><a href="${basePath}/logout">logout</a></li>
            </ul>
          </li>
        </ul>
      </div>
    </div>
  </div>
  <%--<div class="cover-image" style="background-image: url(${basePath}/lib/photos/login-background.jpeg);"></div>--%>
  <div class="container">
    <form id="loginForm" action="${basePath}/checkLogin" class="col-sm-offset-3" method="post">
      <input type="hidden" id="basePath" value="${basePath}" />
      <div id="username_css" class="input-group col-md-6">
        <input type="text" id="username" name="user.username" class="form-control" placeholder="用户名">
        <span id="info" class="input-group-addon">${info}</span>
      </div>
      <div id="password_css" class="input-group col-md-6">
        <input type="password" id="password" name="user.password" class="form-control" placeholder="密码">
        <span id="pwdInfo" class="input-group-addon">${passwordMsg}</span>
      </div>
      <div class="input-group col-md-6">
        <div class="btn-group btn-group-justified" role="group">
          <div class="btn-group" role="group">
            <button id="loginSubmit" type="submit" class="btn btn-info text-center">登录</button>
          </div>
        </div>
      </div>
    </form>
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