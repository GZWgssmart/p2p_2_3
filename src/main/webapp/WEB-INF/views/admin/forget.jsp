<%--
  Created by IntelliJ IDEA.
  User: Animo
  Date: 2017-12-21
  Time: 8:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<html>
<head>
    <title>修改密码——p2p</title>
    <link rel="stylesheet" href="<%=path%>/static/css/style.css"/>
</head>
<body class="body_bj">
<div class="login">
    <div class="logo">
        忘记密码
    </div>
    <ul class="login-list">
        <li><input type="text" name="phone" placeholder="请输入手机号码"></li>
        <li><input type="text" placeholder="请输入验证码"><span class="yzm2"><img src="<%=path%>/static/images/login/yzm.jpg" alt=""></span></li>
        <li><input type="text" placeholder="请输入短信验证码"><span class="yzm" >获取验证码</span><span class="yzm gray" style="display: none;">重新获取(58s)</span></li>
        <li><input type="password" placeholder="请输入新密码"></li>
        <li><input type="password" placeholder="请确认新密码"></li>
        <li><a class="btn" href="#">确定并登录</a></li>
    </ul>
</div>
</body>
</html>
