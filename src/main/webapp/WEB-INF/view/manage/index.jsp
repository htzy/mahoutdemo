<%--
  Created by IntelliJ IDEA.
  User: root
  Date: 9/28/16
  Time: 6:32 AM
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
                        <li class="active"><a href="${basePath}/manage">系统</a></li>
                        <li><a href="${basePath}/manage/movie">电影管理</a></li>
                        <li><a href="${basePath}/manage/evaluate">算法评估</a></li>
                    </ul>
                </li>
            </ul>
        </div>
        <div class="admin-bread">
            <span>您好，${userInfo.username}，欢迎您的光临。</span>
            <ul class="bread">
                <li><a href="${basePath}/manage" class="icon-home"> 开始</a></li>
                <li>后台首页</li>
            </ul>
        </div>
    </div>
</div>

<div class="admin">
    <div class="line-big">
        <div class="xm3">
            <div class="panel border-back">
                <div class="panel-body text-center">
                    <img src="http://oeerwig1e.bkt.clouddn.com/face.png" width="120" class="radius-circle"/>
                    <br/> admin
                </div>
                <div class="panel-foot bg-back border-back">您好，${userInfo.username}。</div>
            </div>
            <br/>

            <div class="panel">
                <div class="panel-head"><strong>数据统计</strong></div>
                <ul class="list-group">
                    <li><span class="float-right badge bg-red">6040</span><span class="icon-user"></span>会员</li>
                    <li><span class="float-right badge bg-main">3883</span><span class="icon-file-text"></span> 电影</li>
                    <li><span class="float-right badge bg-main">24M</span><span class="icon-database"></span>数据库</li>
                </ul>
            </div>
            <br/>
        </div>
        <div class="xm9">
            <div class="alert alert-yellow"><span class="close"></span><strong>注意：</strong>请注意流量消耗！
                <a href="https://www.aliyun.com/?utm_medium=text&utm_source=bdbrand&utm_campaign=bdbrand&utm_content=se_32492">点击查看</a>。
            </div>
            <div class="alert">
                <h4>主要技术及框架</h4>
                <p class="text-gray padding-top">JFinal、Bootstrap、Pintuer、Mahout、Git、Maven、MySQL</p>
                <a target="_blank" class="button bg-dot icon-code" href="https://github.com/htzy/mahoutdemo">github</a>
                <a target="_blank" class="button border-main icon-file" href="http://www.jfinal.com/">JFinal</a>
                <a target="_blank" class="button border-main icon-file" href="http://getbootstrap.com">Bootstrap</a>
                <a target="_blank" class="button border-main icon-file" href="http://www.pintuer.com/">Pintuer</a>
                <a target="_blank" class="button border-main icon-file" href="http://mahout.apache.org/">Mahout</a>
            </div>
            <div class="panel">
                <div class="panel-head"><strong>系统信息</strong></div>
                <table class="table">
                    <tr>
                        <th colspan="2">服务器信息</th>
                        <th colspan="2">系统信息</th>
                    </tr>
                    <tr>
                        <td width="110" align="right">操作系统：</td>
                        <td>Ubuntu 14</td>
                        <td width="90" align="right">系统开发：</td>
                        <td><a href="http://www.jfinal.com/" target="_blank">JFinal框架</a></td>
                    </tr>
                    <tr>
                        <td align="right">Web服务器：</td>
                        <td>Tomcat</td>
                        <td align="right">主页：</td>
                        <td><a href="http://www.huangshihe.com" target="_blank">http://www.huangshihe.com</a></td>
                    </tr>
                    <tr>
                        <td align="right">程序语言：</td>
                        <td>java</td>
                        <td align="right">推荐技术：</td>
                        <td><a href="http://mahout.apache.org/" target="_blank">mahout</a></td>
                    </tr>
                    <tr>
                        <td align="right">数据库：</td>
                        <td>MySQL</td>
                        <td align="right">推荐算法：</td>
                        <td>基于用户的协同过滤算法</td>
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