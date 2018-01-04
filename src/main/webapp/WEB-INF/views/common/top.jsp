<%--
  Created by IntelliJ IDEA.
  User: Animo
  Date: 2017-12-26
  Time: 12:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div class="wrap">
    <div class="top-left icon icon-phone">
        <span>客服热线：</span>400-606-2079 <span>（8:30～17:30）</span>
    </div>
    <div class="top-right cl">
        <ul class="top-list">
            <li class="first"><a href="" class="icon icon-person">注册领红包</a></li>
            <li><a href="" class="icon icon-inv">邀请有礼</a></li>
            <li><a href="">关于我们</a></li>
            <li><a href="">帮助中心</a></li>
            <li></li>
            <li id="userName">
                <c:if test="${sessionScope.user == null}">
                    <a href="/user/login">登录</a>
                </c:if>
                <c:if test="${sessionScope.user != null}">
                    <a href="#" style="color:red">${sessionScope.user.phone }</a>
                </c:if>
                    <%--<a href="user/login">登录</a>--%>
            </li>
            <li><a href="javascript:;" class="icon icon-app" id="">APP下载</a></li>
        </ul>
        <div id="qrCodeDiv" style="display: none;">
            <div class="CodeDiv">
                <img src="">
                <p>IOS下载</p>
            </div>
            <div class="CodeDiv">
                <img src="">
                <p>Android下载</p>
            </div>
        </div>
    </div>
</div>

</div>
<!-- nav -->
<div class="nav" style="height: 140px;">
    <div class="wrap cl">
        <div class="logo"><img src="http://pujinziben.com/resources/front/v01/src/images/logo.png" alt="普金资本"></div>
        <div class="nav-bar">
            <ul>
                <c:if test="${sessionScope.user == null}">
                    <li class="icon icon-acc"><a href="/user/login">我的账户</a></li>
                </c:if>
                <c:if test="${sessionScope.user != null}">
                <li class="icon icon-acc"><a href="/user/accountOverride">我的账户</a></li
                </c:if>
                <!-- <li><a href="javascript:void(0);">信息披露</a></li> -->
                <li><a href="about.html">信息披露 </a></li>
                <!-- <li><a href="javascript:void(0);" onclick="newPointer()">新手指导</a></li> -->
                <li><a href="safety.html">安全保障</a></li>
                <li>
                    <a href="investlist.html">投资理财</a>
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
</div>
</body>
</html>
