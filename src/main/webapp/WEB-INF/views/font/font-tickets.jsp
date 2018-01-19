
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% String path = request.getContextPath();%>
<html lang="en">
<head>
    <link rel="stylesheet" href="<%=path%>/static/css/user/public.css">
    <link rel="stylesheet" href="<%=path%>/static/css/user/index.css">
    <link rel="stylesheet" href="<%=path%>/static/css/user/account.css">

    <style>
        .invest-content .row11 {
            width: 150px;
        }
        .invest-content .row12 {
            width: 135px;
            padding-top: 15px;
        }
        .invest-list-bottom .invest-row>li{
            margin: 0 auto;
        }
        .bo1{
            overflow:hidden;
        }
        .box1,.bo1,.account2,.zongl,.shenlib{
            width:100%;
            height:auto;
        }
        .sdfsf{
            margin: 0 auto;
        }
        .cc{
            padding-left:50px;
        }

    </style>
    </head>
    <body>
    <div id="ticket-app">
        <%--头部--%>
        <%@include file="../common/top.jsp"%>

        <div class="invest-list creditor-list">
            <div class="wrap">
                <%--非VIP--%>
                <div class=" invest-list-bottom ssm">
                    <div class="box1">
                        <div class="account2" id="account2">
                            <div class="bo1">
                                <div class="zongl " id="zongl">
                                    <div class="account-right-nav">
                                        <div class="sub-a-nav">
                                            <a href="#zongl">优惠券</a><a href="#shenlib">VIP专区</a>
                                        </div>
                                        <em class="em-line"></em>
                                    </div>
                                    <ul class="invest-row listData creditor-row sdfsf " style="width: 700px;">
                                        <li v-for="item in notVipTickets">
                                            <div class="invest-title cl t-row cc"><p>{{item.type| formattkType}}</p>{{item.name}}</div>
                                            <img v-if="item.isvip==0" title="非会员" src="/static/uploads/user/hui.png">
                                            <div class="invest-content cc">
                                                <ul>

                                                    <li class="row11"><p class="row-bottom color">{{item.tkmoney}}	元</p></li>
                                                    <li class="row12"><p class="row-top">有效时间：{{item.tktime}}前可使用</p></li>
                                                    <li class="row12"><p class="row-top"><span>剩余：</span>{{item.tnum}}</p></li>
                                                    <li class="row6"><button type="button" class="btn " onclick="toInvest(411,2)">免费领取</button>
                                                    </li>
                                                </ul>
                                            </div>
                                        </li>
                                    </ul>
                                </div>

                                <%--VIP专区--%>
                                <div class="shenlib" id="shenlib">
                                    <div class="account-right-nav">
                                        <div class="sub-a-nav">
                                            <a href="#zongl">优惠券</a><a href="#shenlib">VIP专区</a>
                                        </div>
                                        <em class="em-line" style="left: 120px;"></em>
                                    </div>
                                    <ul class="invest-row listData creditor-row sdfsf " style="width: 700px;">
                                        <li v-for="item in isVipTickets">
                                            <div class="invest-title cl t-row cc"><p>{{item.type| formattkType}}</p>{{item.name}}</div>
                                            <img v-if="item.isvip==1" title="尊贵会员" src="/static/uploads/user/liang.png">
                                            <div class="invest-content cc">
                                                <ul>
                                                    <li class="row11"><p class="row-bottom color">{{item.tkmoney}}	元</p></li>
                                                    <li class="row12"><p class="row-top">有效时间：{{item.tktime}}前可使用</p></li>
                                                    <li class="row12"><p class="row-top"><span>剩余：</span>{{item.tnum}}</p></li>
                                                    <li class="row6"><button type="button" class="btn " onclick="toInvest(411,2)">免费领取</button>
                                                    </li>
                                                </ul>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>

            <%--尾部部--%>
        <%@include file="../common/footer.jsp"%>
    </div>
    <!-- invest list -->
</body>
<script src="<%=path%>/static/js/jquery-js/jquery.min.js"></script>
<script type="text/javascript" src="<%=path%>/static/js/vue.min.js"></script>
<script type="text/javascript" src="<%=path%>/static/js/axios.min.js"></script>
<script type="text/javascript">
    $(function () {
        var vue = new Vue({
            el:'#ticket-app'
            ,data:{
                notVipTickets:[]
                ,isVipTickets:[]
            }
            ,created () {
                getNotVipTickets();
                getIsVipTickets();
            }
            ,methods:{

            }
            ,filters:{
                formattkType(type){
                    return tkTypeFormat(type);
                }
            }
        });

        function getNotVipTickets() {
            axios.get('/ticket/data/json/ticketsByIsVip?isvip=0').then((response)=>{
                vue.notVipTickets = response.data;
            },(error)=>{
            });
        }
        function getIsVipTickets() {
            axios.get('/ticket/data/json/ticketsByIsVip?isvip=1').then((response)=>{
                vue.isVipTickets = response.data;
            },(error)=>{
            });
        }

        function tkTypeFormat(value) {
            if (value == 0){
                return '代金券';
            }else if (value == 1){
                return '现金券';
            }
        }
    })
</script>
</html>