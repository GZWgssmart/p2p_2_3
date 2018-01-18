<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>登录-P2P理财平台</title>
    <link rel="stylesheet" href="<%=path%>/static/css/user/public.css">
    <link rel="stylesheet" href="<%=path%>/static/css/user/login.css">
</head>
<link rel="icon" href="<%=path%>/static/images/login/logo_title.jpg" type="image/x-icon" />
<body>
<div class="nav-out">
    <div class="wrap cl">
        <div class="logo"><a href="<%=path%>/"><img src="<%=path%>/static/images/login/logopu.png" alt=""></a></div>
        <p class="index"><a href="<%=path%>/" class="icon icon-home">普金资本首页</a></p>
    </div>
</div>
<div class="login-content">
    <div class="wrap">
        <div class="login-box">
            <div class="login-top cl">
                <p class="welcome">欢迎登录</p>
                <p>没有账户，<a href="<%=path%>/user/register">免费注册</a></p>
            </div>
            <form id="login" method="post">
            <p class="error-msg icon icon-error"></p>
                <div class="from">
                    <label for="phone" class="icon icon-user"></label>
                    <input type="text" name="phone" id="phone" autocomplete="off" onblur="checkPhone(this);" placeholder="输入手机号"/>
                </div>
            <div class="from">
                <label for="upwd" class="icon icon-pwd"></label>
                <input type="password" name="upwd"  id="upwd" autocomplete="new-password" placeholder="输入登录密码"/>
            </div>
            <div class="from">
                <div class="pull-box" id="slide">
                    <div class="pull-bg" style="width: 0px;"></div>
                    <div class="pull-default">请按住滑块，拖动到最右边</div>
                    <div class="pull-btn"></div>
                </div>
            </div>
            <button class="btn"  type="button" onclick="login();">登录</button>
            <div class="forget">
                <a href="#">忘记密码</a>
            </div>
            </form>
        </div>

    </div>
</div>
<div class="login-footer">
    <p>版权所有 © 普金资本运营（赣州）有限公司 All rights reserved 备案确认书：赣ICP备16004010号</p>
</div>
<script type="text/javascript" src="<%=path%>/static/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=path%>/static/js/user/jquery.js"></script>
<script type="text/javascript" src="<%=path%>/static/js/user/public.js"></script>
<script type="text/javascript" src="<%=path%>/static/js/user/login.js"></script>
<script>
    //错误提示
    function showError(msg,obj){
        $('.error-msg').text(msg).addClass('show');
        obj.parent('.from').addClass('error');
        obj.focus(function(){
            obj.parent('.from').removeClass('error');
            $('.error-msg').removeClass('show');
        });
        /*obj.onfocus = function () {
            obj.parent('.from').removeClass('error');
            $('.error-msg').removeClass('show');
        }*/

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
    function login() {
        var phone = $("#phone").val();
        var upwd = $("#upwd").val();
        var slide = $("#slide").val();
        if(phone==''){
            showError('请输入手机号',$("#phone"));
            return;
        }else if(phone.length != 11){
            showError('请输入正确手机号',$("#phone"));
            return;
        }else if(!pullTest){
            showError('请拖动验证码到正确位置', $("#slide"));
            return;
        };
        if(upwd==''){
            showError('请输入登录密码',$("#upwd"));
            return;
        };
        $.post('/user/data/json/login',
            $("#login").serialize(),
            function (data) {
                if (data.message === 'success') {
                    window.location.href = "/user/accountOverride";
                } else {
                    showError("账号或密码错误", $("#phone"));
                }
            },
            'json'
        );
    }
</script>
</body>
</html>