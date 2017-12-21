<%--
  Created by IntelliJ IDEA.
  User: Animo
  Date: 2017-12-21
  Time: 8:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<html>
<head>
    <title>后台登录——p2p</title>
    <link rel="stylesheet" href="<%=path%>/static/css/style.css"/>
</head>
<body class="body_bj">
<div class="login">
<div class="logo">
    <img src="<%=path%>/static/images/login/logo.png" alt="">
</div>
<ul class="login-list">
    <li><input type="text" name="phone" placeholder="请输入手机号码"></li>
    <li><input type="password" name="pwd" placeholder="请输入密码"></li>
    <li><input type="text" placeholder="请输入验证码"><span class="yzm2"><img src="<%=path%>/static/images/login/yzm.jpg" alt=""></span></li>
    <li><a class="btn" href="">登录</a></li>
    <li class="tar"><a href="">忘记密码？</a></li>
</ul>
</div>
</body>
</html>
