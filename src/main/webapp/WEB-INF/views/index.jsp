<%--
  Created by IntelliJ IDEA.
  User: Animo
  Date: 2017-12-25
  Time: 19:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>普金资本-安全可靠专注于供应链金融的国资背景P2P理财平台</title>
    <meta name="keywords" content="普金资本，互联网金融，P2P理财，供应链金融，网络贷款，银行存管"/>
    <meta name="description"
          content="普金资本是目前国内拥有国资系背景的P2P理财平台，为P2P网贷和理财用户提供安全、高效的互联网金融理财服务。普金资本，以“国资系、可信赖”的企业理念，为理财用户提供安全稳定的网上理财通道，快速实现资金周转，实现财富稳定增长。"/>
    <link rel="stylesheet" href="<%=path%>/static/css/index/public.css">
    <link rel="stylesheet" href="<%=path%>/static/css/index/index.css">
    <link rel="stylesheet" href="<%=path%>/static/layui/css/layui.css">
</head>
<link rel="icon" href="" type="image/x-icon"/>
<body>
<%@include file="common/top.jsp"%>
<div id="app">
<div class="top" id="top">
    <!-- top -->
<!-- banner -->
<div class="banner">
    <div class="banner-box">
        <a href="" alt="网站备案获准"><img src="picture/banner_010.jpg"></a>
        <a href="" alt="债权转让" target="_blank"><img src="picture/banner_009.jpg"></a>
        <a href="" alt="供应链金融" target="_blank"><img src="picture/banner_001.jpg"></a>
        <a href="" alt="5大安全措施" target="_blank"><img src="picture/banner_002.jpg"></a>
    </div>
    <!-- <div class="banner-pointer">
        <ul>
            <li class="active"><a href="javascript:void(0);"></a></li>
            <li><a href="javascript:void(0);"></a></li>
            <li><a href="javascript:void(0);"></a></li>
            <li><a href="javascript:void(0);"></a></li>
            <li><a href="javascript:void(0);"></a></li>
        </ul>
    </div> -->
</div>
<!-- news -->
<div class="news">
    <div class="wrap">
        <div class="news-list icon icon-news">
            <ul id="news-list" style="height: 192px; top: -48px;">
                <li><span>新标预告&nbsp;&nbsp;|&nbsp;&nbsp;</span><a href="" target="_blank">2017年12月24日新标预告</a></li>
                <li><span>新标预告&nbsp;&nbsp;|&nbsp;&nbsp;</span><a href="" target="_blank">2017年12月24日新标预告</a></li>
                <li><span>平台公告&nbsp;&nbsp;|&nbsp;&nbsp;</span><a href="" target="_blank">关于多金宝项目正常还款的公告</a></li>
                <li><span>平台公告&nbsp;&nbsp;|&nbsp;&nbsp;</span><a href="" target="_blank">关于新手标项目正常还款的公告</a></li>
            </ul>
        </div>
        <div class="bang-list">
            <a href="" target="_blank" class="icon icon-bang">投资、推荐排行榜</a>
        </div>
    </div>
</div>
<!-- statis -->
<div class="statis">
    <div class="wrap">
        <div class="statis-main">
            <ul class="statis-top cl">
                <li class="first"><p>普金资本高收益网络借贷信息中介平台</p></li>
                <li class="center"><p>累计投资金额：<span id="investAmount">31,768,031.00</span><span class="small">元</span>
                </p></li>
                <!--<li class="center"><p>累计赚取收益：<span id="hasInterest">0</span><span class="small">元</span></p></li>-->
                <li class="last"><p>累计注册投资人：<span id="userTotal">66666</span><span class="small">人</span></p></li>
            </ul>
            <div class="explian cl">
                <a href="" class="first">
                    <p class="icon icon-ex1"></p>
                    <div class="text">
                        <h3>实力雄厚</h3>
                        <p>国资背景，抱柱之信</p>
                        <p>赣州城投旗下参股企业</p>
                    </div>
                </a>
                <a href="" class="center">
                    <p class="icon icon-ex2"></p>
                    <div class="text">
                        <h3>安全稳健</h3>
                        <p>专注城投供应链金融服务</p>
                        <p>银行级风控措施+大数据</p>
                    </div>
                </a>
                <!-- 					<a href="activity/activity_01.html" class="last" target="_blank"> -->
                <a href="#" class="last">
                    <p class="icon icon-ex3"></p>
                    <div class="text">
                        <h3>新手福利</h3>
                        <p>新用户投资即获红包</p>
                        <p>推荐用户投资得红包</p>
                    </div>
                </a>
            </div>
        </div>
    </div>
</div>
<!-- product -->
<div class="product wrap">
    <div class="product-n" id="newUser">


        <div class="product-new">
            <div class="title cl"><img alt="" src=""></div>
            <ul class="product-new-main cl">
                <li class="rate cl">
                    <p><span id="ty-rate">12</span>%</p>
                    <span>预期年化收益率</span>
                </li>
                <li class="date">
                    <div class="date-item">
                        <div class="line icon icon-progress">
                            <p>募集进度：</p>
                            <p class="progress"><em></em></p>
                            <p class="progress-text"><span id="xs-schedules">80</span>%</p>
                        </div>
                        <p class="icon icon-doll">项目金额：<span id="xs-doll">1000.00万</span></p>
                        <p class="icon icon-time">投资期限：<span id="ty-date">1个月</span></p>
                    </div>
                </li>
                <li>
                    <div class="button">
                        <button type="button" id="ty-btn">立即投资</button>
                    </div>
                </li>
            </ul>
        </div>
    </div>
    <!-- 恒金保 -->
    <div class="product-h" id="pj_hengjin">
        <div class="product-h-l">
            <img src="<%=path%>/static/images/index/product_01.png" alt="恒金保">
            <a href="" class="top"></a>
            <a href="<%=path%>/borrowapply/all/1"  class="bottom"></a>
        </div>
        <div class="product-h-m">
            <ul class="product-list" id="product-h">
                <li v-for="item in hjb">
                    <div class="product-content">
                        <div class="top">
                            <p class="product-title"><a href="">{{item.cpname}}</a></p>
                            <p class="p-rate"><span>{{item.nprofit}}</span><span class="small">%</span></p>
                            <span class="p-rate-text">预期年化收益率</span>
                        </div>
                        <div class="bottom">
                            <div class="line icon icon-progress">
                                <p style="float: left;">募集进度：</p>
                                <div class="layui-progress" style="float: left;width: 150px;margin-top: 13px" lay-showPercent="yes">
                                    <div class="layui-progress layui-progress-bar layui-bg-red" v-bind:lay-percent="item.ymoney/item.money*100 + '%'"></div>
                                </div>
                            </div>
                            <p class="icon icon-doll">项目金额：{{item.money}}万元</p>
                            <p class="icon icon-time">投资期限：{{item.term}}个月</p>
                        </div>
                        <div class="submit">
                            <div class="submit">
                                <button v-if="item.ymoney/item.money*100<100" type="button" class="submit" onclick="">立即投标</button>
                                <button v-else type="button" class="submit disabled" onclick="">还款中</button>
                            </div>
                        </div>
                    </div>
                </li>
            </ul>
        </div>
    </div>
    <!-- 普金保 -->
    <div class="product-h" id="pj_pujin" v-if="pjb">
        <div class="product-h-l">
            <img src="<%=path%>/static/images/index/product_02.png" alt="普金保">
            <a href="" class="top"></a>
            <a href="<%=path%>/borrowapply/all/4" class="bottom"></a>
        </div>
        <div class="product-h-m" >
            <ul class="product-list" id="product-p">

                <li v-for="item in pjb">
                    <div class="product-content">
                        <div class="top">
                            <p class="product-title"><a href="">{{item.cpname}}</a></p>
                            <p class="p-rate"><span>{{item.nprofit}}</span><span class="small">%</span></p>
                            <span class="p-rate-text">预期年化收益率</span>
                        </div>
                        <div class="bottom">
                            <div class="line icon icon-progress">
                                <p style="float: left;">募集进度：</p>
                                <div class="layui-progress" style="float: left;width: 150px;margin-top: 13px" lay-showPercent="yes">
                                    <div class="layui-progress layui-progress-bar layui-bg-red" v-bind:lay-percent="item.ymoney/item.money*100 + '%'"></div>
                                </div>
                            </div>
                            <p class="icon icon-doll">项目金额：{{item.money}}万元</p>
                            <p class="icon icon-time">投资期限：{{item.term}}个月</p>
                        </div>
                        <div class="submit">
                            <div class="submit">
                                <button v-if="item.ymoney/item.money*100<100" type="button" class="submit" onclick="">立即投标</button>
                                <button v-else type="button" class="submit disabled" onclick="">还款中</button>
                            </div>
                        </div>
                    </div>
                </li>


            </ul>
        </div>
    </div>
    <!-- 多金宝 -->
    <div class="product-h" id="pj_duojin" >
        <div class="product-h-l">
            <img src="<%=path%>/static/images/index/product_03.png" alt="多金宝">
            <a href="" class="top"></a>
            <a href="<%=path%>/borrowapply/all/2"  class="bottom"></a>
        </div>
        <div class="product-h-m" >
            <ul class="product-list" id="product-d">


                <li v-for="item in djb">
                    <div class="product-content">
                        <div class="top">
                            <p class="product-title"><a href="">{{item.cpname}}</a></p>
                            <p class="p-rate"><span>{{item.nprofit}}</span><span class="small">%</span></p>
                            <span class="p-rate-text">预期年化收益率</span>
                        </div>
                        <div class="bottom">
                            <div class="line icon icon-progress">
                                <p style="float: left;">募集进度：</p>
                                <div class="layui-progress" style="float: left;width: 150px;margin-top: 13px" lay-showPercent="yes">
                                    <div class="layui-progress layui-progress-bar layui-bg-red" v-bind:lay-percent="item.ymoney/item.money*100 + '%'"></div>
                                </div>
                            </div>
                            <p class="icon icon-doll">项目金额：{{item.money}}万元</p>
                            <p class="icon icon-time">投资期限：{{item.term}}个月</p>
                        </div>
                        <div class="submit">
                                <button v-if="item.ymoney/item.money*100<100" type="button" class="submit" onclick="">立即投标</button>
                                <button v-else type="button" class="submit disabled" onclick="">还款中</button>
                        </div>
                    </div>
                </li>

            </ul>
        </div>
    </div>
</div>
<div class="news-main wrap">
    <div class="news-main-left" style="display: block;">
        <div class="news-main-top">
            <h3>媒体报道</h3>
            <p class="more icon icon-more"><a href="">更多</a></p>
        </div>
        <div class="news-main-content" id="dynamic">
            <ul class="news-main-list">
                <li><a href="" target="_blank" class="news-main-content-left"><img src="" alt="年底投资有风险 选择普金资本安全可靠！"
                                                                                   width="210" height="140"></a><a
                        href="" target="_blank" class="list-title">年底投资有风险 选择普金资本安全可靠！</a><a href="" target="_blank"
                                                                                             class="list-main">
                    随着近年来中国经济的快速发展，社会财富不断增长，个人金融资产也不断增加，理财的必要性也逐渐体现出来了。同时，年关将至，...</a></li>
                <li><a href="" target="_blank"
                       class="news-main-content-left"><img
                        src="" alt="这个双十一，你准备好了没有？"
                        width="210" height="140"></a><a href="" target="_blank" class="list-title">这个双十一，你准备好了没有？</a><a
                        href="" target="_blank" class="list-main">


                    随着双十一的临近，国内的金融投资市场也呈现出一派繁荣景象。不过，时值年底，对于普通的投资者来说，如果没有选择...</a></li>
                <li><a href="" target="_blank"
                       class="news-main-content-left"><img
                        src=""
                        alt="【喜报】庆贺普金资本成功当选江西省第二届互联网金融协会副会长单位！" width="210" height="140"></a><a
                        href="" target="_blank" class="list-title">【喜报】庆贺普金资本成功当选江西省第二届互联网金融协会副会长单位！</a><a
                        href="" target="_blank" class="list-main">
                    2017年10月13日，江西省互联网金融协会第二届第一次会员代表大会在南昌前湖迎宾馆隆重召开。本次会议，通过了第一届理...</a></li>
            </ul>
        </div>
    </div>
    <div class="news-main-right" style="display: block;">
        <div class="news-main-top">
            <h3>最新公告</h3>
            <p class="more icon icon-more"><a href="">更多</a></p>
        </div>
        <div class="news-main-content">
            <ul class="news-main-list" id="newsContent">
                <li><a href="" target="_blank">2017年12月24日新标预告</a><span>2017-12-23</span>
                </li>
                <li><a href="" target="_blank">2017年12月24日新标预告</a><span>2017-12-23</span>
                </li>
                <li><a href=""
                       target="_blank">关于多金宝项目正常还款的公告</a><span>2017-12-23</span></li>
                <li><a href=
                       target="_blank">关于新手标项目正常还款的公告</a><span>2017-12-23</span></li>
            </ul>
        </div>
        <div class="news-main-top ptop">
            <h3>公司动态</h3>
            <p class="more icon icon-more"><a href="">更多</a></p>
        </div>
        <div class="news-main-content">
            <ul class="news-main-list" id="news-part">
                <li><a href="" target="_blank">【普金资本】校企联手 探寻合作新契机！</a><span>2017-10-19</span>
                </li>
                <li><a href="" target="_blank">【喜报】庆贺普金资本成功当选江西省第二届互联网金融协会副会长单位！</a><span>2017-10-16</span>
                </li>
                <li><a href="" target="_blank">普金资本与汇付天下、益金所洽谈战略合作</a><span>2017-07-28</span>
                </li>
                <li><a href=""
                       target="_blank">热烈祝贺普金资本荣膺普惠金融协会常务副会长单位</a><span>2017-07-18</span></li>
            </ul>
        </div>
    </div>
</div>
<div class="index-link">
    <div class="wrap">
        <div class="link-title">
            合作伙伴
        </div>
        <div class="link-list">
            <div class="link-list-box" style="width: 5840px;">
                <ul class="cl" id="linkList" style="width: 2920px;">
                    <li><a target="view_frame" href="" title="赣州城投集团"><img
                            src="" alt="赣州城投集团"></a></li>
                    <li><a target="view_frame" href="" title="黑马地产"><img
                            src="" alt="黑马地产"></a></li>
                    <li><a target="view_frame" href="" title="汇付天下"><img
                            src="" alt="汇付天下"></a></li>
                    <li><a target="view_frame" href="" title="法大大"><img
                            src="" alt="法大大"></a></li>
                    <li><a target="view_frame" href="" title="恒大集团"><img
                            src="" alt="恒大集团"></a></li>
                    <li><a target="view_frame" href="" title="融途网"><img
                            src="" alt="融途网"></a></li>
                    <li><a target="view_frame" href="" title="江西省互联网金融协会"><img
                            src="" alt="江西省互联网金融协会"></a></li>
                    <li><a target="view_frame" href="" title="江西赣南金融资产交易中心"><img
                            src=""><img src="" alt="中国供应链金融服务联盟"></a></li>
                    <li><a target="view_frame" href="" title="网贷之家"><img
                            src="" alt="网贷之家"></a></li>
                </ul>
                <ul class="cl" id="linkList2" style="width: 2920px;">
                    <li><a target="view_frame" href="http://www.gzctgroup.cn/" title="赣州城投集团"><img
                             alt="赣州城投集团"></a></li>
                    <li><a target="view_frame" href="" title="黑马地产"><img
                            src="" alt="黑马地产"></a></li>
                    <li><a target="view_frame" href="" title="汇付天下"><img
                            src= alt="汇付天下"></a></li>
                    <li><a target="view_frame" href="" title="法大大"><img
                            src="" alt="法大大"></a></li>
                    <li><a target="view_frame" href="" title="恒大集团"><img
                            src="" alt="恒大集团"></a></li>
                    <li><a target="view_frame" href="" title="融途网"><img
                            src="" alt="融途网"></a></li>
                    <li><a target="view_frame" href="" title="江西省互联网金融协会"><img
                            src="" alt="江西省互联网金融协会"></a>
                    </li>
                    <li><a target="view_frame" href="" title="江西赣南金融资产交易中心"><img
                            src=""
                            alt="江西赣南金融资产交易中心"></a></li>
                    <li><a target="view_frame" href="" title="中国供应链金融服务联盟"><img
                            src="" alt="中国供应链金融服务联盟"></a>
                    </li>
                    <li><a target="view_frame" href="" title="网贷之家"><img
                            src="" alt="网贷之家"></a></li>
                </ul>
            </div>
        </div>
    </div>
</div>
<div id="ajaxFooter">
    <div class="mod-sidebar">
        <ul>
            <li><a target="_blank" href=""
                   class="sidebar-qq"></a></li>
            <li><a href="javascript:;" class="sidebar-wx"></a></li>
            <li><a href="" class="sidebar-cl"></a></li>
            <li><a href="javascript:;" class="wenquan" title="填写即送5元代金券"></a></li>
            <li><a href="javascript:;" class="sidebar-top"></a></li>
        </ul>
    </div>
    <!-- concat -->
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
                    <a target="_blank" href=""
                       class="about_qq"></a>
                    <a href="javascript:void(0);" class="about_wx about_rr">
						<span class="line_l_j">
							<span class="line_l_sj"></span>
							<span class="line_l_texts">400-606-2079</span>
						</span>
                    </a>
                </p>
                <p class="about_cel_no">admin@pujinziben.com</p>
            </div>
            <div class="index-concat-link cl"><a href="javascript:;" class="title">友情链接</a><a target="_blank"
                                                                                              href="">网贷天眼</a><a
                    target="_blank" href="">网贷天下</a><a target="_blank" href="">中国平安银行</a><a
                    target="_blank" href="">中国建设银行</a><a target="_blank"
                                                                                                href="">网贷东方</a><a
                    target="_blank" href="">第一网贷</a></div>
        </div>
    </div>
    <div class="footer">
        <div class="wrap">
            <p class="text">
                版权所有 © 普金资本运营（赣州）有限公司 All rights reserved <br>
                备案确认书：<a href="" target="_blank"
                         class="beian">赣ICP备16004010号</a><a href=""
                                                            target="_blank"></a>&nbsp;&nbsp;&nbsp;&nbsp;<a>
                    target="_blank" href=""
                    style="display:inline-block;text-decoration:none;height:20px;line-height:20px;" class="beian">赣公网安备
                36070202000195号</a>

            </p>

        </div>
    </div>
</div>
</div>
</body>
<script src="<%=path%>/static/js/vue.min.js/"></script>
<script src="<%=path%>/static/js/axios.min.js/"></script>
<script src="<%=path%>/static/layui/layui.js"></script>
<script>

    layui.use('element', function(){
        var element = layui.element;
    });

    //标种三
    function three() {
        return axios.get('/borrowapply/data/json/three');
    }

    new Vue({
        el:'#app',
        data:{
            djb:[],
            xsb:[],
            pjb:[],
            hjb:[]
        },
        created () {
            axios.all([three()]).then(axios.spread((threes)=>{
               this.djb = threes.data.data['多金宝'].data;
               this.xsb = threes.data.data['新手标'].data;
               this.pjb = threes.data.data['普金保'].data;
               this.hjb = threes.data.data['恒金保'].data;
            }));
        },
        methods: {

        },
        computed: {

        },
    });
</script>
</html>
