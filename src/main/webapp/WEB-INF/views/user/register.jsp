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
<div id="app">
    <input value="${requestScope.code}" hidden id="code"/>
<div class="nav-out">
    <div class="wrap cl">
        <div class="logo"><a href="<%=path%>/"><img src="<%=path%>/static/images/login/logopu.png" alt=""></a></div>
        <p class="to-login">已有账号，<a href="<%=path%>/user/login">立即登录</a></p>
    </div>
</div>
<div class="regist-content">
    <div class="regist-exp">
        <p>普金资本理财资金由汇付天下托管</p>
    </div>
    <div class="regist-box">
        <form id="register">
            <h3>欢迎注册</h3>
            <p class="error-msg icon icon-error"></p>
            <div class="from">
                <label  class="icon icon-mobile"></label>
                <input type="text" v-model.lazy="phone"  id="phone"  autocomplete="new-password" maxlength="11" placeholder="输入手机号"/>
            </div>
            <div class="from">
                <label class="icon icon-pwd"></label>
                <input type="password" v-model="user.upwd" id="upwd"  autocomplete="new-password" placeholder="输入密码" maxlength="18"/>
            </div>
            <div class="from-text">
                <p class="code icon icon-bottom">推荐码(选填)</p>
            </div>
            <div class="from from-ext">
                <label for="useCode" class="icon icon-ext"></label>
                <input type="text" v-model="user.resstr2" id="useCode" placeholder="输入邀请码"/>
            </div>
            <button class="btn" type="button" @click="register">注册</button>
            <div class="agree"><input type="checkbox" id="agree">我已阅读并同意《<a href="javascript:AgreeMent(0);">普金资本服务协议</a>》和《<a href="javascript:AgreeMent(1);">风险提示书</a>》</div>
        </form>
    </div>
</div>

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
</div>
<script type="text/javascript" src="<%=path%>/static/js/user/jquery.js"></script>
<script type="text/javascript" src="<%=path%>/static/js/vue.min.js"></script>
<script type="text/javascript" src="<%=path%>/static/js/qs.js"></script>
<script type="text/javascript" src="<%=path%>/static/js/axios.min.js"></script>
<script type="text/javascript" src="<%=path%>/static/js/user/public.js"></script>
<script src="<%=path%>/static/js/user/gt.js"></script>
<script type="text/javascript" src="<%=path%>/static/js/user/register.js"></script>
<script>

    function showError(msg,obj){
            $('.error-msg').text(msg).addClass('show');
            obj.parent('.from').addClass('error');
            obj.focus(function(){
            obj.parent('.from').removeClass('error');
            $('.error-msg').removeClass('show');
        });
    }

    new Vue({
        el:'#app',
        data:{
            phone:'',
            user:{
                phone:'',
                upwd:'',
                resstr2:''
            }
        },
        created (){
            this.user.resstr2 = $("#code").val();
        },
        methods:{
            register () {
                if(this.phone==''){
                    showError('请输入手机号',$('#phone'));
                    return;
                };
                if(this.user.upwd==''){
                    showError('请输入登录密码',$('#upwd'));
                    return;
                };
                if(!$('#agree').is(':checked')){
                    showError('请勾选服务协议', $('#agree'));
                    return;
                };
                if($('#code').val()!=null){
                    this.user.resstr2 = $('#code').val();
                }
                this.user.phone = this.phone;
                axios.post('/user/data/json/register', Qs.stringify(this.user)).then((response) => {
                    if(response.data.code==1){
                        return showError('注册失败','error');
                    }
                    window.location.href = "/user/login";
                }, (error) => {

                });
            }
        },
        watch: {
            phone (val){
                if(val==''){
                    showError('请输入手机号码',$("#phone"));
                    return;
                }else if(val.length != 11){
                    showError('请输入正确手机号',$("#phone"));
                    return;
                };
                axios.get('/user/data/json/getByPhone/'+this.phone).then((response)=>{
                    if(response.data.code==1){
                        showError('该手机号已存在',$("#phone"));
                    }
                },(error)=>{});
            }
        }
    });
</script>
</body>
</html>