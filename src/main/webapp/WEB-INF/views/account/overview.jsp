<%--
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
    <link rel="stylesheet" href="<%=path%>/static/css/user/public.css">
    <link rel="stylesheet" href="<%=path%>/static/css/user/account.css">

</head>
<link rel="icon" href="<%=path%>/static/images/index/logo_title.jpg" type="image/x-icon"/>
<body onhashchange="hashChange()">
<!--[if lt IE 8]>
<div class="show-danger">您正在使用 <strong>过时的</strong> 浏览器. 是时候 <a href="http://browsehappy.com/">更换一个更好的浏览器</a> 来提升用户体验.</div>
<![endif]-->
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
<div class="nav">
    <div class="wrap cl">
        <div class="logo"><a href=""><img src="<%=path%>/static/images/account/logo.png" alt="普金资本"></a></div>
        <div class="nav-bar">
            <ul>
                <li class="icon icon-acc"><a href="javascript:void(0);">我的账户</a></li>
                <!-- <li><a href="javascript:void(0);">信息披露</a></li> -->
                <li><a href="about.html">信息披露</a></li>
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
        <a href="#tuijian" class="tuijian"><img src="<%=path%>/static/images/account/tuijian.png"/></a>
    </div>

    <div class="account-right">



        <div class="account-right-nav">
            <div class="sub-a-nav">
                <a href="javascript:void(0);" class="all-a active">账户总览</a>
                <a href="javascript:void(0);" class="slb-a">生利宝</a>
            </div>
            <em class="em-line"></em>
        </div>
        <div class="account-content" style="display: block;">
            <div class="all-view">
                <div class="center-view">
                    <div class="center-header">
                        <img src="<%=path%>/static/images/account/header.png" width="120" height="120">
                    </div>
                    <div class="center-self">
                        <p class="name">18296691307</p>
                        <p class="safety">安全等级： <span id="safeLevel">低</span></p>
                        <p class="center-icon">
                            <a href="#safe" class="icon icon-c-phone"></a>
                            <a href="#safe" class="icon icon-c-mail"></a>
                        </p>
                        <p id="registpay"><a href="javascript:;">注册汇付</a></p>
                        <p id="reset"></p>
                    </div>
                    <div class="center-user">
                        <p class="amt color"><span id="usableSum">9000000.00</span>元</p>
                        <p class="text"><i></i>可用余额</p>
                        <p class="link">
                            <a href="#ipay" class="active">充值</a>
                            <a href="#cash">提现</a>
                        </p>
                    </div>
                    <div class="center-profit">
                        <p class="amt"><span id="earnSum">50000.00</span>元</p>
                        <p class="text">收益总额</p>
                        <p class="luckynum"><i id="DetailsIcon"></i><a class="luckyLink" href="" target="_blank">抽奖次数<b id="luckynum">6</b>次</a></p>
                        <p class="icon icon-quan">代金券 <b id="voucher">5</b> 张，现金券 <b id="cashMap">8</b> 张</p>
                        <div class="luckyDetails" style="display: none;">
                            <h1>如何获得抽奖机会</h1>
                            <p>活动期间：单笔投资满1000元，可获得1次抽奖机会，单笔投资满2000元，可获得2次抽奖机会;以此类推(债权转让标除外)。</p>
                        </div>
                    </div>
                </div>
                <div class="center-main">
                    <div class="canvas">

                        <div class="center-total">
                            <p id="allTotal">100000000.00</p>
                            <p class="text">总资产</p>
                        </div>
                    </div>
                    <div class="center-data">
                        <p><i class="color color1"></i>投资总额：<span id="investSum">600000.00</span></p>

                        <p><i class="color color2"></i>冻结金额：<span id="freezeAmount">0.00</span></p>

                        <p><i class="color color3"></i>待收总额：<span id="forPaySum">50000.00</span></p>

                        <p><i class="color color4"></i>奖励金额：<span id="otherEarnAmount">80000.00</span></p>
                    </div>
                </div>
            </div>
            <div id="huifuHtml"></div>

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
                <a target="_blank" href="" style="display:inline-block;text-decoration:none;height:20px;line-height:20px;" class="beian">
                    赣公网安备 36070202000195号</a>

            </p>

        </div>
    </div>
    <script type="text/javascript" src="<%=path%>/static/js/jquery.min.js"></script>
    <script type="text/javascript" src="<%=path%>/static/js/vue.min.js"></script>
    <script type="text/javascript" src="<%=path%>/static/js/axios.min.js"></script>
    <script type="text/javascript" src="<%=path%>/static/layui/layui.js"></script>
    <script type="text/javascript" src="<%=path%>/static/js/user/account.js"></script>
</div>
</body>
</html>