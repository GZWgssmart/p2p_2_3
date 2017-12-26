<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>注册-P2P理财平台</title>
    <link rel="stylesheet" href="<%=path%>/static/css/user/public.css"/>
    <link rel="stylesheet" href="<%=path%>/static/css/user/login.css">
</head>
<link rel="icon" href="<%=path%>/static/images/login/logo_title.jpg" type="image/x-icon" />
<body>
<div class="nav-out">
    <div class="wrap cl">
        <div class="logo"><a href="https://www.pujinziben.com/"><img src="<%=path%>/static/images/login/logopu.png" alt=""></a></div>
        <p class="to-login">已有账号，<a href="<%=path%>/user/login">立即登录</a></p>
    </div>
</div>
<div class="regist-content">
    <div class="regist-exp">
        <p>普金资本理财资金由汇付天下托管</p>
    </div>
    <div class="regist-box">
        <form id="register" method="post">
            <h3>欢迎注册</h3>
            <p class="error-msg icon icon-error"></p>
            <div class="from">
                <label for="phone" class="icon icon-mobile"></label>
                <input type="text" name="phone" id="phone"  onblur="checkPhone(this)" autocomplete="new-password" maxlength="11" placeholder="输入手机号"/>
            </div>
            <div class="from">
                <label for="upwd" class="icon icon-pwd"></label>
                <input type="password" name="upwd" id="upwd" autocomplete="new-password" placeholder="输入密码" maxlength="18"/>
            </div>
            <!--<div class="from from-msg">
                <label for="msgcode" class="icon icon-msg"></label>
                <input type="text" name="" id="msgcode" maxlength="6" placeholder="输入短信验证码"/>
                <div class="msg-btn">
                    <button type="button" id="getMsgCode">获取验证码</button>
                </div>
            </div>-->
            <div class="from-text">
                <p class="code icon icon-bottom">推荐码(选填)</p>
            </div>
            <div class="from from-ext">
                <label for="useCode" class="icon icon-ext"></label>
                <input type="text" name="" id="useCode" placeholder="输入邀请码"/>
            </div>
            <button class="btn" type="button" onclick="register();">注册</button>
            <div class="agree"><input type="checkbox" id="agree">我已阅读并同意《<a href="javascript:AgreeMent(0);">普金资本服务协议</a>》和《<a href="javascript:AgreeMent(1);">风险提示书</a>》</div>
        </form>
    </div>
</div>

<!--<div class="popup claimm-from" style="height: 350px;top: 20%;left: 35%;">
    <p class="title left">输入验证码获取短信</p>
    <a href="javascript:void(0);" class="close icon icon-close"></a>
    <div class="popup-from">
        <center>
            <img id="imgCode" title="点击换个验证码" src="imageCode.do?pageId=reg" width="120px" style="clear: both;" onClick="getCode()">
        </center>
        <div class="label cl">
            <label class="long">验证码：</label><input type="text" autocomplete="off" maxlength="16"  id="claimm-price" placeholder="输入图形验证码"/>
        </div>
    </div>
    <center>
        <button type="button" class="btn" style="width: 30%;margin:30px;" id="claimm-submit">确定</button>
    </center>
</div>-->

<div id="popup-captcha"></div>
<div class="popup AgreeMent">
    <p class="title left">普金资本服务协议</p>
    <a href="javascript:void(0);" class="close icon icon-close"></a>
    <div class="popup-area">

    </div>
</div>
<div class="login-footer">
    <p>版权所有 © 普金资本运营（赣州）有限公司 All rights reserved 备案确认书：赣ICP备16004010号</p>
</div>
<script type="text/javascript" src="<%=path%>/static/js/user/jquery.js"></script>
<script type="text/javascript" src="<%=path%>/static/js/user/public.js"></script>
<script src="<%=path%>/static/js/user/gt.js"></script>
<script type="text/javascript" src="<%=path%>/static/js/user/register.js"></script>
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
</script>
<script>
    function checkPhone(phone) {
        var phone = $("#phone").val();
        if(phone == ''){
            showError('请输入手机号码',$(phone));
            return;
        }else if(phone.length != 11){
            showError('请输入正确手机号',$(phone));
            return;
        };
        $.post( '/user/data/json/getByPhone/'+phone,
            function (data) {
                if (data.message === 'success') {

                } else {
                    showError('该手机号已存在',$(phone));
                    return;
                }
            },
            'json'
        );
    };
    function register() {
        var phone = $("#phone").val();
        var upwd = $("#upwd").val();
        if(phone==''){
            showError('请输入手机号',$('#phone'));
            return;
        };
        if(upwd==''){
            showError('请输入登录密码',$('#upwd'));
            return;
        };
        $.post( '/user/data/json/register',
            $("#register").serialize(),
            function (data) {
                if (data.message === 'success') {
                    window.location.href = "/user/login";
                } else {
                    showError('注册失败','error');
                }
            },
            'json'
        );
    };


</script>
</body>
</html>