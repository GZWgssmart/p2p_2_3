<%--
  Created by IntelliJ IDEA.
  User: CHEN JX
  Date: 2018/1/10
  Time: 9:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>我要投资-普金资本-安全可靠专注于供应链金融的国资背景P2P理财平台</title>
    <link rel="stylesheet" href="/static/css/index/public.css">
    <link rel="stylesheet" href="/static/css/index/index.css">
</head>
<link rel="icon" href="resources/front/v01/src/images/logo_title.jpg" type="image/x-icon" />
<body >

<%--<div class="top" id="top">
</div>
<!-- nav -->
<div class="nav">
    <div class="wrap cl">
        <div class="logo"><a href="/index"><img src="/static/images/index/logo.png" alt="普金资本"></a></div>
        <div class="nav-bar">
            <ul>
                <li class="icon icon-acc"><a href="account.html">我的账户</a></li>
                <!-- <li><a href="javascript:void(0);">信息披露</a></li> -->
                <li><a href="/back/font/information">信息披露</a></li>
                <!-- <li><a href="javascript:void(0);" onclick="newPointer()">新手指导</a></li> -->
                <li><a href="/back/font/security">安全保障</a></li>
                <li class="active">
                    <a href="/back/font/investment  ">投资理财</a>
                    <div class="sub-nav">
                        <a href="investlist.html#006">恒金保</a>
                        <a href="investlist.html#004">普金保</a>
                        <a href="investlist.html#003">多金宝</a>
                        <a href="investlist.html#005">新手标</a>
                        <a href="creditorlist.html">债权转让</a>
                        <p class="left"></p>
                        <p class="right"></p>
                    </div>
                </li>
                <li><a href="/index">首页</a></li>
            </ul>
        </div>
    </div>
</div>--%>
<!-- invest list -->

<%@include file="../common/top.jsp"%>
<div class="invest-list">
    <div class="wrap">
        <div class="invest-top">
            <div class="invest-top-left">
                <div class="invest-top-list">
                    <p>项目期限：</p>
                    <ul class="cl">
                        <li class="active"><a href="#0">全部</a></li>
                        <li><a href="#1">1-3个月</a></li>
                        <li><a href="#2">3-6个月</a></li>
                        <li><a href="#3">6-9个月</a></li>
                        <li><a href="#4">大于9个月</a></li>
                    </ul>
                </div>
                <div class="invest-top-list">
                    <p>年化收益：</p>
                    <ul>
                        <li class="active"><a href="#00">全部</a></li>
                        <li><a href="#01"><=10%</a></li>
                        <li><a href="#02">10%-15%</a></li>
                        <li><a href="#03">15%-25%</a></li>
                    </ul>
                </div>
                <div class="invest-top-list">
                    <p>项目类型：</p>
                    <ul>
                        <li class="active"><a href="#000">全部</a></li>
                        <li><a href="#003">多金宝</a></li>
                        <li><a href="#004">普金保</a></li>
                        <li><a href="#006">恒金保</a></li>
                        <li><a href="#005">新手标</a></li>
                        <li><a href="creditorlist.html">债权转让</a></li>
                    </ul>
                </div>
            </div>
            <div class="invest-top-right">
                <div class="invest-top-list">
                    <div class="textmiddle">借款标题</div>
                    <input type="text" class="text" id="claimm-can-title"/>
                    <button type="button" class="search" id="claimm-can-Search">搜索</button>
                </div>
            </div>
        </div>
        <div class="invest-list-bottom">
            <ul class="invest-row listData" >
            </ul>
            <ul class="paging cl"></ul>
        </div>
    </div>
</div>
<%@include file="../common/footer.jsp"%>
<!--[if lt IE 9]>
<script src="/static/js/font/json2.js"></script>
<![endif]-->
<script type="text/javascript" src="/statoc/js/font/jquery.js"></script>
<script type="text/javascript" src="/static/js/font/public.js"></script>
<!-- 客服QQ -->
<script charset="utf-8" type="text/javascript" src="/static/js/font/wpa.js"></script>
<script type="text/javascript" src="/static/js/font/invest_list.js"></script>
</body>
</html>