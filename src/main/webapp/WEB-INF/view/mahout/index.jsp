<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: huangshihe
  Date: 9/26/16
  Time: 4:13 AM
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
    <link rel="stylesheet" type="text/css" href="${basePath}/lib/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="${basePath}/lib/bootstrap-3.3.5/css/pingendo-default-bootstrap.css">
</head>
<body>
<div class="navbar" role="navigation">
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
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">${userInfo.username}<span class="caret"></span></a>
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
<div class="section">
    <div class="container">
        <div class="section">
            <div class="container">
                <div class="row">
                    <div class="col-md-12"><h1 class="text-center">专为你的推荐</h1></div>
                </div>
                <div class="row">
                    <div class="col-sm-10">
                        <a href="javascript:void(0);" onclick="nextPage()">不满意？精彩总在下一页~</a>
                    </div>
                    <div class="col-sm-2">
                        <a href="${basePath}/mahout/search">还不满意？搜索看看~</a>
                    </div>
                </div>
                <div id="moviesDiv">
                    <c:forEach items="${items}" var="item">
                        <div class="col-md-4">
                            <a><img src="${item.url}" class="img-responsive"></a>
                            <h4 style="overflow:hidden;white-space:nowrap;text-overflow:ellipsis;" class="text-center">${item.title}</h4>
                            <h6 style="overflow:hidden;white-space:nowrap;text-overflow:ellipsis;" class="text-center">value:${item.value}, geners:${item.geners}</h6>
                        </div>
                    </c:forEach>
                </div>
            </div>
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
<script>
    function nextPage() {
        $.post("${basePath}/mahout/nextPage",
                {},
                function (result) {
                    var $moviesDiv = $("#moviesDiv");
                    $moviesDiv.empty();
                    $.each(result.items, function (i) {
                        var item = result.items[i];
                        $moviesDiv.append($('<div class="col-md-4"><a><img src='+item.url+' class="img-responsive"></a>' +
                        '<h4 style="overflow:hidden;white-space:nowrap;text-overflow:ellipsis;" class="text-center">'+item.title+'</h4>' +
                        '<h6 style="overflow:hidden;white-space:nowrap;text-overflow:ellipsis;" class="text-center">value:'+item.value+', geners:'+item.geners+'</div>'));
                    });
                }, "json");
    }
</script>