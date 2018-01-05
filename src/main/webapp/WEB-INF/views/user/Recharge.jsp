<%--
  Created by IntelliJ IDEA.
  User: qm
  Date: 2018/1/3
  Time: 15:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% String path = request.getContextPath();%>
<html>
<head>
    <title>我的账户—普金资本-安全可靠专注于供应链金融的国资背景P2P理财平台</title>
    <link rel="stylesheet" href="<%=path%>/static/layui/css/layui.css"/>
    <link rel="stylesheet" href="<%=path%>/static/css/user/public.css">
    <link rel="stylesheet" href="<%=path%>/static/css/user/account.css">
    <link rel="stylesheet" href="<%=path%>/static/css/user/datepicker.css">
    <link rel="stylesheet" href="<%=path%>/static/css/user/login.css">
    <link rel="icon" href="<%=path%>/static/images/index/logo_title.jpg" type="image/x-icon"/>
</head>
<body>
<%@include file="../common/top.jsp"%>

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
        <a href="#tuijian" class="tuijian"><img src="picture/tuijian.png"/></a>
    </div>

    <div class="account-right">
        <div class="account-right-nav">
            <div class="sub-a-nav">
                <a href="javascript:void(0);" class="show-ipay">充值</a>
                <a href="javascript:void(0);" class="show-ipay-list active">充值记录</a>
            </div>
            <em class="em-line" style="left: 120px;"></em>
        </div>
        <div class="account-content">
            <!-- 充值 -->
            <div class="ipay-pay" style="display: none;">
                <p class="tips-title"><b>温馨提示：</b>凡是在普金资本充值未投标的用户，15天以内提现收取本金0.5%，15天以后提现免费 普金资本禁止信用卡套现、虚假交易
                    等行为,一经发现将予以处罚,包括但不限于：限制收款、冻结账户、永久停止服务,并有可能影响相关信用记录。</p>
                <div class="pay-from">
                    <div class="label cl">
                        <label>充值金额：</label><input type="text" id="ipay-amt" maxlength="18" placeholder="请输入充值金额"><p class="roll">元</p>
                    </div>
                    <div class="label cl">
                        <label>充值类型：</label><img src="resources/front/v01/src/images/huifu.png">
                    </div>
                    <button type="button" class="btn" id="ipay-submit">立即充值</button>
                </div>
                <div id="alipay"></div>
            </div>
            <!-- 充值记录 -->
            <div class="ipay-list" style="display: block;">
                <div class="account-form cl">
                    <input type="text" class="date icon icon-date" id="startDate" readonly="readonly">
                    <p class="text">至</p>
                    <input type="text" class="date icon icon-date" id="endDate" readonly="readonly">
                    <!-- <input type="text" placeholder="请输入关键字搜索" class="search icon icon-search" /> -->
                    <button type="button" class="search" id="ipaySearch">搜索</button>
                </div>
                <div class="account-list">
                    <ul class="ipay-list-box list-box">
                        <li class="title">
                            <div class="children0">账户名</div>
                            <div class="children1">充值金额</div>
                            <div class="children2">充值类型</div>
                            <div class="children3">充值时间</div>
                            <div class="children4">充值状态</div>
                        </li>
                    </ul>
                    <ul class="ipay-list-box listData"><li class="none" style="line-height: 60px;">没有符合条件的内容！</li></ul>
                    <ul class="paging"></ul>
                </div>
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
<script type="text/javascript" src="<%=path%>/static/js/jquery-js/jquery.min.js"></script>
<script type="text/javascript" src="<%=path%>/static/js/vue.min.js"></script>
<script type="text/javascript" src="<%=path%>/static/js/axios.min.js"></script>
<script type="text/javascript" src="<%=path%>/static/layui/layui.js"></script>
<script type="text/javascript" src="<%=path%>/static/js/qs.js"></script>
</body>
</html>
