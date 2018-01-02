<%--
  Created by IntelliJ IDEA.
  User: qm
  Date: 2017/12/27
  Time: 20:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% String path = request.getContextPath();%>
<html>
<head>
    <meta charset="UTF-8">
    <title>我的账户—普金资本-安全可靠专注于供应链金融的国资背景P2P理财平台</title>
    <link rel="stylesheet" href="<%=path%>/static/css/user/public.css">
    <link rel="stylesheet" href="<%=path%>/static/css/user/account.css">
    <link rel="stylesheet" href="<%=path%>/static/css/user/datepicker.css">
</head>
<link rel="icon" href="<%=path%>/static/images/index/logo_title.jpg" type="image/x-icon"/>
<body onhashchange="hashChange()">
<!-- top -->
<div class="top" id="top">
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
                <li id="userName"><a href="">登录</a></li>
                <li><a href="javascript:;" class="icon icon-app" id="app">APP下载</a></li>
            </ul>
        </div>
    </div>
</div>
<!-- nav -->
<div class="nav">
    <div class="wrap cl">
        <div class="logo"><a href=""><img src="<%=path%>/static/images/login/logopu.png" alt="普金资本"></a></div>
        <div class="nav-bar">
            <ul>
                <li class="icon icon-acc"><a href="javascript:void(0);">我的账户</a></li>
                <li><a href="">信息披露</a></li>
                <li><a href="">安全保障</a></li>
                <li>
                    <a href="">投资理财</a>
                    <div class="sub-nav">
                        <a href="">恒金保</a>
                        <a href="">普金保</a>
                        <a href="">多金宝</a>
                        <a href="">新手标</a>
                        <a href="">债权转让</a>
                        <p class="left"></p>
                        <p class="right"></p>
                    </div>
                </li>
                <li><a href="">首页</a></li>
            </ul>
        </div>
    </div>
</div>
<div class="account cl">
    <div class="account-left">
        <div class="account-left-nav">
            <div class="navbar icon icon-account">我的账户</div>
            <ul class="sub-nav">
                <li class=""><a href="#account">账户总览</a></li>
                <li><a href="#ipay">充值</a></li>
                <li><a href="#cash">提现</a></li>

                <li><a id="myCoupon" href="#taste">我的赠券<i id="couponCount"></i></a></li>

                <li><a href="#fund">资金记录</a></li>
            </ul>
            <div class="navbar icon icon-self">我的管理</div>
            <ul class="sub-nav">
                <li><a href="#invest">投资管理</a></li>
                <li><a href="#claimm">债权管理</a></li>
                <li><a href="#claimb">债权购买</a></li>
                <li><a href="#loan">借款管理</a></li>
            </ul>
            <div class="navbar icon icon-settings">账户设置</div>
            <ul class="sub-nav">
                <li><a href="#bank">我的银行卡</a></li>
                <li><a href="#safe">安全设置</a></li>
                <li><a href="#msg">消息中心</a></li>
            </ul>
        </div>
        <a href="#tuijian" class="tuijian"><img src="<%=path%>/static/images/home/tuijian.png"/></a>
    </div>

    <div class="account-right">
        <div class="account-right-nav">
            <div class="sub-a-nav">
                <a href="javascript:void(0);" class="active">我的银行卡</a>
            </div>
            <em></em>
        </div>

        <div id="myDebitCard" class="account-content">
            <div id="card1" class="bank-card_1">
                <div class="bank-top">
                    <div class="bank-cardTitle">建设银行</div>
                    <div class="bank-cardType">储蓄卡</div>
                </div>
                <div class="bank-center">
                    <div class="bank-cardNumber">6212 **** **** 4699</div>
                    <div class="bank-userName">${sessionScope.User.rname}</div>
                </div>
            </div>
            <div id="card3" class="bank-card_3" v-on:click="addCard" style="cursor:pointer;">
                <div class="bank-addCard"><a href="javascript:;">添加银行卡</a></div>
            </div>
        </div>
    </div>

</div>



<div id="ajaxFooter">
    <div class="mod-sidebar">
        <ul>
            <li><a target="_blank" href="" class="sidebar-qq"></a></li>
            <li><a href="javascript:;" class="sidebar-wx"></a></li>
            <li><a href="" class="sidebar-cl"></a></li>
            <li><a href="javascript:;" class="wenquan" title="填写即送5元代金券"></a></li>
            <li><a href="javascript:;" class="sidebar-top"></a></li>
        </ul>
    </div>
    <div class="index-concat">
        <div class="wrap cl">
            <div class="index-concat-left">

            </div>
            <div class="index-concat-phone">
                <p>财富热线</p>
                <h3>400-606-2079</h3>
            </div>
            <div class="index-concat-channel">
                <p class="about_cel_text">
                    <a target="_blank" href="" class="about_wb"></a>
                    <a href="javascript:void(0);" class="about_wx line_02">
						<span class="line_l_h">
							<span class="line_l_sj"></span>
							<span class="line_l_text">关注普金资本公众号</span>
							<span class="line_l_pic"></span>
						</span>
                    </a>
                    <a target="_blank" href="" class="about_qq"></a>
                    <a href="javascript:void(0);" class="about_wx about_rr">
						<span class="line_l_j">
							<span class="line_l_sj"></span>
							<span class="line_l_texts">400-606-2079</span>
						</span>
                    </a>
                </p>
                <p class="about_cel_no">admin@pujinziben.com</p>
            </div>
            <div class="index-concat-link cl">
                <a href="javascript:;" class="title">友情链接</a>
                <a target="_blank" href="">网贷天眼</a>
                <a target="_blank" href="">网贷天下</a>
                <a target="_blank" href="">中国平安银行</a>
                <a target="_blank" href="">中国建设银行</a>
                <a target="_blank" href="">网贷东方</a>
                <a target="_blank" href="">第一网贷</a></div>
        </div>
    </div>
    <div class="footer">
        <div class="wrap">
            <p class="text">
                版权所有 © 普金资本运营（赣州）有限公司 All rights reserved <br>
                备案确认书：<a href="" target="_blank" class="beian">赣ICP备16004010号</a>
                <a href="" target="_blank"></a>&nbsp;&nbsp;&nbsp;&nbsp;
                <a target="_blank" href=""
                   style="display:inline-block;text-decoration:none;height:20px;line-height:20px;" class="beian">
                    赣公网安备 36070202000195号</a>

            </p>

        </div>
    </div>
    <script type="text/javascript" src="<%=path%>/static/js/jquery.min.js"></script>
    <script type="text/javascript" src="<%=path%>/static/js/vue.min.js"></script>
    <script type="text/javascript" src="<%=path%>/static/js/axios.min.js"></script>
    <script type="text/javascript" src="<%=path%>/static/layui/layui.js"></script>
    <script type="text/javascript" src="<%=path%>/static/js/user/account.js"></script>
    <script type="text/javascript">
        $(function () {
            layui.use(['layer'], function(){
                var layer = layui.layer;
            });
        });
        var vue = new Vue({
            el:"#card3",
            data:{

            },
            created () {

            },
            methods:{
                addCard:function () {
                    window.location.href="/bankCard/add";
//                    axios.get(' /bankCard/add').then((response)=>{
//                        layer.msg(response.data.message);
//                    },(error)=>{
//                        layer.msg("请求失败");
//                    });
                }
            }
        })
    </script>
</div>
</body>
</html>
