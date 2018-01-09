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

<div id="app">
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
        <a href="#tuijian" class="tuijian"><img src="<%=path%>/static/css/images/tuijian.png"/></a>
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
            <!-- 充值记录 -->
            <div class="layui-form">
                <div class="ipay-list" style="display: block;">
                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label">开始日期</label>
                            <div class="layui-input-inline">
                                <input type="text" class="layui-input" v-model="dateQuery.startTime"
                                       id="date1" placeholder="yyyy-MM-dd">
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">结束日期</label>
                            <div class="layui-input-inline">
                                <input type="text" class="layui-input" v-model="dateQuery.endTime"
                                       id="date2" placeholder="yyyy-MM-dd">
                            </div>
                        </div>
                        <button class="layui-btn layui-btn-primary" @click="">
                            <i class="layui-icon">&#xe615;</i>搜索
                        </button>
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
                            <li class="title" v-for="rechargeVO in rows">
                                <div class="children0">${sessionScope.user.rname}</div>
                                <div class="children1">{{rechargeVO.money}}</div>
                                <div class="children2">{{rechargeVO.type}}</div>
                                <div class="children3">{{rechargeVO.createdTime}}</div>
                                <div class="children4">{{rechargeVO.status}}</div>
                            </li>
                        </ul>
                        <div id="demo3"></div>
                    </div>
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
    <%@include file="../common/right.jsp" %>
</div>
    <%@include file="../common/footer.jsp" %>
</div>
<script type="text/javascript" src="<%=path%>/static/js/jquery-js/jquery.min.js"></script>
<script type="text/javascript" src="<%=path%>/static/js/vue.min.js"></script>
<script type="text/javascript" src="<%=path%>/static/js/axios.min.js"></script>
<script type="text/javascript" src="<%=path%>/static/layui/layui.js"></script>
<script type="text/javascript" src="<%=path%>/static/js/qs.js"></script>
<script>
    layui.use('laydate', function () {
        var laydate = layui.laydate;
        laydate.render({
            elem: '#date1'
            , type: 'datetime'
        });

        laydate.render({
            elem: '#date2'
            , type: 'datetime'
        });

        laydate.render({
            elem: '#date3'
            , type: 'datetime'
        });

        laydate.render({
            elem: '#date4'
            , type: 'datetime'
        });

        laydate.render({
            elem: '#date5'
            , type: 'datetime'
        });

        laydate.render({
            elem: '#date6'
            , type: 'datetime'
        });

    });

    var laypage;
    layui.use(['laypage','layer','element'], function(){
        var element = layui.element;
        laypage = layui.laypage
        vue.getJsonRecharge(laypage);
    });
    var vue = new Vue({
        el:"#app",
        data:{
            rows:[],
            dateQuery:{
                startTime:'',
                endTime:''
            }
        },
        created () {
        },
        computed: {

        },
        methods:{
            search () {
                this.getJsonRecharge(laypage);
            },
            getJsonRecharge(laypage){
                $.getJSON('/logCz/data/json/pager_criteria', {
                    pageNumber: 1,
                    pageSize: 5,
                    dateQuery:vue.dateQuery
                }, function(res){
                    laypage.render({
                        elem: 'recharge',
                        count: res.total,
                        limit :5,
                        jump: function(e, first){
                            if (!first) {
                                vue.getJsonRechargeList(e);
                            } else {
                                vue.getJsonRechargeList(e);
                            }
                        }
                    });
                });
            },
            getJsonRechargeList (e) {
                $.getJSON('/logCz/data/json/pager_criteria', {
                    pageNumber: e.curr,
                    pageSize: e.limit,
                    dateQuery:vue.dateQuery
                }, function (res) {
                    vue.rows = res.rows;
                });
            },
        },
        watch:{

        }
    });
</script>
</body>
</html>
