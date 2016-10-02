<%--
  Created by IntelliJ IDEA.
  User: root
  Date: 10/2/16
  Time: 1:27 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-cn">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <meta name="renderer" content="webkit">
    <title>后台管理</title>
    <link rel="stylesheet" href="${basePath}/lib/pintuer/css/pintuer.css">
    <link rel="stylesheet" href="${basePath}/lib/pintuer/css/admin.css">
    <script type="text/javascript" src="${basePath}/lib/js/jquery-1.12.2.js"></script>
    <script type="text/javascript" src="${basePath}/lib/pintuer/js/pintuer.js"></script>
    <script type="text/javascript" src="${basePath}/lib/pintuer/js/admin.js"></script>
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
                    <a href="#" class="icon-home">开始</a>
                    <ul>
                        <li><a href="${basePath}/manage">系统</a></li>
                        <li><a href="${basePath}/manage/movie">电影管理</a></li>
                        <li class="active"><a href="${basePath}/manage/evaluate">算法评估</a></li>
                    </ul>
                </li>
            </ul>
        </div>
        <div class="admin-bread">
            <span>您好，${userInfo.username}，欢迎您的光临。</span>
            <ul class="bread">
                <li><a href="${basePath}/manage" class="icon-home"> 开始</a></li>
                <li>算法评估</li>
            </ul>
        </div>
    </div>
</div>

<div class="admin">
    <div class="line-big">
        <div class="xm1-move">
            <div class="panel">
                <div class="panel-head"><strong>算法评估</strong></div>
                <table class="table">
                    <tr>
                        <th colspan="2"></th>
                        <th colspan="2"></th>
                    </tr>
                    <tr>
                        <td width="15%" align="right">中文名：</td>
                        <td>平均差值</td>
                        <td width="40%" align="right">English name:</td>
                        <td>AverageAbsoluteDifferenceRecommenderEvaluator</td>
                    </tr>
                    <tr>
                        <td align="right">待评估的数据集/总数据集：</td>
                        <td>100%</td>
                        <td align="right">训练数据集/评估数据集：</td>
                        <td>70%</td>
                    </tr>
                    <tr>
                        <td align="right">得分：</td>
                        <td></td>
                        <td class="text-center text-big text-red">0.8839017169343092</td>
                        <td></td>
                    </tr>
                    <tr>
                        <td width="15%" align="right">中文名：</td>
                        <td>均方根</td>
                        <td width="40%" align="right">English name:</td>
                        <td>RMSRecommenderEvaluator</td>
                    </tr>
                    <tr>
                        <td align="right">待评估的数据集/总数据集：</td>
                        <td>100%</td>
                        <td align="right">训练数据集/评估数据集：</td>
                        <td>70%</td>
                    </tr>
                    <tr>
                        <td align="right">得分：</td>
                        <td></td>
                        <td class="text-center text-big text-red">1.1799277421455787</td>
                        <td></td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
    <p class="text-right text-gray">基于<a class="text-gray" target="_blank" href="http://www.pintuer.com">拼图前端框架</a>构建
    </p>
    <br/>
</div>
</body>

</html>