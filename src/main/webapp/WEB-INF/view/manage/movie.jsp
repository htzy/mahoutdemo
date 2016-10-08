<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: root
  Date: 10/2/16
  Time: 1:16 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
﻿<!DOCTYPE html>
<html lang="zh-cn">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <meta name="renderer" content="webkit">
    <title>后台管理</title>
    <link rel="stylesheet" href="${basePath}/lib/jqpagination/css/jqpagination.css"/>
    <link rel="stylesheet" href="${basePath}/lib/bootstrap-3.3.5/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="${basePath}/lib/pintuer/css/pintuer.css">
    <link rel="stylesheet" href="${basePath}/lib/pintuer/css/admin.css">

    <script type="text/javascript" src="${basePath}/lib/js/jquery-1.12.2.js"></script>
    <script type="text/javascript" src="${basePath}/lib/pintuer/js/pintuer.js"></script>
    <script type="text/javascript" src="${basePath}/lib/pintuer/js/admin.js"></script>
    <script type="text/javascript" src="${basePath}/lib/bootstrap-3.3.5/js/bootstrap.min.js"></script>

    <script type="text/javascript" src="${basePath}/lib/jqpagination/js/jquery.jqpagination.min.js"></script>
    <script type="text/javascript" src="${basePath}/lib/js/validateKit.js"></script>
    <style type="text/css">
        .pagination a {
            padding: 0 0
        }

        .modal-backdrop {
            position: relative;
        }

        .close:before {
            content: ""
        }
    </style>
</head>
<body>
<div class="lefter">
    <div class="logo">
        <a href="#" target="_blank"><img src="http://oeerwig1e.bkt.clouddn.com/logo.png" alt="后台管理系统"/></a>
    </div>
</div>
<div class="righter nav-navicon" id="admin-nav">
    <div class="mainer">
        <div class="admin-navbar">
            <span class="float-right">
                <a class="button button-little bg-main" href="${basePath}/" target="_blank">前台首页</a>
                <a class="button button-little bg-yellow" href="${basePath}/logout">注销登录</a>
            </span>
            <ul class="nav nav-inline admin-nav">
                <li class="active">
                    <a href="#" class="btn icon-home" style=" width: 73px;">开始</a>
                    <ul>
                        <li><a href="${basePath}/manage">系统</a></li>
                        <li class="active"><a href="${basePath}/manage/movie">电影管理</a></li>
                        <li><a href="${basePath}/manage/evaluate">算法评估</a></li>
                    </ul>
                </li>
            </ul>
        </div>
        <div class="admin-bread">
            <span>您好，${userInfo.username}，欢迎您的光临。</span>
            <ul class="bread">
                <li><a href="${basePath}/manage" class="icon-home"> 开始</a></li>
                <li>电影管理</li>
            </ul>
        </div>
    </div>
</div>

<div class="admin">
    <form method="post">
        <div class="panel admin-panel">
            <div class="panel-head"><strong>电影列表</strong></div>
            <div class="padding border-bottom">
                <input type="button" class="button button-small checkall" name="checkall" checkfor="id" value="全选"/>
            </div>
            <table class="table table-hover">
                <tr>
                    <th width="5%">选择</th>
                    <th width="20%">genres</th>
                    <th width="40%">名称</th>
                    <th width="30%">海报地址</th>
                    <th width="5%">操作</th>
                </tr>
                <c:forEach items="${moviePage.list}" var="movie">
                    <tr>
                        <td>
                            <input type="checkbox" name="id" value="${movie.id}"/>
                        </td>
                        <td>${movie.genres}</td>
                        <td>${movie.title}</td>
                        <c:if test="${empty movie.url}">
                            <td>默认随机海报</td>
                        </c:if>
                        <c:if test="${!empty movie.url}">
                            <td>${movie.url}</td>
                        </c:if>
                        <td><a class="btn btn-danger btn-sm" data-toggle="modal"
                               onclick="changeBackground('${movie.id}', '${movie.title}','${movie.url}')">修改</a></td>
                    </tr>
                </c:forEach>
            </table>
            <div class="panel-foot text-center">
                <div class="pagination">
                    <a href="#" class="first" data-action="first">&laquo;</a>
                    <a href="#" class="previous" data-action="previous">&lsaquo;</a>
                    <input type="text" readonly="readonly"/>
                    <a href="#" class="next" data-action="next">&rsaquo;</a>
                    <a href="#" class="last" data-action="last">&raquo;</a>
                </div>
            </div>
        </div>
    </form>
    <br/>

    <p class="text-right text-gray">基于<a class="text-gray" target="_blank" href="http://www.pintuer.com">拼图前端框架</a>构建
    </p>


    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" id="myModalLabel">修改电影海报</h4>
                </div>
                <div class="modal-body">
                    名称:<input id="modal_title_id" type="text" readonly value="" formnovalidate>
                    <input id="modal_url_id" type="url" placeholder="请输入海报地址" novalidate="true">
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button id="modal_submit_id" type="button" class="btn btn-primary">提交更改</button>
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal -->
    </div>
</div>
</body>

</html>
<script>
    $('.pagination').jqPagination({
        link_string: '${basePath}/manage/movie?pageNum={page_number}',
        max_page: ${moviePage.totalPage},
        current_page:${moviePage.pageNumber},
        paged: function (page) {
            window.location.href = "${basePath}/manage/movie?pageNum=" + page;
        }
    });
    function changeBackground(id, title, url) {
        $("#modal_url_id").val(url);
        $("#modal_title_id").val(title);
        $("#modal_submit_id").click(function () {
            console.info("submit");
            updateBackground(id, $("#modal_url_id").val());
        });
        $("#myModal").modal();
    }

    function updateBackground(id, url) {
        console.info(url+" "+isUrl(url));
        if (isUrl(url)) {
            $.post("${basePath}/manage/updateBackground",
                    {'movie.id': id, 'movie.url': url},
                    function (result) {
                        console.info(result);
                        window.location.reload();
                    }, "json");

        } else {
            alert("必须输入url格式!")
        }
    }

</script>