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
<!DOCTYPE html>
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
    <p class="error-msg icon icon-error"></p>
    <form id="adminLogin" method="post">
        <div class="from">
            <li><input type="text" id="phone" name="phone" placeholder="请输入手机号码" onblur="checkPhone(this);"></li>
        </div>
        <div class="from">
            <li><input type="password" id="pwd" name="pwd" placeholder="请输入密码"></li>
        </div>
        <div class="from">
            <li><input type="text" name="code" id="code" placeholder="请输入验证码">
            <span class="yzm2"><img src="<%=path %>/code" onclick="this.src='<%=path %>/code?r=' + Math.random();"/></span>
            </li>
        </div>
    <li><input type="button" class="btn" onclick="login();" value="登录"></li>
    </form>
</ul>
</div>
<script src="<%=path%>/static/js/jquery.min.js"></script>
<script>
    //错误提示
    function showError(msg,obj){
        $('.error-msg').text(msg).addClass('show');
        obj.parent('.from').addClass('error');
        obj.focus(function(){
            obj.parent('.from').removeClass('error');
            $('.error-msg').removeClass('show');
        });
    }

    function checkPhone(phone) {
        var phone = $("#phone").val();
        if(phone == ''){
            showError('请输入手机号码',$("#phone"));
            return;
        }else if(phone.length != 11){
            showError('请输入正确手机号',$("#phone"));
            return;
        }else{

        }
    }
</script>
<script>
    function login(){
        var phone = $("#phone").val();
        var pwd = $("#pwd").val();
        var code = $("#code").val();
        if(phone==''){
            showError('请输入手机号',$("#phone"));
            return;
        }else if(phone.length != 11){
            showError('请输入正确手机号',$("#phone"));
            return;
        };
        if(pwd==''){
            showError('请输入登录密码',$("#pwd"));
            return;
        };
        if(code==''){
            showError('请输入验证码',$("#code"));
            return;
        };
        $.post('/admin/data/json/login',
            $("#adminLogin").serialize(),
            function (data) {
                if (data.message === 'success') {
                    window.location.href = "/back/admin/home";
                } else {
                    showError(data.message, $("#phone"));
                }
            },
            'json'
        );
    }
</script>
</body>
</html>
