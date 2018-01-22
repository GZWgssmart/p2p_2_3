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
<div id="app1">
<div class="wrap">
    <div class="top-left icon icon-phone">
        <span>客服热线：</span>400-606-2079 <span>（8:30～17:30）</span>
    </div>
    <div class="top-right cl">
        <ul class="top-list">
            <li><a href="">关于我们</a></li>
            <li><a href="">帮助中心</a></li>
            <c:if test="${sessionScope.user == null}">
                    <li id="userName">
                        <a href="/user/login">登录</a>
                    </li>
                    <li>
                        <a href="/user/register">注册</a>
                    </li>
            </c:if>
            <c:if test="${sessionScope.user != null}">
                <li>
                    <a href="/user/accountOverride" style="color:red">${sessionScope.user.uname }</a>
                </li>
                <li>
                    <a href="javaScript:;" @click="logout"  style="color:red">退出</a>
                </li>
            </c:if>
        </ul>
    </div>
</div>

</div>
<!-- nav -->
<div class="nav" style="height: 140px;">
    <div class="wrap cl">
        <div class="logo"><a href="/"><img src="/static/images/index/logo.png" alt="普金资本"></a></div>
        <div class="nav-bar">
            <ul>
                <c:if test="${sessionScope.user == null}">
                    <li class="icon icon-acc"><a href="/user/login">我的账户</a></li>
                </c:if>
                <c:if test="${sessionScope.user != null}">
                <li class="icon icon-acc"><a href="/user/accountOverride">我的账户</a></li>
                </c:if>
                <li><a href="/back/font/information">信息披露 </a></li>
                <li><a href="/back/font/security">安全保障</a></li>
                <li id="touzilicai">
                    <a href="/borrowapply/add">申请借款</a>
                </li>
                <li id="tickets">
                    <a href="/ticket/pager">优惠券</a>
                </li>
                <li>
                    <a href="/borrowapply/all/2">投资理财</a>
                </li>
            </ul>
        </div>
    </div>
</div>
<div>
</div>
</body>
<script src="/static/js/jquery.min.js"></script>
<script src="/static/js/vue.min.js"></script>
<script src="/static/js/axios.min.js"></script>
<script>
    new Vue({
       el:'#app1',
        methods:{
           logout(){
               axios.get('/user/data/json/logout').then((response) => {
                   if(response.data.code==0){
                       return window.location.href='/';
                   }
                   alert(response.data.message);
               }, (error) => {

               });
           }
        }
    });
</script>
</html>
