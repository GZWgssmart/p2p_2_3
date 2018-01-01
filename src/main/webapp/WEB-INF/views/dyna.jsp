<%--
  Created by IntelliJ IDEA.
  User: Animo
  Date: 2017-12-25
  Time: 19:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>普金资本-安全可靠专注于供应链金融的国资背景P2P理财平台</title>
    <meta name="keywords" content="普金资本，互联网金融，P2P理财，供应链金融，网络贷款，银行存管"/>
    <meta name="description"
          content="普金资本是目前国内拥有国资系背景的P2P理财平台，为P2P网贷和理财用户提供安全、高效的互联网金融理财服务。普金资本，以“国资系、可信赖”的企业理念，为理财用户提供安全稳定的网上理财通道，快速实现资金周转，实现财富稳定增长。"/>
    <link rel="stylesheet" href="<%=path%>/static/css/index/public.css">
    <link rel="stylesheet" href="<%=path%>/static/css/index/index.css">
    <link rel="stylesheet" href="<%=path%>/static/layui/css/layui.css">
    <link rel="stylesheet" href="/static/dynajs/css/public.css">
    <link rel="stylesheet" href="/static/dynajs/css/about.css">
</head>
<link rel="icon" href="" type="image/x-icon"/>
<body>
<%@include file="common/top.jsp"%>

<div class="about cl">
    <div class="about-left">
        <div class="about-left-nav">
            <div id="animateDiv" class="animateDiv">
                <ul id="animateUl" class="sub-nav">
                    <li class="xxpl" class="active"><a href="javaScript:void(0);" onClick="animate1()" class="icon-about about-xxpl">信息披露</a></li>
                </ul>
            </div>
            <ul class="sub-nav">
                <li><div class="hr"></div></li>
                <li id="gd"><a href="#gdbj" class="icon-about about-gudong">股东背景</a></li>
                <li><a href="#gsjj" class="icon-about about-jianjie">公司简介</a></li>
                <li><a href="#ptzz" class="icon-about about-zizhi">平台资质</a></li>
                <!-- <li><a href="#gltd" class="icon-about about-guanli">管理团队</a></li> -->
                <li><a href="#gwtd" class="icon-about about-guwen">顾问团队</a></li>
                <li><a onclick="menuClick('/list');"  class="icon-about">公司动态</a></li>
                <li><a href="#ptgg" class="icon-about about-gonggao">平台公告</a></li>
                <li><a href="#zxns" class="icon-about about-zhaopin">招贤纳士</a></li>
                <li><a href="#lxwm" class="icon-about about-lianxi">联系我们</a></li>
            </ul>
        </div>
    </div>
    <!-- begin -->
    <div class="about-right">

    <div  id="panel"></div>
    </div>
    <!-- end -->
</div>
<div id="ajaxFooter"></div>
<!--[if lt IE 9]>
<script src="/static/dynajs/json2.js"></script>
<![endif]-->
<script type="text/javascript" src="/static/dynajs/jquery.js"></script>
<script type="text/javascript" src="/static/dynajs/public.js"></script>
<!-- 客服QQ -->
<script charset="utf-8" type="text/javascript" src="/static/dynajs/wpa.js"></script>
<script type="text/javascript" src="/static/dynajs/countup.min.js"></script>
<script type="text/javascript" src="/static/dynajs/about.js"></script>
<script>
    function menuClick(url) {
        $("#panel").load('${pageContext.request.contextPath}'+url);
    }
</script>
</body>
</html>
