<%@ page import="com.animo.pojo.User" %><%--
  Created by IntelliJ IDEA.
  User: qm
  Date: 2017/12/27
  Time: 20:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% String path = request.getContextPath();%>
<html lang="en">
<head>
    <link rel="stylesheet" href="<%=path%>/static/layui/css/layui.css"/>
    <link rel="stylesheet" href="<%=path%>/static/css/user/public.css">
    <link rel="stylesheet" href="<%=path%>/static/css/user/account.css">
    <style>
        .account .account-right {
            width: 900px;
            height: 600px;
            overflow: hidden;
            display: inline-block;
        }

        .account-right, .myCount, .safe {
            width: 900px;
            height: 600px;
        }

        .sub-a-nav {
            width: 899px;
            height: 45px;
            border-bottom: 1px solid #e4e4e4;
        }

        .bo1 {
            overflow: hidden;
        }

        .box1, .bo1, .account2, .ipay, .cash, .taste, .fund, .invest, .claimm, .claimb, .loan, .bank, .safe, .msg, .tuijian, .zongl, .shenlib, .chongz, .zcjl, .tix, .tixjl, .daijj, .jiaxj, .xianjj, .tyj, .tzgl, .skmx, .lzr, .zrz, .yzr, .zrsb, .cygm, .cggm, .jggl, .hkgl, .zdhg, .tjhy, .tjlb, .sqjk {
            width: 900px;
            height: 950px;
        }

        .account2, .ipay, .cash, .taste, .fund, .invest, .claimm, .claimb, .loan, .bank, .safe, .msg, .tuijian, .zongl, .shenlib, .chongz, .zcjl, .tix, .tixjl, .daijj, .jiaxj, .xianjj, .tyj, .tzgl, .skmx, .lzr, .zrz, .yzr, .zrsb, .cygm, .cggm, .jggl, .hkgl, .zdhg, .tjhy, .tjlb, .sqjk {
            padding-top: 10px;
        }

    </style>

</head>
<body>
<%@include file="../common/top.jsp" %>
<div id="app">
    <div class="account cl">
        <div class="account-left">
            <div class="account-left-nav">
                <div class="navbar icon icon-account"><a href="#myCount">我的账户</a></div>
                <ul class="sub-nav">
                    <li class=""><a href="#account2" class="zhanghuzonglan">账户总览</a></li>
                    <li><a href="#ipay">充值</a></li>
                    <li><a href="#cash">提现</a></li>

                    <li><a id="myCoupon" href="#taste" class="wodeticket">我的赠券<i id="couponCount"></i></a></li>

                    <li><a href="#fund" class="zjjl">资金记录</a></li>
                </ul>
                <div class="navbar icon icon-self">我的管理</div>
                <ul class="sub-nav">
                    <li><a href="#invest" class="investTable">投资管理</a></li>
                    <li><a href="#loan" class="jkgl">借款管理</a></li>
                </ul>
                <div class="navbar icon icon-settings">账户设置</div>
                <ul class="sub-nav">
                    <li><a href="#bank" class="mybank">我的银行卡</a></li>
                    <li><a href="#safe">安全设置</a></li>
                    <li><a href="#msg" class="xiaoxizhongxin">消息中心</a></li>
                </ul>
            </div>
            <a href="#tuijian" class="tuijian"><img src="<%=path%>/static/images/home/tuijian.png"/></a>
        </div>
        <div class="account-right">
            <div class="box1">
                <div class="account2" id="account2">
                    <div class="bo1">
                        <div class="zongl " id="zongl">
                            <div class="account-right-nav">
                                <div class="sub-a-nav">
                                    <a href="#zongl">账户总览</a>
                                </div>
                                <em class="em-line"></em>
                            </div>
                            <div class="account-content" style="display: block;">
                                <div class="all-view">
                                    <div class="center-view">
                                        <div class="center-header">
                                            <img :src="user.face" width="120" height="120">
                                        </div>
                                        <div class="center-self">
                                            <p class="name">{{user.uname}}</p>
                                            <p style="color: black"><a href="javaScript:;" @click="updateInfo">修改信息</a></p>
                                            <img v-if="${sessionScope.user.isvip==0}" src="/static/uploads/user/hui.png"/>
                                            <img v-else src="/static/uploads/user/liang.png"/>
                                            <p id="reset"></p>
                                        </div>
                                        <div class="center-user">
                                            <p class="amt color"><span id="usableSum">{{dataRows.kymoney}}</span>元</p>
                                            <p class="text"><i></i>可用余额</p>
                                            <p class="link">
                                                <a href="#ipay" class="active">充值</a>
                                                <a href="#cash">提现</a>
                                            </p>
                                        </div>
                                        <div class="center-profit">
                                            <p class="amt"><span id="earnSum">{{dataRows.symoney}}</span>元</p>
                                            <p class="text">收益总额</p>
                                            <p class="luckynum"><i id="DetailsIcon"></i><a class="luckyLink" href=""
                                                                                           target="_blank">抽奖次数<b
                                                    id="luckynum">6</b>次</a></p>
                                            <p class="icon icon-quan">代金券 <b id="voucher">5</b> 张，现金券 <b
                                                    id="cashMap">8</b> 张</p>
                                            <div class="luckyDetails" style="display: none;">
                                                <h1>如何获得抽奖机会</h1>
                                                <p>活动期间：单笔投资满1000元，可获得1次抽奖机会，单笔投资满2000元，可获得2次抽奖机会;以此类推(债权转让标除外)。</p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="center-main">
                                        <div class="canvas">

                                            <div class="center-total">
                                                <p id="allTotal">{{dataRows.zmoney}}</p>
                                                <p class="text">总资产</p>
                                            </div>
                                        </div>
                                        <div class="center-data">
                                            <p><i class="color color1"></i>投资总额：<span id="investSum">{{dataRows.tzmoney}}</span>
                                            </p>

                                            <p><i class="color color2"></i>冻结金额：<span id="freezeAmount">{{dataRows.djmoney}}</span>
                                            </p>

                                            <p><i class="color color3"></i>待收总额：<span id="forPaySum">{{dataRows.dsmoney}}</span>
                                            </p>

                                            <p><i class="color color4"></i>奖励金额：<span id="otherEarnAmount">{{dataRows.jlmoney}}</span>
                                            </p>
                                        </div>
                                    </div>
                                </div>
                                <div id="huifuHtml"></div>

                            </div>
                        </div>
                    </div>
                </div>

                <div class="ipay" id="ipay">
                    <div class="bo1">
                        <div class="chongz " id="chongz">
                            <div class="account-right-nav">
                                <div class="sub-a-nav">
                                    <a href="#chongz">充值</a><a href="#zcjl" class="czjl">充值记录</a>
                                </div>
                                <em class="em-line"></em>
                            </div>
                            <div class="account-content">
                                <!-- 充值 -->
                                <div class="ipay-pay">
                                    <p class="tips-title"><b>温馨提示：</b>凡是在普金资本充值未投标的用户，15天以内提现收取本金0.5%，15天以后提现免费
                                        普金资本禁止信用卡套现、虚假交易
                                        等行为,一经发现将予以处罚,包括但不限于：限制收款、冻结账户、永久停止服务,并有可能影响相关信用记录。</p>
                                    <div class="pay-from">
                                        <div class="label cl">
                                            <label>充值金额：</label><input type="text" v-model="czmoney" id="ipay-amt"
                                                                       maxlength="18" placeholder="请输入充值金额">
                                            <p class="roll">元</p>
                                        </div>
                                        <button type="button" class="btn" @click="chongzhi">立即充值</button>
                                    </div>
                                    <div id="alipay"></div>
                                </div>
                            </div>
                        </div>

                        <div class="zcjl " id="zcjl">
                            <div class="account-right-nav">
                                <div class="sub-a-nav">
                                    <a href="#chongz">充值</a><a href="#zcjl">充值记录</a>
                                </div>
                                <em class="em-line" style="left: 120px;"></em>
                            </div>
                            <div class="account-content">
                                <table class="layui-hide" id="logcz" lay-filter="demo"></table>
                            </div>
                        </div>

                    </div>
                </div>

                <div class="cash" id="cash">
                    <div class="bo1">
                        <div class="tix " id="tix">
                            <div class="account-right-nav">
                                <div class="sub-a-nav">
                                    <a href="#tix">提现</a><a href="#tixjl" class="txjl">提现记录</a></a>
                                </div>
                                <em class="em-line"></em>
                            </div>
                            <div class="account-content" style="display: block;">
                                <!-- 提现 -->
                                <div class="cash-pay">
                                    <p class="tips-title">
                                        <b>温馨提示：</b>凡是在普金资本充值未投标的用户，15天以内提现收取本金0.5%的提现服务费，15天以后提现免服务费。禁止信用卡套现！<br>
                                        a）提现手续费由汇付收取，固定费用2元。<br>
                                        b）请输入您要提现的金额，我们将在1至3个工作日(国家节假日除外)之内将钱转入您网站上填写的银行账号。<br>
                                        c）每笔提现金额至少为100元以上。
                                    </p>
                                    <div class="pay-from">
                                        <div class="label cl">
                                            <label class="long">可提现金额：</label>
                                            <p class="text color" id="cash-usableSum">{{dataRows.kymoney}}元</p>
                                        </div>
                                        <div class="label cl">
                                            <label class="long">提现金额：</label><input type="text" v-model="txmoney"
                                                                                    placeholder="请输入提现金额">
                                        </div>
                                        <button type="button" class="btn" @click="tixian">立即提现</button>
                                    </div>
                                    <div id="returnHtml"></div>
                                </div>
                            </div>
                        </div>

                        <div class="tixjl " id="tixjl">
                            <div class="account-right-nav">
                                <div class="sub-a-nav">
                                    <a href="#tix">提现</a><a href="#tixjl">提现记录</a>
                                </div>
                                <em class="em-line" style="left: 120px;"></em>
                            </div>
                            <div class="account-content" style="display: block;">
                                <table class="layui-hide" id="logtx" lay-filter="demo"></table>
                            </div>
                        </div>

                    </div>
                </div>

                <div class="taste" id="taste">

                    <div class="bo1">
                        <div class="daijj " id="daijj">
                            <div class="account-right-nav">
                                <div class="sub-a-nav">
                                    <a href="#daijj">我的赠券</a>
                                </div>
                                <em class="em-line"></em>
                            </div>
                            <div class="account-content" id="dtaste" style="display: block;">
                                <div class="account-list">
                                    <ul class="fund-list-box list-box">
                                        <li class="title">
                                            <div class="children0">券类型</div>
                                            <div class="children1">价值</div>
                                            <div class="children2">领取时间</div>
                                            <div class="children3">失效时间</div>
                                        </li>
                                    </ul>
                                    <ul class="fund-list-box listData">
                                        <li v-for="item in tickets" class="interval">
                                            <div class="children0">{{item.type |type}}</div>
                                            <div class="children1">{{item.tkmoney}}元</div>
                                            <div class="children2">{{item.tktime}}</div>
                                            <div class="children3">{{item.ttime}}</div>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!--资金记录-->
                <div class="fund" id="fund">
                    <div class="account-right-nav">
                        <div class="sub-a-nav">
                            <a href="javascript:void(0);" class="active">资金记录</a>
                        </div>
                        <em></em>
                    </div>
                    <div class="account-content">
                        <div class="fund-param-list">
                            <p>交易类型：</p>
                            <ul class="cl">
                                <li class="active"><a href="javascript:;" onclick="inout()">全部</a></li>
                                <li><a href="javascript:;" onclick="inout(0)">收入</a></li>
                                <li><a href="javascript:;" onclick="inout(1)">支出</a></li>
                            </ul>
                        </div>
                        <table class="layui-hide" id="logMoney" lay-filter="demo"></table>
                    </div>
                </div>



                <!--投资管理：开始-->
                <div class="invest" id="invest">
                    <div class="bo1">
                        <div class="tzgl " id="tzgl">
                            <div class="account-right-nav">
                                <div class="sub-a-nav">
                                    <a href="#tzgl">投资管理</a>
                                </div>
                                <em class="em-line"></em>
                            </div>
                            <div class="account-content" id="invest" style="display: block;">
                                    <table class="layui-hide" id="tjglTable" lay-filter="tzglFilter"></table>
                                    <!--table工具栏-->
                                    <script type="text/html" id="barTzgl">
                                        <%--<a class="layui-btn layui-btn-xs" lay-event="fenzi">投资分支</a>--%>
                                        <a class="layui-btn layui-btn-xs" lay-event="view">收款计划</a>
                                    </script>
                                    <!--收款计划窗口：开始-->
                                    <div id="viewWin" style="display: none">
                                        <table class="layui-hide" id="shoukuanjihua" lay-filter="shoukuanjihua"></table>
                                        <!--table工具栏-->
                                        <script type="text/html" id="qrsk">
                                            <a class="layui-btn layui-btn-xs" lay-event="querenshoukuan">确认收款</a>
                                        </script>
                                    </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!--投资管理：结束-->

                <div class="loan" id="loan">

                    <div class="bo1">
                        <div class="jggl " id="jggl">
                            <div class="account-right-nav">
                                <div class="sub-a-nav">
                                    <a href="#jggl">借款管理</a>
                                </div>
                                <em class="em-line"></em>
                            </div>
                            <table class="layui-hide" id="jkgl" lay-filter="jkgl"></table>
                        </div>
                        <div id="huankuanview" style="display: none">
                            <table class="layui-hide" id="huankuanjihua" lay-filter="huankuanjihua"></table>
                        </div>
                    </div>
                </div>


                <!--wo d -->
                <div class="bank" id="bank">
                    <div class="account-right-nav">
                        <div class="sub-a-nav">
                            <a href="#bank">我的银行卡</a>
                        </div>
                    </div>
                    <div class="account-content" style="display: block;">
                        <div v-if="bankstatus" id="card1" class="bank-card_1">
                            <div class="bank-top">
                                <div class="bank-cardTitle">{{bank.type}}</div>
                                <div class="bank-cardType">储蓄卡</div>
                            </div>
                            <div class="bank-center">
                                <div class="bank-cardNumber">{{bank.cardno}}</div>
                                <div class="bank-userName">{{bank.rname}}</div><a href="javaScript:;" @click="unbind">解绑</a>
                            </div>
                        </div>
                        <div v-else id="card3" class="bank-card_3" @click="addCard" style="cursor:pointer;">
                            <div class="bank-addCard"><a href="/bankCard/add">添加银行卡</a>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="safe" id="safe">
                    <div class="account-right-nav">
                        <div class="sub-a-nav">
                            <a href="javascript:void(0);" class="active">安全中心</a>
                        </div>
                        <em></em>
                    </div>
                    <div class="account-content" style="display: block;">
                        <div class="safe">
                            <div class="safe-content">
                                <ul class="safe-list">
                                    <li>
                                        <div class="safe-list-1">
                                            <p class="icon icon-true" id="cellPhone-icon">手&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;机</p>
                                        </div>
                                        <div class="safe-list-2" id="cellPhone-text">{{user.phone | phone}}</div>
                                        <div class="safe-list-3">
                                            <a href="javascript:;" id="cellPhone" class="on">已绑定</a>
                                        </div>
                                    </li>
                                    <li v-if="user.email!=null">
                                        <div class="safe-list-1">
                                            <p class="icon icon-true" id="email-icon">邮&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;箱</p>
                                        </div>
                                        <div class="safe-list-2" id="email-text">{{user.email | email}}</div>
                                        <div class="safe-list-3">
                                            <a href="javascript:;" id="cellEmail" class="on">已绑定</a>
                                        </div>
                                    </li>
                                    <li v-else>
                                        <div class="safe-list-1">
                                            <p class="icon icon-wrong" >邮&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;箱</p>
                                        </div>
                                        <div class="safe-list-2" >获取最新的投资讯息和账户信息变动通知</div>
                                        <div class="safe-list-3">
                                            <%--<a href="javascript:;" @click="bindEmail">进行绑定</a>--%>
                                                <div class="site-demo-button" id="layerDemo" style="margin-bottom: 0;">
                                                    <button data-method="upEmail" data-type="c" class="layui-btn layui-btn-normal">进行绑定</button>
                                                </div>

                                        </div>
                                    </li>

                                    <div id="updateEmail" style="display: none">
                                        <div class="login">
                                            <ul class="login-list">
                                                <p class="error-msg icon icon-error"></p>
                                                <form>
                                                    <div class="from">
                                                        <li><input type="email" v-model="user.email" placeholder="请输入邮箱"></li>
                                                    </div>
                                                </form>
                                            </ul>
                                        </div>

                                    </div>

                                    <li v-if="user.idno!=null">
                                        <div class="safe-list-1">
                                            <p class="icon icon-true" id="realName-icon">身份认证</p>
                                        </div>
                                        <div class="safe-list-2" id="realName-text">{{user.idno | idno}}</div>
                                        <div class="safe-list-3">
                                            <a href="javascript:;"  class="on">已认证</a>
                                        </div>
                                    </li>
                                    <li v-else>
                                        <div class="safe-list-1">
                                            <p class="icon icon-wrong" >身份认证</p>
                                        </div>
                                        <div class="safe-list-2" >一旦实名认证通过将不能修改</div>
                                        <div class="safe-list-3">
                                            <a href="javascript:;" >去认证</a>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="safe-list-1">
                                            <p class="icon icon-true">登录密码</p>
                                        </div>
                                        <div class="safe-list-2">
                                            {{user.upwd | pwd}}
                                        </div>
                                        <div class="safe-list-3">
                                           <%-- <a href="javascript:;" id="password-btn">忘记密码</a>--%>
                                               <div class="site-demo-button" id="layerDemo" style="margin-bottom: 0;">
                                                   <button data-method="updatePwd" data-type="c" class="layui-btn layui-btn-normal">修改</button>
                                               </div>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="msg" id="msg">
                    <div class="account-right-nav">
                        <div class="sub-a-nav">
                            <a href="javascript:void(0);" class="active show-cash">消息中心</a>
                        </div>
                        <em class="em-line"></em>
                    </div>
                    <div class="account-content" style="margin-top: -40px;">
                        <table class="layui-hide" id="xiaoxizhongxin" lay-filter="demo"></table>
                    </div>
                </div>

                <div class="tuijian" id="tuijian">

                    <div class="bo1">
                        <div class="tjhy " id="tjhy">
                            <div class="account-right-nav">
                                <div class="sub-a-nav">
                                    <a href="#tjhy">推荐好友</a><a href="#tjlb" class="tjgl">推荐列表</a>
                                </div>
                                <em class="em-line"></em>
                            </div>
                            <div class="account-content">
                                <div class="tuiJianShow">
                                    <img src="/static/images/account/banner_t.png" width="896" height="260">
                                    <p class="tj-tips">尊敬的用户,您的推荐号为：<span id="uid">${sessionScope.user.resstr1}</span></p>
                                    <p class="tj-text">活动时间：<span>2017年12月15日—2018年1月30日；</span></p>
                                    <p class="tj-text">活动对象：活动期间新注册用户的推荐人；</p>
                                    <p class="tj-text">活动说明：1. 活动期间邀请好友注册并累计投资满10000元，得50元现金券奖励；</p>
                                    <p class="tj-text" style="padding-left: 70px;">2.
                                        活动期间内成功邀请5位以上好友注册投资成功合计满100000，可额外获得500元现金券奖励，可在<span>【我的账户-我的赠券】</span>中查看。</p>
                                    <p class="tj-text" style="padding-left: 70px;">
                                        (满足活动条件的用户在活动结束后3个工作日内奖励将以现金券的形式发放至用户账户)</p>
                                    <p class="tj-text"><span>注：</span>需将自己的邀请链接地址或推荐号发给您的好友，这样您才能成为他的邀请者。</p>
                                    <div class="tj-clip" id="tj-clip">
                                        <p class="tj-clip-text"  id="tj-clip-text">
                                            http://localhost:8080/user/register?code=${sessionScope.user.resstr1}
                                        </p>
                                        <button type="button"  data-clipboard-target="#tj-clip-text" class="tj-clip-btn">复制链接</button>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="tjlb " id="tjlb">
                            <div class="account-right-nav">
                                <div class="sub-a-nav">
                                    <a href="#tjhy">推荐好友</a><a href="#tjlb">推荐列表</a>
                                </div>
                                <em class="em-line" style="left: 120px;"></em>
                            </div>
                            <div class="account-content">
                                <table class="layui-hide" id="tjgl" lay-filter="demo"></table>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>

    <div id="updateInfo" style="display: none;">
        <form class="layui-form">
            <div class="layui-form-item">
                <label class="layui-form-label">昵称</label>
                <div class="layui-input-inline">
                    <input type="text" v-model="user.uname"  autocomplete="off"   placeholder="请输入昵称" class="layui-input">
                </div>
            </div>

            <div class="layui-form-item">
                <div class="layui-inline">
                    <label class="layui-form-label">身份证</label>
                    <div class="layui-input-inline">
                        <input type="text" v-model="user.idno" autocomplete="off"  placeholder="请输入身份证" class="layui-input">
                    </div>
                </div>
            </div>

            <div class="layui-form-item">
                <div class="layui-inline">
                    <label class="layui-form-label">支付密码</label>
                    <div class="layui-input-inline">
                        <input type="password" v-model="user.zpwd"   autocomplete="off" placeholder="请输入支付密码" class="layui-input">
                    </div>
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">邮箱</label>
                <div class="layui-input-inline">
                    <input type="text" v-model="user.email"  placeholder="请输入邮箱"  autocomplete="off" class="layui-input">
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">真实姓名</label>
                <div class="layui-input-inline">
                    <input type="text" v-model="user.rname"  placeholder="请输入姓名" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">性别</label>
                <div class="layui-input-block" v-model="user.sex">
                    <input type="radio" name="sex" value="男" title="男" checked>
                    <input type="radio" name="sex" value="女" title="女">
                </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-input-block">
                    <button class="layui-btn"   @click="update">修改</button>
                </div>
            </div>
        </form>
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
        <%@include file="../common/footer.jsp" %>
    </div>
</div>
</body>
<script type="text/javascript" src="<%=path%>/static/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=path%>/static/js/vue.min.js"></script>
<script type="text/javascript" src="<%=path%>/static/js/axios.min.js"></script>
<script src="/static/js/qs.js"></script>
<script src="/static/layui/layui.js"></script>
<script type="text/javascript" src="<%=path%>/static/js/layui-formVerify.js"></script>


<%--<script type="text/javascript" src="<%=path%>/static/js/user/province.js"></script>--%>
<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="hkjh">还款计划</a>
    <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="jkxq">借款详情</a>
</script>
<script type="text/html" id="hkjh">
    <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="qrhk">确认还款</a>
</script>
<script>

    var layer;

    var vue = new Vue({
        el: '#app',
        data: {
            bank:[],
            user:[],
            dataRows: [],
            czmoney: '',
            txmoney: '',
            uid:${sessionScope.user.uid},
            bankstatus:false,
            emailstatus:false,
            tickets:[],
            letters:[]
        },
        filters: {
            phone (value) {
                if(value!=null){
                    return value.slice(0,3)+'****'+value.slice(9,11)
                }
            },
            email(value){
                if(value!=null){
                    return value.slice(0,3)+'*****'+value.slice(10,value.length)
                }
            },
            idno(value){
                if(value!=null){
                    return value.slice(0,5)+'******'+value.slice(10,value.length)
                }
            },
            pwd(value){
                if(value!=null){
                    return '******';
                }
            },
            type(value){
                if(value==0){
                    return"代金券";
                }else{
                    return"现金券";
                }
            }
        },
        created() {
            this.getUserMoney();
            this.getUserInfo();
        },
        methods: {
            updateInfo () {
                this.showInfoEadit();
            },
            update () {
                this.user.sex = $('input:radio[name="sex"]:checked').val();
                    axios.post('/user/data/json/updateInfo',Qs.stringify(this.user)).then((response) => {
                        if(response.data.code==0){
                            alert('修改成功');
                            var index = parent.layer.getFrameIndex(window.name);
                            layer.close(index);
                        }
                    })
            },
            getUserInfo(){
                axios.get('/user/data/json/byiddync?id='+${sessionScope.user.uid}).then((response) => {
                    this.user = response.data.data;
                });
            },
            showInfoEadit(){
                layer.open({
                    type: 1,
                    title:'修改信息',
                    offset:['100px'],
                    area: ['350px', '450px'],
                    fixed: false, //不固定
                    maxmin: true,
                    skin: '',
                    content: $("#updateInfo")
                });
            },
            getUserMoney() {
                usermoney();
            },
            chongzhi() {
                if(this.user.idno==null){
                    alert("信息不完善");
                    return this.showInfoEadit();
                }
                if(this.czmoney==''){
                    return alert("请输入充值金额");
                }
                axios.get('/logCz/data/json/recharge?money=' + this.czmoney).then((response) => {
                    alert(response.data.message);
                }, (error) => {

                });
            },
            tixian() {
                if(this.user.idno==null){
                    alert("信息不完善");
                    return this.showInfoEadit();
                }
                if (this.txmoney > this.dataRows.kymoney) {
                    alert("提现大于可用");
                    return;
                } else if (this.txmoney == '') {
                    alert("请输入提现金额");
                    return;
                }
                axios.get('/LogTx/data/json/withdraw?money=' + this.txmoney).then((response) => {
                    alert(response.data.message);
                    this.dataRows.kymoney = parseInt(this.dataRows.kymoney)-parseInt(this.txmoney);
                    this.txmoney=0;
                }, (error) => {

                });
            },
            addCard () {
                if(this.user.idno==null){
                    alert("信息不完善");
                    return this.showInfoEadit();
                }
                window.location.href = "/bankCard/add";
            },
            unbind(){
                axios.get('/bankcard/data/json/delete/'+this.bank.bcid).then((response) => {
                    if(response.data.code!=0){
                        return alert(response.data.message);
                    }
                    alert('解绑成功');
                    this.bankstatus=false;
                }, (error) => {

                });
            }
        }
    });

    function usermoney(){
        axios.get('/userMoney/data/json/selectBanlance').then((response) => {
            vue.dataRows = response.data.data;
        }, (error) => {

        });
    }

    layui.use(['laypage', 'layer', 'table', 'element'], function () {
        var laypage = layui.laypage //分页
        layer = layui.layer //弹层
            , table = layui.table //表格
            , element = layui.element; //元素操作
        $(".czjl").on('click', function () {
            table.render({
                elem: '#logcz'
                , height: 480
                , url: '/logCz/data/json/pager' //数据接口
                , page: true //开启分页
                , limit: 10//每页显示多少个
                //后台Pager响应对象 不要动
                , response: {
                    statusName: 'status'
                    , statusCode: 0
                    , msgName: 'message'
                    , countName: 'total'
                    , dataName: 'rows'
                }
                //后台Pager响应对象 不要动
                //表头
                , cols: [[
                    {field: 'bankcard', title: '充值卡号', width: 220}
                    , {field: 'banktype', title: '所属银行', width: 220}
                    , {field: 'money', title: '充值金额', width: 200, sort: true}
                    , {field: 'createdTime', title: '充值时间', width: 254, sort: true}
                ]]
                //表头
            });
        });
        $(".txjl").on('click', function () {
            table.render({
                elem: '#logtx'
                , height: 480
                , url: '/LogTx/data/json/pager' //数据接口
                , page: true //开启分页
                , limit: 10//每页显示多少个
                //后台Pager响应对象 不要动
                , response: {
                    statusName: 'status'
                    , statusCode: 0
                    , msgName: 'message'
                    , countName: 'total'
                    , dataName: 'rows'
                }
                //后台Pager响应对象 不要动
                //表头
                , cols: [[
                    {field: 'bankcard', title: '提现卡号', width: 200}
                    , {field: 'banktype', title: '所属银行', width: 180}
                    , {field: 'money', title: '提现金额', width: 200, sort: true}
                    , {field: 'createdTime', title: '提现时间', width: 200, sort: true}
                    , {field: 'status', title: '提现状态', width: 115, templet: '<div>{{ statusGe(d.status)}}</div>'}


                ]]
                //表头
            });
        });

        <!--借款管理-->
        $(".jkgl").on('click', function () {
            table.render({
                elem: '#jkgl'
                , height: 332
                , url: '/borrowapply/data/json/pagerByJuid'
                    , page: true
                    , limit: 10
                    , response: {
                        statusName: 'status'
                        , statusCode: 0
                        , msgName: 'message'
                        , countName: 'total'
                        , dataName: 'rows'
                    }
                    , cols: [[
                        {field: 'cpname', title: '借款名称', width: 200}
                        , {field: 'money', title: '申请金额', width: 200}
                        , {field: 'ymoney', title: '已筹金额', width: 200, sort: true}
                        , {field: 'term', title: '借款期限', width: 200, sort: true}
                        , {field: 'deadline', title: '截止时间', width: 200}
                        ,{title:'操作',fixed: 'right', width: 165, align:'center', toolbar: '#barDemo'}
                    ]]
                });
            table.on('tool(jkgl)', function(obj){
                var data = obj.data
                    ,layEvent = obj.event;
                if(layEvent === 'hkjh'){
                    layer.open({
                        type: 1,
                        title:'还款计划',
                        offset:['100px'],
                        area: ['700px', '450px'],
                        fixed: false, //不固定
                        maxmin: true,
                        closeBtn: 1,
                        skin: '',
                        content: $("#huankuanview")
                    });
                    table.render({
                        elem: '#huankuanjihua'
                        , height: 500
                        , url: '/hkb/data/json/pager'
                        , where: {'baid':data.baid}
                        , page: true
                        , limit: 10
                        , response: {
                            statusName: 'status'
                            , statusCode: 0
                            , msgName: 'message'
                            , countName: 'total'
                            , dataName: 'rows'
                        }
                        ,cols: [[
                             {field:'rname', title:'真实姓名', width:90}
                            ,{field:'rnum', title:'已还期数', width:90}
                            ,{field:'tnum', title:'总期数', width:90}
                            ,{field:'ytime', title:'应还时间', width:120}
                            ,{field:'rtime', title:'实还时间', width:90}
                            ,{field:'ybx', title:'应还本息', width:90}
                            ,{field:'rbx', title:'已还本息', width:60}
                            ,{field:'ybj', title:'应还本金', width:60}
                            ,{field:'rbj', title:'已还本金', width:60}
                            ,{field:'ylx', title:'应还利息', width:60}
                            ,{field:'rlx', title:'已还利息', width:60}
                            ,{field:'yfc', title:'应还罚息', width:60}
                            ,{field:'rfc', title:'已还罚息', width:60}
                            ,{field:'yucount', title:'逾期次数', width:60}
                            ,{field:'status', title:'还款状态', width:60,templet: '<div>{{hkbStatus(d.status) }}</div>'}
                            ,{title:'操作',fixed: 'right', width: 165, align:'center', toolbar: '#hkjh'}
                        ]]
                        //表头
                    });
                    table.on('tool(huankuanjihua)', function(obj){
                        var data = obj.data
                            ,layEvent = obj.event;
                        if(layEvent === 'qrhk'){
                            if(data.rtime!=null){
                                return alert('已还款');
                            }
                            axios.get('/hkb/data/json/confirm', {params: {hkid: data.hkid}}).then((response)=>{
                                if(response.data.code==0){
                                    return alert(response.data.message);
                                }
                                alert(response.data.message)
                            },(error)=>{

                            });
                        }
                    });
                }else if(layEvent =='jkxq'){
                    window.location.href='/borrowapply/info/'+data.baid+'/'+data.bdid+'/'+data.bzname;
                }
            });
        });
        <!--借款管理-->


        <!--资金记录-->
        $(".zjjl").on('click', function () {
            zjjl();
        });
        <!--资金记录-->


        <!--推荐管理-->
        $(".tjgl").on('click', function () {
            table.render({
                elem: '#tjgl'
                , height: 332
                , url: '/user/data/json/PagerCriteria' //数据接口
                , where: {'resstr2': ${sessionScope.user.resstr1}}
                , page: true //开启分页
                , limit: 10//每页显示多少个
                //后台Pager响应对象 不要动
                , response: {
                    statusName: 'status'
                    , statusCode: 0
                    , msgName: 'message'
                    , countName: 'total'
                    , dataName: 'rows'
                }
                //后台Pager响应对象 不要动
                //表头
                , cols: [[
                    {field: 'uname', title: '用户名', width: 200}
                    , {field: 'resint1', title: '创建时间', width: 200}
                ]]
                //表头
            });
        });
        <!--推荐管理-->

        //投资管理
        $(".investTable").on('click', function () {
           invest();
        });
    });

    $(".wodeticket").on('click', function () {
        axios.get('/ticket/data/json/list').then((response) => {
            if(response.data.code==0){
                vue.tickets = response.data.data;
            }
        })
    });

    $(".xiaoxizhongxin").on('click', function () {
        table.render({
            elem: '#xiaoxizhongxin'
            , height: 332
            , url: '/letter/data/json/pager' //数据接口
            , page: true //开启分页
            , limit: 10//每页显示多少个
            //后台Pager响应对象 不要动
            , response: {
                statusName: 'status'
                , statusCode: 0
                , msgName: 'message'
                , countName: 'total'
                , dataName: 'rows'
            }
            //后台Pager响应对象 不要动
            //表头
            , cols: [[
                {field: 'title', title: '标题', width: 200}
                , {field: 'content', title: '内容', width: 200}
                , {field: 'created_time', title: '时间', width: 200}
            ]]
            //表头
        });
    });

    $(".zhanghuzonglan").on('click', function () {
        usermoney();
    });

    $(".mybank").on('click', function () {
        axios.get(' /bankcard/data/json/list').then((response) => {
            vue.bank = response.data.data
            if(vue.bank!=null){
                vue.bankstatus = true
            }else{
               vue.bankstatus=false
            }
        }, (error) => {

        });
    });


    function statusGe(value) {
        if (value == 0) {
            return "未受理";
        } else if (value == 1) {
            return "提现成功";
        } else if (value == 2) {
            return "提现失败";
        }
    }

    function typeGe(value) {
        if (value == 0) {
            return "收入";
        } else if (value == 1) {
            return "支出";
        }
    }

    function inout(value) {
        zjjl(value);
    }

    function hkbStatus(value) {
        if(value==0){
            return"未还款";
        }else{
            return"已还款";
        }
    }

    <!--资金记录-->
    function zjjl(type) {
        table.render({
            elem: '#logMoney'
            , height: 332
            , url: '/logMoney/data/json/pager' //数据接口
            , where: {'type': type}
            , page: true //开启分页
            , limit: 10//每页显示多少个
            //后台Pager响应对象 不要动
            , response: {
                statusName: 'status'
                , statusCode: 0
                , msgName: 'message'
                , countName: 'total'
                , dataName: 'rows'
            }
            //后台Pager响应对象 不要动
            //表头
            , cols: [[
                {field: 'type', title: '类型', width: 220, templet: '<div>{{ typeGe(d.type)}}</div>'}
                , {field: 'income', title: '收入', width: 220}
                , {field: 'outlay', title: '支出', width: 220}
                , {field: 'createdTime', title: '时间', width: 235, sort: true}
            ]]
            //表头
        });
    }
    <!--资金记录-->

    <!--投资管理-->
    function invest() {
        table.render({
            elem: '#tjglTable'
            , height: 480
            , url: '/tzb/data/json/investPager' //数据接口
            , where: {'uid': ${sessionScope.user.uid}}
            , page: true //开启分页
            , limit: 10//每页显示多少个
            //后台Pager响应对象 不要动
            , response: {
                statusName: 'status'
                , statusCode: 0
                , msgName: 'message'
                , countName: 'total'
                , dataName: 'rows'
            }
            //后台Pager响应对象 不要动
            //表头
            , cols: [[
                {field: 'cpname', title: '标题', width: 100, sort: true}
                , {field: 'nprofit', title: '年利率（%）', width: 80}
                , {field: 'bzname', title: '类型', width: 80}
                , {field: 'term', title: '期限（月）', width: 80}
                , {field: 'way', title: '还款方式', width: 150}
                , {field: 'money', title: '投资金额（元）', width: 120}
                , {field: 'tztime', title: '投资时间', width: 180}
                , {title: '操作', fixed: 'right', width: 100, align: 'center', toolbar: '#barTzgl'}
            ]]
            //表头
        });
        table.on('tool(tzglFilter)', function (obj) {
            //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
            var data = obj.data //获得当前行数据
                , layEvent = obj.event; //获得 lay-event 对应的值
            if (layEvent === 'view') {
                axios.get('/borrowapply/data/json/isSkb?baid=' + data.baid).then((response) => {
                    if(response.data.code==1){
                        return alert(response.data.message);
                    }
                    layer.open({
                        type: 1,
                        title:'收款计划',
                        offset:['100px'],
                        area: ['700px', '450px'],
                        fixed: false, //不固定
                        maxmin: true,
                        closeBtn: 1,
                        skin: '',
                        content: $("#viewWin")
                    });
                    table.render({
                        elem: '#shoukuanjihua'
                        , height: 500
                        , url: '/skb/data/json/list' //数据接口
                        , where: {'uid': vue.uid,'baid':data.baid}
                        , page: true //开启分页
                        , limit: 10//每页显示多少个
                        //后台Pager响应对象 不要动
                        , response: {
                            statusName: 'status'
                            , statusCode: 0
                            , msgName: 'message'
                            , countName: 'total'
                            , dataName: 'rows'
                        }
                        , cols: [[
                             {field: 'ylx', title: '应收利息', width: 80}
                            , {field: 'rlx', title: '已收利息', width: 80}
                            , {field: 'ybj', title: '应收本金', width: 150}
                            , {field: 'rbj', title: '已收本金', width: 120}
                            ,{field: 'ybx', title: '应收本息', width: 100, sort: true}
                            , {field: 'rbx', title: '已收本息', width: 110}
                            , {field: 'rnum', title: '已收期数', width: 110}
                            , {field: 'tnum', title: '总期数', width: 110}
                            , {field: 'sktime', title: '收款时间', width: 180}
                            , {title: '操作',  width: 100, align: 'center', toolbar: '#qrsk'}
                        ]]
                        //表头
                    });
                    table.on('tool(shoukuanjihua)', function (obj) {
                        //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
                        var data = obj.data //获得当前行数据
                            , layEvent = obj.event; //获得 lay-event 对应的值
                        if (layEvent === 'querenshoukuan') {
                            if(data.ylx==data.rlx){
                                alert("已收款");
                            }else{
                                axios.get('/skb/data/json/confirm', {params: {skid: data.skid}}).then((response)=>{
                                if(response.data.code==0){
                                    return alert(response.data.message);
                                }
                                alert(response.data.message)
                                },(error)=>{

                                });
                            }
                        }
                        });
                }, (error) => {

                });
            }else if(layEvent === 'fenzi'){
                layer.msg('查看分支');
            }
        });
    }
    <!--投资管理-->
</script>

<script>
    layui.use('layer', function(){ //独立版的layer无需执行这一句
        var $ = layui.jquery,
            layer = layui.layer; //独立版的layer无需执行这一句

        var active = {
            updatePwd: function(othis){
                var type = othis.data('type'),
                    text = othis.text();
                layer.open({
                    type: 2
                    ,offset:type
                    ,content:'<%=path%>/back/user/upPwd'
                    ,area: ['430px', '300px'] //自定义文本域宽高
                    ,title:'修改密码'
                });
            },

            upEmail: function(othis){
                var type = othis.data('type');
                layer.open({
                    type: 2
                    ,offset:type
                    ,content:'<%=path%>/back/user/upEmail'
                    ,area: ['430px', '180px'] //自定义文本域宽高
                    ,title:'修改邮箱'
                });
            }
        };

        $('#layerDemo .layui-btn').on('click', function(){
            var othis = $(this), method = othis.data('method');
            active[method] ? active[method].call(this, othis) : '';
        });

    });

</script>
</html>