<%--
  Created by IntelliJ IDEA.
  User: CHEN JX
  Date: 2018/1/16
  Time: 9:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>理财工具箱-普金资本-安全可靠专注于供应链金融的国资背景P2P理财平台</title>
    <meta name="description" content="普金资本是目前国内拥有国资系背景的P2P理财平台，为P2P网贷和理财用户提供安全、高效的互联网金融理财服务。普金资本，以“国资系、可信赖”的企业理念，为理财用户提供安全稳定的网上理财通道，快速实现资金周转，实现财富稳定增长。" />
    <link rel="stylesheet" href="/static/css/index/public.css">
    <link rel="stylesheet" href="/static/css/index/index.css">
</head>
<link rel="icon" href="resources/front/v01/src/images/logo_title.jpg" type="image/x-icon" />
<body>
<%@include file="./common/top.jsp"%>
</div>
<div class="calculator" id="app">
    <div class="calculator-top">
        <h3>收益计算器</h3>
        <ul class="calculator-from">
            <li>
                <p class="top">投资金额（元）</p>
                <p class="bottom"><input type="text" v-model.number="calcQuery.totalMoney"  class="input-text" /></p>
            </li>
            <li>
                <p class="top">年化收益率（%）</p>
                <p class="bottom"><input type="text" v-model.number="calcQuery.nprofit" class="input-text" /></p>
            </li>

            <li>
                <p class="top">还款期限<span id="repayTime">（月）</span></p>
                <p class="bottom">
                    <select class="input-text" v-model="calcQuery.month" />
                        <option value="12" selected>12月</option>
                        <option value="6">6月</option>
                        <option value="3">3月</option>
                    </select>
                </p>
            </li>
            <li>
                <p class="top">还款方式</p>
                <p class="bottom">
                    <select class="input-text" v-model="calcQuery.type"/>
                    <option value="1" selected>等额本息</option>
                    <option value="0">等额本金</option>
                    </select>
                </p>
            </li>
            <li>
                <p class="top"></p>
                <p class="bottom">
                    <button type="button" class="btn" @click="add">开始计算</button>
                </p>
            </li>
        </ul>
    </div>
    <div class="calculator-bottom">
        <div class="auth">
            <p><span class="big">计算结果</span>（<span id="qishu3">每个月</span>将偿还/收到：<span class="color" id="monAmt">0.00</span>元 月利率：<span class="rate"  id="monRate">0.00</span> 还款/收到本息总额：<span class="color" id="allPay">0.00</span>元）</p>
        </div>
        <ul class="list-box" id="qishu1">
            <li class="title">
                <div class="children0" >期数</div>
                <div class="children1">月还金额</div>
                <div class="children2">支付本金</div>
                <div class="children3">利息</div>
                <div class="children4">剩余本金</div>
            </li>
        </ul>
        <ul class="list-box listData" id="qishu2">
            <li v-for="(item,index) in calcs" class="interval">
                <div class="children0">{{index + 1}}</div>
                <div class="children1">{{item.repayment}}</div>
                <div class="children2">{{item.payPrincipal}}</div>
                <div class="children3">{{item.interest}}</div>
                <div class="children4">{{item.remainTotal}}</div>
            </li>
        </ul>
    </div>
</div>
<div id="ajaxFooter"></div>
<%@include file="common/footer.jsp"%>
<script type="text/javascript" src="/static/js/font/jquery.js"></script>
<script type="text/javascript" src="/static/js/font/public.js"></script>
<!-- 客服QQ -->
<script charset="utf-8" type="text/javascript" src="/static/js/font/wpa.js"></script>
<%--<script type="text/javascript" src="/static/js/font/calculator.js"></script>--%>
<script type="text/javascript" src="/static/js/qs.js"></script>
</body>
<script>
    new Vue({
       el:"#app",
        data:{
            calcQuery:{
                totalMoney:0,
                nprofit:0,
                type:1,
                month:12
            },
            calcs:[]
        },
        methods:{
            add () {
                axios.post('/data/calc/calc',Qs.stringify(this.calcQuery)).then((response)=>{
                    this.calcs = response.data.data
                },(error)=>{

                });
            }
        }
    });
</script>
</html>