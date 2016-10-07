<%--
  Created by IntelliJ IDEA.
  User: root
  Date: 10/7/16
  Time: 2:13 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>小红花电影推荐系统</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script type="text/javascript" src="${basePath}/lib/js/jquery-1.12.2.js"></script>
    <script type="text/javascript" src="${basePath}/lib/bootstrap-3.3.5/js/bootstrap.js"></script>
    <script type="text/javascript" src="${basePath}/lib/datetimepicker/js/bootstrap-datetimepicker.min.js"></script>
    <link rel="stylesheet" type="text/css" href="${basePath}/lib/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="${basePath}/lib/bootstrap-3.3.5/css/pingendo-default-bootstrap.css">
    <link rel="stylesheet" href="${basePath}/lib/datetimepicker/css/bootstrap-datetimepicker.min.css"/>
    <style>
        .search-section {
            min-height: 100%;
        }
    </style>
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
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">${userInfo.username}<span
                            class="caret"></span></a>
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
<div class="section search-section">
    <div class="container">
        <div class="row">
            <div class="col-md-12"><h1 class="text-center">专为你的推荐</h1></div>
        </div>
        <form class="form-horizontal" role="form">
            <div class="form-group">
                <label for="title" class="col-sm-2 control-label">电影名</label>
                <div class="col-sm-8">
                    <input type="text" class="form-control" id="title"
                           placeholder="请输入电影名">
                </div>
            </div>
            <div class="form-group">
                <label for="type" class="col-sm-2 control-label">类别</label>
                <div class="col-sm-8">
                    <select id="type" class="form-control">
                        <option>Action</option>
                        <option>Adventure</option>
                        <option>Animation</option>
                        <option>Children's</option>
                        <option>Comedy</option>
                        <option>Crime</option>
                        <option>Comedy</option>
                        <option>Documentary</option>
                        <option>Fantasy</option>
                        <option>Film-Noir</option>
                        <option>Horror</option>
                        <option>Musical</option>
                        <option>Mystery</option>
                        <option>Romance</option>
                        <option>Sci-Fi</option>
                        <option>Thriller</option>
                        <option>War</option>
                        <option>Western</option>
                    </select>
                </div>
            </div>
            <div class="form-group">
                <label for="year" class="col-sm-2 control-label">年份</label>
                <div class="input-group date form_year col-sm-8" data-date="" data-date-format="yyyy" data-link-field="year" data-link-format="yyyy">
                    <input class="form-control" size="16" type="text" value="" readonly>
                    <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
                    <span class="input-group-addon"><span class="glyphicon glyphicon-time"></span></span>
                    <div class="col-sm-offset-6 col-sm-2">
                        <button type="button" onclick="showItems()" class="btn btn-default">搜索&推荐</button>
                    </div>
                </div>
                <input type="hidden" id="year" value="" /><br/>
            </div>
        </form>
        <div>
            <a href="${basePath}/mahout">不满意？看看这里~</a><br>
        </div>
        <div id="moviesDiv">

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
    function showItems() {
        $.post("${basePath}/mahout/toSearch",
                {
                    'movie.title':$("#title").val(),
                    'movie.genres':$("#type").val(),
                    'movie.year':$("#year").val()
                },
                function (result) {
                    var $moviesDiv = $("#moviesDiv");
                    $moviesDiv.empty();
                    if(result.items == null || result.items.length == 0){
                        $moviesDiv.append($('<h2 class="text-center">实在是找不到，换换搜索条件吧，未来我们会更好！</h2>'));
                    }else{
                        $.each(result.items, function (i) {
                            var item = result.items[i];
                            $moviesDiv.append($('<div class="col-md-4"><a><img src=' + item.url + ' class="img-responsive"></a>' +
                            '<h4 style="overflow:hidden;white-space:nowrap;text-overflow:ellipsis;" class="text-center">' + item.title + '</h4>' +
                            '<h6 style="overflow:hidden;white-space:nowrap;text-overflow:ellipsis;" class="text-center">value:' + item.value + ', geners:' + item.geners + '</div>'));
                        });
                    }
                }, "json");
    }
    $(".form_year").datetimepicker({
        format: 'yyyy',
        autoclose: true,
        pickerPosition: "bottom-left",
        startView: 4, minView: 4,
        forceParse: false,
        language: 'zh-CN',
        startDate:'1967'
    });
</script>