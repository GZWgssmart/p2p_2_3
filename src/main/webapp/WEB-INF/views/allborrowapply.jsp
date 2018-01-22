<%--
  Created by IntelliJ IDEA.
  User: Animo
  Date: 2017-12-26
  Time: 12:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>

<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="<%=path%>/static/css/index/public.css">
    <link rel="stylesheet" href="<%=path%>/static/css/index/index.css">
    <link rel="stylesheet" href="<%=path%>/static/layui/css/layui.css">
</head>
<body>
<%@include file="common/top.jsp"%>
<div id="app">
<!-- invest list -->
<div class="invest-list creditor-list">
    <div class="wrap">
        <div class="invest-top">
            <div class="invest-top-left">
                <div class="invest-top-list">
                    <p>项目期限：</p>
                    <ul class="cl" id="term">
                        <li class="active"><a href="javascript:;" @click="month()">全部</a></li>
                        <li><a href="javascript:;" @click="month(1,3)">1-3个月</a></li>
                        <li><a href="javascript:;" @click="month(3,6)">3-6个月</a></li>
                        <li><a href="javascript:;" @click="month(6,9)">6-9个月</a></li>
                        <li><a href="javascript:;" @click="month(9)">大于9个月</a></li>
                    </ul>
                </div>
                <div class="invest-top-list">
                    <p>年化收益：</p>
                    <ul id="nprofit">
                        <li class="active"><a href="javascript:;" @Click="earnings()">全部</a></li>
                        <li><a href="javascript:;" @Click="earnings(0,10)"><=10%</a></li>
                        <li><a href="javascript:;" @Click="earnings(10,15)">10%-15%</a></li>
                        <li><a href="javascript:;" @Click="earnings(15,25)">15%-25%</a></li>
                    </ul>
                </div>
                <div class="invest-top-list">
                    <p>项目类型：</p>
                    <ul id="bz">
                        <li><a href="javascript:;" @Click="bz()">全部</a></li>
                        <li><a href="javascript:;" @Click="bz(2)">多金宝</a></li>
                        <li><a href="javascript:;" @Click="bz(4)">普金保</a></li>
                        <li><a href="javascript:;" @Click="bz(1)">恒金保</a></li>
                        <li><a href="javascript:;" @Click="bz(3)">新手标</a></li>
                    </ul>
                </div>
            </div>
            <div class="invest-top-right">
                <div class="invest-top-list">
                    <div class="textmiddle">借款标题</div>
                    <input type="text" class="text" v-model="cpname" />
                    <button type="button" class="search" @click="search()">搜索</button>
                </div>
            </div>
        </div>
        <div class="invest-list-bottom">
            <ul class="invest-row listData creditor-row" >

                <li v-for="item in rows">
                    <div class="invest-title cl"><p>{{item.bzname}}</p><h3><a @click="detail(item.baid,item.bdid,item.bzname)">{{item.cpname}}</a></h3></div>
                    <div class="invest-content cl">
                        <ul>
                            <li class="row1"><p class="row-top">预期年化收益率</p><p class="row-bottom color">{{item.nprofit}}<span>%</span></p></li>
                            <li class="row2"><p class="row-top">项目期限</p><p class="row-bottom">{{item.term}}个月</p></li>
                            <li class="row3"><p class="row-top">还款方式</p><p class="row-bottom">{{item.way | wayFilter}}</p></li>
                            <li class="row4"><p class="row-top">可投金额 / 募集总额</p><p class="row-bottom">{{item.money-item.ymoney | money}}元 / {{item.money | money}}元</p></li>
                            <li class="row5">
                                <p class="row-top">募集进度</p>
                                <div class="layui-progress" style="float: left;width: 100px;margin-top: 13px" lay-showPercent="yes">
                                    <div class="layui-progress layui-progress-bar layui-bg-red" v-bind:lay-percent="item.ymoney/item.money*100 + '%'"></div>
                                </div>
                                {{item.ymoney/item.money*100 |formatNumber}}%
                            </li>
                            <li class="row6">
                                <button v-if="item.ckstatus==2" type="button" class="btn" @click="detail(item.baid,item.bdid,item.bzname)">立即投标</button>
                                <button v-else type="button" class="btn disabled">还款中</button>
                            </li>`
                        </ul>
                    </div>
                </li>

            </ul>
            <div id="demo3"></div>
        </div>
    </div>
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
                <a target="_blank" href="http://weibo.com/pujinziben" class="about_wb"></a>
                <a href="javascript:void(0);" class="about_wx line_02">
						<span class="line_l_h">
							<span class="line_l_sj"></span>
							<span class="line_l_text">关注普金资本公众号</span>
							<span class="line_l_pic"></span>
						</span>
                </a>
                <a target="_blank" href="tencent://message/?uin=2311960484&amp;Site=&amp;Menu=yes" class="about_qq"></a>
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
</div>
</body>
<script src="<%=path%>/static/js/jquery.min.js"></script>
<script src="<%=path%>/static/js/axios.min.js/"></script>
<script src="<%=path%>/static/js/vue.min.js/"></script>
<script src="<%=path%>/static/layui/layui.js"></script>
<script src="/static/layui/lay/modules/element.js"></script>
<script src=/static/js/common.js></script>
<script>
    var laypage;
    layui.use(['laypage','layer'], function(){
        laypage = layui.laypage
            vue.getJsonShang(laypage);
    });

    function searchBorrow(demoId) {
        if(demoId !== '') {
            $('#'+ demoId +' li').removeClass('active');
            $('a').click(
                function(){
                    $(this).parent().attr('class','active');
                });
        }
    }

    var vue = new Vue({
        el:"#app",
        data:{
            bzid:${requestScope.get("bzid")},
            rows:[],
            qterm:'',
            hterm:'',
            qprofit:'',
            hprofit:'',
            cpname:''
        },
        filters: {
            wayFilter(way){
                return sway(way);
            },
            money (value) {
                return formatMoney(value,2);
            },
            formatNumber(value){
                if(value==Infinity){
                    return 0;
                }
                return value.toFixed(2);
            },
        },
        created () {
        },
        computed: {

        },
        methods:{
            month (qterm,hterm) {
                this.qterm=qterm;
                this.hterm=hterm;
                this.getJsonShang(laypage);
                searchBorrow('term');
            },
            earnings (qprofit,hprofit) {
                this.qprofit = qprofit;
                this.hprofit = hprofit;
                this.getJsonShang(laypage);
                searchBorrow('nprofit');
            },
            bz (bzid) {
                this.bzid=bzid;
                this.getJsonShang(laypage);
                searchBorrow('bz');
            },
            search () {
                this.getJsonShang(laypage);
            },
            getJsonShang(laypage){
                $.getJSON('/borrowapply/data/json/PagerCriteria', {
                    pageNumber: 1,
                    pageSize: 5,
                    bzid:this.bzid,
                    qterm:this.qterm,
                    hterm:this.hterm,
                    qprofit:this.qprofit,
                    hprofit:this.hprofit,
                    cpname:this.cpname
                }, function(res){
                    laypage.render({
                        elem: 'demo3',
                        count: res.total,
                        limit :5,
                        jump: function(e, first){
                            if (!first) {
                                vue.getJsonXia(e);
                            } else {
                                vue.getJsonXia(e);
                            }
                        }
                    });
                });
            },
            getJsonXia (e) {
                $.getJSON('/borrowapply/data/json/PagerCriteria', {
                    pageNumber: e.curr,
                    pageSize: e.limit,
                    bzid:this.bzid,
                    qterm:this.qterm,
                    hterm:this.hterm,
                    qprofit:this.qprofit,
                    hprofit:this.hprofit,
                    cpname:this.cpname
                }, function (res) {
                    vue.rows = res.rows;
                });
            },
            detail (baid,bdid,bzname) {
                window.location.href='/borrowapply/info/'+baid+'/'+bdid+'/'+bzname
            }
        },
        watch:{

        }
    });
</script>
</html>
