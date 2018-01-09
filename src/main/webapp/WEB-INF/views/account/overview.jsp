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
    <link rel="stylesheet" href="<%=path%>/static/layui/css/layui.css"/>
    <link rel="stylesheet" href="<%=path%>/static/css/user/public.css">
    <link rel="stylesheet" href="<%=path%>/static/css/user/account.css">
    <link rel="stylesheet" href="<%=path%>/static/layui/css/layui.css"/>
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

        .box1, .bo1, .account2, .ipay, .cash, .taste, .fund, .invest, .claimm, .claimb, .loan, .bank, .safe, .msg, .tuijian, .zongl, .shenlib, .chongz, .zcjl, .tix, .tixjl, .daijj, .jiaxj, .xianjj, .tyj, .tzgl, .skmx, .lzr, .zrz, .yzr, .zrsb, .cygm, .cggm, .jggl, .hkgl, .zdhg, .tjhy, .tjlb {

            width: 900px;
            height: 950px;
        }

        .account2, .ipay, .cash, .taste, .fund, .invest, .claimm, .claimb, .loan, .bank, .safe, .msg, .tuijian, .zongl, .shenlib, .chongz, .zcjl, .tix, .tixjl, .daijj, .jiaxj, .xianjj, .tyj, .tzgl, .skmx, .lzr, .zrz, .yzr, .zrsb, .cygm, .cggm, .jggl, .hkgl, .zdhg, .tjhy, .tjlb {
            padding-top: 30px;
        }

    </style>

</head>
<body>
<%@include file="../common/top.jsp"%>
<div id="app">
<div class="account cl">
    <div class="account-left">
        <div class="account-left-nav">
            <div class="navbar icon icon-account"><a href="#myCount">我的账户</a></div>
            <ul class="sub-nav">
                <li class=""><a href="#account2">账户总览</a></li>
                <li><a href="#ipay">充值</a></li>
                <li><a href="#cash">提现</a></li>

                <li><a id="myCoupon" href="#taste">我的赠券<i id="couponCount"></i></a></li>

                <li><a href="#fund" class="zjjl">资金记录</a></li>
            </ul>
            <div class="navbar icon icon-self">我的管理</div>
            <ul class="sub-nav">
                <li><a href="#invest">投资管理</a></li>
                <li><a href="#loan">借款管理</a></li>
            </ul>
            <div class="navbar icon icon-settings">账户设置</div>
            <ul class="sub-nav">
                <li><a href="#bank">我的银行卡</a></li>
                <li><a href="#safe">安全设置</a></li>
                <li><a href="#msg">消息中心</a></li>
            </ul>
        </div>
        <a href="#tuijian" class="tuijian"><img src="images/tuijian.png"/></a>
    </div>

    <div class="account-right">
        <div class="box1">
            <div class="account2" id="account2">
                <div class="bo1">
                    <div class="zongl " id="zongl">
                        <div class="account-right-nav">
                            <div class="sub-a-nav">
                                <a href="#zongl">账户总览</a><a href="#shenlib">生利宝</a>
                            </div>
                            <em class="em-line"></em>
                        </div>
                        <div class="account-content" style="display: block;">
                            <div class="all-view">
                                <div class="center-view">
                                    <div class="center-header">
                                        <img src="./images/header.png" width="120" height="120">
                                    </div>
                                    <div class="center-self">
                                        <p class="name">18296691307</p>
                                        <p class="safety">安全等级： <span id="safeLevel">高</span></p>
                                        <p id="registpay"><a href="javascript:;">注册汇付</a></p>
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
                                            <p id="allTotal">{{dataRows.zmoney}}</p>
                                            <p class="text">总资产</p>
                                        </div>
                                    </div>
                                    <div class="center-data">
                                        <p><i class="color color1"></i>投资总额：<span id="investSum">{{dataRows.tzmoney}}</span></p>

                                        <p><i class="color color2"></i>冻结金额：<span id="freezeAmount">{{dataRows.djmoney}}</span></p>

                                        <p><i class="color color3"></i>待收总额：<span id="forPaySum">{{dataRows.dsmoney}}</span></p>

                                        <p><i class="color color4"></i>奖励金额：<span id="otherEarnAmount">{{dataRows.jlmoney}}</span></p>
                                    </div>
                                </div>
                            </div>
                            <div id="huifuHtml"></div>

                        </div>
                    </div>

                    <div class="shenlib" id="shenlib">
                        <div class="account-right-nav">
                            <div class="sub-a-nav">
                                <a href="#zongl">账户总览</a><a href="#shenlib">生利宝</a>
                            </div>
                            <em class="em-line" style="left: 120px;"></em>
                        </div>
                        <div class="account-content" style="display: block;">
                            <div class="slb-view" style="display: block;">
                                <div class="slb-all">
                                    <div class="slb-left">
                                        <p><span id="slbSum">10000000.00</span>元</p>
                                        <h1>总金额</h1>
                                        <a href="javascript:slbaoTrading();">转入/转出</a>
                                    </div>
                                    <ul class="slb-right">
                                        <li>
                                            <h2><span id="annuRate">3.235</span>%</h2>
                                            <p>最近7日年化收益率</p>
                                        </li>
                                        <li>
                                            <h2><span id="prdRate">0.788</span>%</h2>
                                            <p>最新收益率</p>
                                        </li>
                                        <li>
                                            <h2><span id="totalProfit">0.00</span>元</h2>
                                            <p>生利宝历史累计收益</p>
                                        </li>

                                    </ul>
                                </div>
                                <div class="slb-govern">
                                    <div class="sub-a-nav">
                                        <a href="javascript:void(0);" class="active slb-to" id="to">转入</a>
                                        <a href="javascript:void(0);" class="slb-go" id="go">转出</a>
                                        <a href="javascript:void(0);" class="slb-sy" id="earn">收益</a>
                                        <em class="em-list"></em>
                                        <div class="account-form cl">
                                            <input type="text" class="date icon icon-date" id="startDate" readonly="readonly">
                                            <p class="text">至</p>
                                            <input type="text" class="date icon icon-date" id="endDate" readonly="readonly">
                                            <button type="button" class="search" id="slbSearch">搜索</button>
                                        </div>
                                    </div>
                                    <div class="govern-list list-a">
                                        <ul class="govern-list-box list-box">
                                            <li class="title">
                                                <div class="children0">日期</div>
                                                <div class="children1">金额（元）</div>
                                                <div class="children2">生利宝余额（元）</div>
                                                <div class="children3">订单号</div>
                                                <div class="children4">信息</div>
                                            </li>
                                        </ul>
                                        <ul class="govern-list-box listData"><li class="none" style="line-height: 60px;">没有符合条件的内容！</li></ul>
                                        <ul class="paging" style="width:340px;margin:30px auto 0;"></ul>
                                    </div>
                                    <div class="govern-list list-c" style="display: none;">
                                        <ul class="govern-list-box list-box">
                                            <li class="title">
                                                <div class="children0">日期</div>
                                                <div class="children1">金额（元）</div>
                                                <div class="children2">生利宝余额（元）</div>
                                                <div class="children3">信息</div>
                                            </li>
                                        </ul>
                                        <ul class="govern-list-box listData"><li class="none" style="line-height: 60px;">没有符合条件的内容！</li></ul>
                                        <ul class="paging"></ul>
                                    </div>
                                </div>
                            </div>
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
                                <p class="tips-title"><b>温馨提示：</b>凡是在普金资本充值未投标的用户，15天以内提现收取本金0.5%，15天以后提现免费 普金资本禁止信用卡套现、虚假交易
                                    等行为,一经发现将予以处罚,包括但不限于：限制收款、冻结账户、永久停止服务,并有可能影响相关信用记录。</p>
                                <div class="pay-from">
                                    <div class="label cl">
                                        <label>充值金额：</label><input type="text" v-model="czmoney" id="ipay-amt" maxlength="18" placeholder="请输入充值金额"><p class="roll">元</p>
                                    </div>
                                    <div class="label cl">
                                        <label>充值类型：</label><img src="images/huifu.png">
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
                                        <label class="long">持卡人：</label><p class="text" id="cash-realName">陈广胜</p>
                                    </div>
                                    <div class="label cl">
                                        <label class="long">可提现金额：</label><p class="text color" id="cash-usableSum">{{dataRows.kymoney}}元</p>
                                    </div>
                                    <div class="label cl label-msg">
                                        <label class="long">提现至银行：</label><input type="text" class="select" >
                                    </div>
                                    <div class="label cl">
                                        <label class="long">提现金额：</label><input type="text" v-model="txmoney"  placeholder="请输入提现金额">
                                    </div>
                                    <%--<div class="label cl">--%>
                                        <%--<label class="long">提现手续费：</label><p class="text">2.00元</p>--%>
                                    <%--</div>--%>
                                    <%--<div class="label cl">--%>
                                        <%--<label class="long">提现服务费：</label><p class="text" id="refreew">0.00</p>--%>
                                    <%--</div>--%>
                                    <!-- <div class="label cl">
                                        <label class="long">交易密码：</label><input type="password" maxlength="16" id="cash-password" autocomplete="new-password" placeholder="请输入交易密码"/>
                                        <p class="text ml10"><a href="recoverpwd.html#deal">忘记密码</a></p>
                                    </div> -->
                                    <%--<div class="label cl">--%>
                                        <%--<label class="long">手机号码：</label><p class="text " id="withdrawPhone">182****1307</p>--%>
                                    <%--</div>--%>
                                    <%--<div class="label cl label-msg">--%>
                                        <%--<label class="long">验证码：</label><input type="text" maxlength="6" id="cash-smsCode" placeholder="请输入短信验证码">--%>
                                        <%--<div class="msg-btn">--%>
                                            <%--<button type="button" id="getMsgCode">获取验证码</button>--%>
                                        <%--</div>--%>
                                    <%--</div>--%>
                                    <button type="button" class="btn long disabled" @click="tixian">立即提现</button>
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
                                <a href="#daijj">代金券</a><a href="#jiaxj">加息券</a>
                                <a href="#xianjj">现金券</a><a href="#tyj">体验金</a>
                            </div>
                            <em class="em-line"></em>
                        </div>
                        <div class="account-content" id="dtaste" style="display: block;">
                            <div class="sub-nav">
                                <a href="javascript:;" class="active" id="Dunused">未使用</a>
                                <a href="javascript:;" id="Dused">已使用</a>
                                <a href="javascript:;" id="Dexpired">已过期</a>
                            </div>
                            <div class="dtaste-listData dtaste-listData1">
                                <ul class="taste-list nouse cl"><li class="none" style="line-height: 60px;">没有符合条件的内容！</li></ul>
                                <ul class="paging"></ul>
                            </div>
                            <!-- <div class="dtaste-listData dtaste-listData3"> -->
                            <!-- <ul class="taste-list overdue cl"> -->
                            <!-- </ul> -->
                            <!-- <ul class="paging">				 -->
                            <!-- </ul> -->
                            <!-- </div> -->
                        </div>
                    </div>

                    <div class="jiaxj " id="jiaxj">
                        <div class="account-right-nav">
                            <div class="sub-a-nav">
                                <a href="#daijj">代金券</a><a href="#jiaxj">加息券</a>
                                <a href="#xianjj">现金券</a><a href="#tyj">体验金</a>
                            </div>
                            <em class="em-line" style="left: 120px;"></em>
                        </div>
                        <div class="account-content" id="dtaste" style="display: block;">
                            <div class="sub-nav">
                                <a href="javascript:;" class="active" id="Dunused">未使用</a>
                                <a href="javascript:;" id="Dused">已使用</a>
                                <a href="javascript:;" id="Dexpired">已过期</a>
                            </div>
                            <div class="dtaste-listData dtaste-listData1">
                                <ul class="taste-list nouse cl"><li class="none" style="line-height: 60px;">没有符合条件的内容！</li></ul>
                                <ul class="paging"></ul>
                            </div>
                            <!-- <div class="dtaste-listData dtaste-listData3"> -->
                            <!-- <ul class="taste-list overdue cl"> -->
                            <!-- </ul> -->
                            <!-- <ul class="paging">				 -->
                            <!-- </ul> -->
                            <!-- </div> -->
                        </div>
                    </div>
                    <div class="xianjj " id="xianjj">
                        <div class="account-right-nav">
                            <div class="sub-a-nav">
                                <a href="#daijj">代金券</a><a href="#jiaxj">加息券</a>
                                <a href="#xianjj">现金券</a><a href="#tyj">体验金</a>
                            </div>
                            <em class="em-line" style="left: 240px;"></em>
                        </div>
                        <div class="account-content" id="dtaste" style="display: block;">
                            <div class="sub-nav">
                                <a href="javascript:;" class="active" id="Dunused">未使用</a>
                                <a href="javascript:;" id="Dused">已使用</a>
                                <a href="javascript:;" id="Dexpired">已过期</a>
                            </div>
                            <div class="dtaste-listData dtaste-listData1">
                                <ul class="taste-list nouse cl"><li class="none" style="line-height: 60px;">没有符合条件的内容！</li></ul>
                                <ul class="paging"></ul>
                            </div>
                            <!-- <div class="dtaste-listData dtaste-listData3"> -->
                            <!-- <ul class="taste-list overdue cl"> -->
                            <!-- </ul> -->
                            <!-- <ul class="paging">				 -->
                            <!-- </ul> -->
                            <!-- </div> -->
                        </div>
                    </div>
                    <div class="tyj " id="tyj">
                        <div class="account-right-nav">
                            <div class="sub-a-nav">
                                <a href="#daijj">代金券</a><a href="#jiaxj">加息券</a>
                                <a href="#xianjj">现金券</a><a href="#tyj">体验金</a>
                            </div>
                            <em class="em-line" style="left: 360px;"></em>
                        </div>
                        <div class="account-content" id="dtaste" style="display: block;">
                            <div class="sub-nav">
                                <a href="javascript:;" class="active" id="Dunused">未使用</a>
                                <a href="javascript:;" id="Dused">已使用</a>
                                <a href="javascript:;" id="Dexpired">已过期</a>
                            </div>
                            <div class="dtaste-listData dtaste-listData1">
                                <ul class="taste-list nouse cl"><li class="none" style="line-height: 60px;">没有符合条件的内容！</li></ul>
                                <ul class="paging"></ul>
                            </div>
                            <!-- <div class="dtaste-listData dtaste-listData3"> -->
                            <!-- <ul class="taste-list overdue cl"> -->
                            <!-- </ul> -->
                            <!-- <ul class="paging">				 -->
                            <!-- </ul> -->
                            <!-- </div> -->
                        </div>
                    </div>

                </div>
                <!-- <div class="account-content" id="dtaste" style="display: block;"> -->
                <!-- <div class="sub-nav"> -->
                <!-- <a href="javascript:;" class="active" id="Dunused">未使用</a> -->
                <!-- <a href="javascript:;" id="Dused">已使用</a> -->
                <!-- <a href="javascript:;" id="Dexpired">已过期</a> -->
                <!-- </div> -->
                <!-- <div class="dtaste-listData dtaste-listData1"> -->
                <!-- <ul class="taste-list nouse cl"><li class="none" style="line-height: 60px;">没有符合条件的内容！</li></ul> -->
                <!-- <ul class="paging"></ul> -->
                <!-- </div> -->
                <!-- <div class="dtaste-listData dtaste-listData2"> -->
                <!-- <ul class="taste-list use cl"> -->
                <!-- </ul> -->
                <!-- <ul class="paging">				 -->
                <!-- </ul>	 -->
                <!-- </div> -->
                <!-- <div class="dtaste-listData dtaste-listData3"> -->
                <!-- <ul class="taste-list overdue cl"> -->
                <!-- </ul> -->
                <!-- <ul class="paging">				 -->
                <!-- </ul> -->
                <!-- </div> -->
                <!-- </div> -->
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
                            <li class="active"><a href="javascript:;" onclick="inout()" >全部</a></li>
                            <li><a href="javascript:;" onclick="inout(0)" >收入</a></li>
                            <li><a href="javascript:;" onclick="inout(1)" >支出</a></li>
                        </ul>
                    </div>
                    <table class="layui-hide" id="logMoney" lay-filter="demo"></table>
                </div>
            </div>


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
                            <div class="sub-nav">
                                <a href="javascript:;" class="active" id="invest-s1">成功借出</a>
                                <a href="javascript:;" id="invest-s2">招标中的借款</a>
                                <a href="javascript:;" id="invest-s3">回款中的借款</a>
                                <a href="javascript:;" id="invest-s4">已回收的借款</a>
                            </div>
                            <div class="account-form cl">
                                <input type="text" class="date icon icon-date" autocomplete="off" id="invest-startDate" readonly="readonly">
                                <p class="text">至</p>
                                <input type="text" class="date icon icon-date" autocomplete="off" id="invest-endDate" readonly="readonly">
                                <button type="button" class="search" id="investSearch">搜索</button>
                            </div>
                            <div class="invest-listData invest-listData1">
                                <ul class="investData list-box">
                                    <li class="title">
                                        <div class="children0">标题</div>
                                        <div class="children1">类型</div>
                                        <div class="children2">年利率</div>
                                        <div class="children3">期限</div>
                                        <div class="children4">还款方式</div>
                                        <div class="children5">投资金额</div>
                                        <div class="children6">投资时间</div>
                                    </li>
                                </ul>
                                <ul class="investData listData"><li class="none" style="line-height: 60px;">没有符合条件的内容！</li></ul>
                                <ul class="paging"></ul>
                            </div>
                        </div>
                    </div>

                </div>
            </div>

            <div class="loan" id="loan">

                <div class="bo1">
                    <div class="jggl " id="jggl">
                        <div class="account-right-nav">
                            <div class="sub-a-nav">
                                <a href="#jggl">借款管理</a><a href="#hkgl">还款明细</a><a href="#zdhg">自动还款设置</a>
                            </div>
                            <em class="em-line"></em>
                        </div>
                        <div class="account-content" style="display: block;">
                            <div class="account-content" id="loan" style="display: block;">
                                <div class="sub-nav">
                                    <a href="javascript:;" class="active" id="loan-s">审核中</a>
                                    <a href="javascript:;" id="loan-z">招标中</a>
                                    <a href="javascript:;" id="loan-c">成功</a>
                                    <a href="javascript:;" id="loan-j">借款明细</a>
                                </div>
                                <div class="account-form account-form-manage cl">
                                    <lable class="lable-long">发布时间：</lable>
                                    <input type="text" class="date icon icon-date" autocomplete="off" id="startDate" readonly="readonly">
                                    <p class="text">至</p>
                                    <input type="text" class="date icon icon-date" autocomplete="off" id="endDate" readonly="readonly">
                                    <!-- <input type="text" placeholder="请输入关键字搜索" class="search icon icon-search" /> -->
                                    <button type="button" class="search" id="loanSearch">搜索</button>
                                </div>
                                <div class="account-form account-form-investor cl">
                                    <input type="text" class="text" autocomplete="off" placeholder="请输入投资者" id="investor">
                                    <button type="button" class="search" id="j-loanSearch">搜索</button>
                                </div>
                                <div class="loan-listData loan-listData1">
                                    <ul class="loanData list-box">
                                        <li class="title title1">
                                            <div class="children0">标题</div>
                                            <div class="children1">类型</div>
                                            <div class="children2">还款方式</div>
                                            <div class="children3">金额（元）</div>
                                            <div class="children4">年利率</div>
                                            <div class="children5">期限</div>
                                            <div class="children6">发布时间</div>
                                            <div class="children7">进度</div>
                                            <div class="children8">状态</div>
                                        </li>
                                    </ul>
                                    <ul class="loanData listData"><li class="none" style="line-height: 60px;">没有符合条件的内容！</li></ul>
                                    <ul class="paging"></ul>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="hkgl " id="hkgl">
                        <div class="account-right-nav">
                            <div class="sub-a-nav">
                                <a href="#jggl">借款管理</a><a href="#hkgl">还款明细</a><a href="#zdhg">自动还款设置</a>
                            </div>
                            <em class="em-line" style="left: 120px;"></em>
                        </div>
                        <div class="account-content" style="display: block;">
                            <div class="account-content" id="repay" style="display: block;">
                                <div class="sub-nav">
                                    <a href="javascript:;" class="active" id="detail-h">还款中</a>
                                    <a href="javascript:;" id="detail-y">已还款</a>
                                    <a href="javascript:;" id="detail-m">还款明细</a>
                                    <a href="javascript:;" id="detail-sm">七天内的还款明细</a>
                                </div>
                                <div class="account-form cl">
                                    <lable class="lable-long">还款时间：</lable>
                                    <input type="text" class="date icon icon-date" autocomplete="off" id="d-startDate" readonly="readonly">
                                    <p class="text">至</p>
                                    <input type="text" class="date icon icon-date" autocomplete="off" id="d_endDate" readonly="readonly">
                                    <!-- <input type="text" placeholder="请输入关键字搜索" class="search icon icon-search" /> -->
                                    <button type="button" class="search" id="detailSearch">搜索</button>
                                </div>
                                <div class="listTable1">
                                    <ul class="detailData list-box">
                                        <li class="title">
                                            <div class="children0">标题</div>
                                            <div class="children1">协议</div>
                                            <div class="children2">借款类型</div>
                                            <div class="children3">借款金额</div>
                                            <div class="children4">年利率</div>
                                            <div class="children5">还款期限</div>
                                            <div class="children6">还款时间</div>
                                            <div class="children7">应还本息</div>
                                            <div class="children8">操作</div>
                                        </li>
                                    </ul>
                                    <ul class="detailData listData"><li class="none" style="line-height: 60px;">没有符合条件的内容！</li></ul>
                                    <ul class="paging detailPaging"></ul>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="zdhg " id="zdhg">
                        <div class="account-right-nav">
                            <div class="sub-a-nav">
                                <a href="#jggl">借款管理</a><a href="#hkgl">还款明细</a><a href="#zdhg">自动还款设置</a>
                            </div>
                            <em class="em-line" style="left: 240px;"></em>
                        </div>
                        <div class="account-content" style="display: block;">
                            <div class="account-content" id="repayEdit" style="display: block;">
                                <p class="tips-title">
                                    <b>自动还款工具说明:</b><br>
                                    a）用户开启自动还款设置后，到达还款日的当天12点15分，如果用户账户正常，即会自动进行还款。<br>
                                    b）保证用户账户可用余额足够支付还款金额，如果还款日当天超过12点15分用户账户可用余额不足而导致自动还款失败，则用户需要进行手动还款，否则会造成还款逾期。
                                </p>
                                <div class="popup-from">
                                    <div class="div_state">
                                        <label class="text_div">账户余额：</label><p class="div_state_text" id="payment_money">0</p>
                                    </div>
                                    <div class="div_state">
                                        <label class="text_div">自动还款状态：</label><p class="div_state_text" id="payment_state">已关闭</p>
                                    </div>
                                    <div class="div_state">
                                        <label class="text_div">操作：</label><p class="div_state_text"><button type="button" class="btn_start" id="payment_btn">开启</button></p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="bank" id="bank">
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
                            <div class="bank-userName">*广胜</div>
                        </div>
                    </div>
                    <div id="card3" class="bank-card_3" onclick="addCard();" style="cursor:pointer;">
                        <div class="bank-addCard"><a href="javascript:;">添加银行卡</a>
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
                        <div class="safe-top">
                            <p class="safe-t-text">您的资料完善度</p>
                            <p class="safe-t-line"><em style="width: 50%;"></em></p>
                            <p class="safe-t-r">中</p>
                        </div>
                        <div class="safe-content">
                            <ul class="safe-list">
                                <li>
                                    <div class="safe-list-1">
                                        <p class="icon icon-true" id="cellPhone-icon">手&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;机</p>
                                    </div>
                                    <div class="safe-list-2" id="cellPhone-text">1829****307</div>
                                    <div class="safe-list-3">
                                        <a href="javascript:;" id="cellPhone" class="on">已绑定</a>
                                        <a href="javascript:;" id="changePhone">修改</a>
                                    </div>
                                </li>
                                <li>
                                    <div class="safe-list-1">
                                        <p class="icon icon-wrong" id="email-icon">邮&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;箱</p>
                                    </div>
                                    <div class="safe-list-2" id="email-text">获取最新的投资讯息和账户信息变动通知</div>
                                    <div class="safe-list-3">
                                        <a href="javascript:;" id="email">进行绑定</a>
                                    </div>
                                </li>
                                <li>
                                    <div class="safe-list-1">
                                        <p class="icon icon-true" id="realName-icon">身份认证</p>
                                    </div>
                                    <div class="safe-list-2" id="realName-text">**胜    ****311***********</div>
                                    <div class="safe-list-3">
                                        <a href="javascript:;" id="realName" class="on">已认证</a>
                                    </div>
                                </li>
                                <li>
                                    <div class="safe-list-1">
                                        <p class="icon icon-true">登录密码</p>
                                    </div>
                                    <div class="safe-list-2">
                                        ******
                                    </div>
                                    <div class="safe-list-3">
                                        <a href="javascript:;" id="password-btn">修改</a>
                                    </div>
                                </li>
                                <li>
                                    <div class="safe-list-1">
                                        <p class="icon icon-true">交易密码</p>
                                    </div>
                                    <div class="safe-list-2">
                                        ******
                                    </div>
                                    <div class="safe-list-3">
                                        <a href="javascript:;"  id="dealpwd"></a>
                                        <a href="recoverpwd.html#deal"  id="forgetpwd">忘记密码</a>
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
                    <div class="sub-nav" style="margin-top: 15px;">
                        <a href="javascript:;" onclick="deleteMsg();" id="delSys">删除</a>
                        <a href="javascript:;" onclick="readedSys();" id="readedSys">标为已读</a>
                        <a href="javascript:;" onclick="unReadSys();" id="unReadSys">标为未读</a>
                    </div>

                    <div class="msg-list">
                        <div class="account-list">
                            <ul class="cash-list-box listData">
                                <li class="title">
                                    <div class="children0"><input type="checkbox" name="checkbox" id="checkbox" onclick="checkAll_Sys(this);"><span>状态</span></div>
                                    <div class="children1">来源</div>
                                    <div class="children2">标题</div>
                                    <div class="children3">日期</div>
                                </li>
                            </ul>
                            <ul class="msg-list listData"><li class="none" style="line-height: 60px;">没有符合条件的内容！</li></ul>
                            <ul class="paging"></ul>
                        </div>
                    </div>
                </div>
            </div>

            <div class="tuijian" id="tuijian">

                <div class="bo1">
                    <div class="tjhy " id="tjhy">
                        <div class="account-right-nav">
                            <div class="sub-a-nav">
                                <a href="#tjhy">推荐好友</a><a href="#tjlb">推荐列表</a>
                            </div>
                            <em class="em-line"></em>
                        </div>
                        <div class="account-content">
                            <div class="tuiJianShow">
                                <img src="images/banner_t.png" width="896" height="260">
                                <p class="tj-tips">尊敬的用户,您的推荐号为：<span id="uid">111193</span></p>
                                <p class="tj-text">活动时间：<span>2017年12月15日—2018年1月15日；</span></p>
                                <p class="tj-text">活动对象：活动期间新注册用户的推荐人；</p>
                                <p class="tj-text">活动说明：1.	活动期间邀请好友注册并累计投资满10000元，得50元现金券奖励；</p>
                                <p class="tj-text" style="padding-left: 70px;">2.	活动期间内成功邀请5位以上好友注册投资成功合计满100000，可额外获得500元现金券奖励，可在<span>【我的账户-我的赠券】</span>中查看。</p>
                                <p class="tj-text" style="padding-left: 70px;">(满足活动条件的用户在活动结束后3个工作日内奖励将以现金券的形式发放至用户账户)</p>
                                <p class="tj-text"><span>注：</span>需将自己的邀请链接地址或推荐号发给您的好友，这样您才能成为他的邀请者。</p>
                                <div class="tj-clip" id="tj-clip">
                                    <p class="tj-clip-text" id="tj-clip-text">https://www.pujinziben.com/regist.html?useCode=111193</p>
                                    <button type="button" class="tj-clip-btn" id="tj-clip-btn">复制链接</button>
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
                            <div class="tuijian-list" style="display: block;">
                                <div class="account-form cl">
                                    <input type="text" class="date icon icon-date" id="startDate" readonly="readonly">
                                    <p class="text">至</p>
                                    <input type="text" class="date icon icon-date" id="endDate" readonly="readonly">
                                    <button type="button" class="search" id="cashSearch">搜索</button>
                                </div>
                                <div class="account-list">
                                    <ul class="cash-list-box list-box">
                                        <li class="title">
                                            <div class="children01">用户名</div>
                                            <div class="children02">用户创建时间</div>
                                            <div class="children03">奖励金额</div>
                                            <div class="children04">操作</div>
                                        </li>
                                    </ul>
                                    <ul class="tuijian-list listData" style="display: block;"><li class="none" style="line-height: 60px;">没有符合条件的内容！</li></ul>
                                    <ul class="paging"></ul>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>

            <div class="tuijian-list" style="display: none;">
                <div class="account-form cl">
                    <input type="text" class="date icon icon-date" id="startDate">
                    <p class="text">至</p>
                    <input type="text" class="date icon icon-date" id="endDate">
                    <button type="button" class="search" id="cashSearch">搜索</button>
                </div>
                <!-- <div class="account-list"> -->
                <!-- <ul class="cash-list-box list-box"> -->
                <!-- <li class="title"> -->
                <!-- <div class="children01">用户名</div> -->
                <!-- <div class="children02">用户创建时间</div> -->
                <!-- <div class="children03">奖励金额</div> -->
                <!-- <div class="children04">操作</div> -->
                <!-- </li> -->
                <!-- </ul> -->
                <!-- <ul class="tuijian-list listData" style="display: none;"> -->

                <!-- </ul> -->
                <!-- <ul class="paging"> -->

                <!-- </ul> -->
                <!-- </div> -->
            </div>

            <div class="investList" style="display: none;">
                <div class="account-form cl">
                    <p class="text" style="width: 120px;">借款发布时间:</p>
                    <input type="text" class="date icon icon-date" autocomplete="off" id="invest-startDate">
                    <p class="text">至</p>
                    <input type="text" class="date icon icon-date" autocomplete="off" id="invest-endDate">
                    <!-- <input type="text" placeholder="请输入关键字搜索" class="search icon icon-search" /> -->
                    <button type="button" class="search" id="investSearch">搜索</button>
                </div>
                <!-- <div class="invest-listData invest-listData1"> -->
                <!-- <ul class="investData list-box"> -->
                <!-- <li class="title"> -->
                <!-- <div class="children0">标题</div> -->
                <!-- <div class="children1">类型</div> -->
                <!-- <div class="children2">年利率</div> -->
                <!-- <div class="children3">期限</div> -->
                <!-- <div class="children4">还款方式</div> -->
                <!-- <div class="children5">投资金额</div> -->
                <!-- <div class="children6">投资时间</div> -->
                <!-- </li> -->
                <!-- </ul> -->
                <!-- <ul class="investData listData"> -->
                <!-- </ul> -->
                <!-- <ul class="paging"> -->
                <!-- </ul> -->
                <!-- </div> -->
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
    <%@include file="../common/footer.jsp"%>
</div>
</body>
<script src="/static/js/jquery.min.js"></script>
<script src="/static/js/vue.min.js"></script>
<script src="/static/js/axios.min.js"></script>
<script src="/static/js/qs.js"></script>
<script src="/static/layui/layui.all.js"></script>
<script>

    new Vue({
       el:'#app',
        data:{
           dataRows:[],
           czmoney:'',
           txmoney:''
        },
        created () {
            this.getUserMoney();
        },
        methods:{
            getUserMoney(){
                axios.get('/userMoney/data/json/selectBanlance').then((response)=>{
                    this.dataRows = response.data.data;
                },(error)=>{

                });
            },
            chongzhi(){
                axios.get('/logCz/data/json/recharge?money='+this.czmoney).then((response)=>{
                   alert(response.data.message);
                },(error)=>{

                });
            },
            tixian(){
                if(this.txmoney>this.dataRows.kymoney){
                    alert("提现大于可用");
                    return;
                }else if(this.txmoney==''){
                    alert("请输入提现金额");
                    return;
                }
                axios.get('/LogTx/data/json/withdraw?money='+this.txmoney).then((response)=>{
                    alert(response.data.message);
                },(error)=>{

                });
            }
        }
    });



    layui.use([ 'laypage', 'layer', 'table', 'element'], function(){
        var laypage = layui.laypage //分页
        layer = layui.layer //弹层
            ,table = layui.table //表格
            ,element = layui.element; //元素操作
        //执行一个 table 实例
        $(".czjl").on('click',function () {
            table.render({
                elem: '#logcz'
                ,height: 332
                ,url: '/logCz/data/json/pager' //数据接口
                ,page: true //开启分页
                ,limit:10//每页显示多少个
                //后台Pager响应对象 不要动
                ,response: {
                    statusName: 'status'
                    ,statusCode: 0
                    ,msgName: 'message'
                    ,countName: 'total'
                    ,dataName: 'rows'
                }
                //后台Pager响应对象 不要动
                //表头
                ,cols: [[
                    {field: 'bankcard', title: '充值卡号', width:220}
                    ,{field: 'banktype', title: '所属银行', width:220}
                    ,{field: 'money', title: '充值金额', width:220,sort: true}
                    ,{field: 'createdTime', title: '充值时间', width:235,sort: true}
                ]]
                //表头
            });
        });
        $(".txjl").on('click',function () {
            table.render({
                elem: '#logtx'
                ,height: 332
                ,url: '/LogTx/data/json/pager' //数据接口
                ,page: true //开启分页
                ,limit:10//每页显示多少个
                //后台Pager响应对象 不要动
                ,response: {
                    statusName: 'status'
                    ,statusCode: 0
                    ,msgName: 'message'
                    ,countName: 'total'
                    ,dataName: 'rows'
                }
                //后台Pager响应对象 不要动
                //表头
                ,cols: [[
                    {field: 'bankcard', title: '提现卡号', width:200}
                    ,{field: 'banktype', title: '所属银行', width:200}
                    ,{field: 'money', title: '提现金额', width:200,sort: true}
                    ,{field: 'createdTime', title: '提现时间', width:200,sort: true}
                    ,{field: 'status', title: '提现状态', width:200, templet:'<div>{{ statusGe(d.status)}}</div>'}


                ]]
                //表头
            });
        });
        //资金记录/logMoney/data/json/pager
        $(".zjjl").on('click',function () {
            zjjl();
        });

    });

    function statusGe(value) {
        if(value==0){
            return"未受理";
        }else if(value==1){
            return "提现成功";
        }else if(value==2){
            return "提现失败";
        }
    }
    function typeGe(value) {
        if (value == 0) {
            return "收入";
        } else if(value==1){
            return "支出";
        }
    }

    function inout(value) {
        zjjl(value);
    }

    function zjjl(type) {
        table.render({
            elem: '#logMoney'
            ,height: 332
            ,url: '/logMoney/data/json/pager' //数据接口
            ,where:{'type':type}
            ,page: true //开启分页
            ,limit:10//每页显示多少个
            //后台Pager响应对象 不要动
            ,response: {
                statusName: 'status'
                ,statusCode: 0
                ,msgName: 'message'
                ,countName: 'total'
                ,dataName: 'rows'
            }
            //后台Pager响应对象 不要动
            //表头
            ,cols: [[
                {field: 'type', title: '类型', width:220,templet:'<div>{{ typeGe(d.type)}}</div>'}
                ,{field: 'income', title: '收入', width:220}
                ,{field: 'outlay', title: '支出', width:220}
                ,{field: 'createdTime', title: '时间', width:235,sort: true}
            ]]
            //表头
        });
    }
</script>
</html>