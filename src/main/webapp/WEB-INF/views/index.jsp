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
    <link rel="stylesheet" href="<%=path%>/static/dynajs/css/shenluehao.css">

</head>
<link rel="icon" href="" type="image/x-icon"/>
<body>
<%@include file="./common/top.jsp"%>
<div id="app">
<div class="top" id="top">
    <!-- top -->
<!-- banner -->
<div class="banner">
    <div class="layui-carousel" id="test1">
        <div carousel-item>
            <div><img style="width: 100%;height: 100%" :src="home.pic1"></div>
            <div><img style="width: 100%;height: 100%" :src="home.pic2"></div>
            <div><img style="width: 100%;height: 100%" :src="home.pic3"></div>
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
                <li class="last"><p>累计注册投资人：<span id="userTotal">9894</span><span class="small">人</span></p></li>
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
                            <p class="product-title"><a :href="'/borrowapply/info/'+item.baid+'/'+item.bdid+'/'+item.bzname">{{item.cpname}}</a></p>
                            <p class="p-rate"><span>{{item.nprofit}}</span><span class="small">%</span></p>
                            <span class="p-rate-text">预期年化收益率</span>
                        </div>
                        <div class="bottom">
                            <div class="line icon icon-progress">
                                <p style="float: left;">募集进度：</p>
                                <div class="layui-progress" style="float: left;width: 100px;margin-top: 13px" lay-showPercent="yes">
                                    <div class="layui-progress layui-progress-bar layui-bg-red" v-bind:lay-percent="item.ymoney/item.money*100 + '%'"></div>
                                </div>
                                {{item.ymoney/item.money*100 |formatNumber}}%
                            </div>
                            <p class="icon icon-doll">项目金额：{{item.money | money}}元</p>
                            <p class="icon icon-time">投资期限：{{item.term}}个月</p>
                        </div>
                        <div class="submit">
                            <div class="submit">
                                <button v-if="item.ckstatus==2" type="button" class="submit" @click="detail(item.baid,item.bdid,item.bzname)">立即投标</button>
                                <button v-else-if="item.ckstatus==5" type="button" class="submit disabled">已完成</button>
                                <button v-else-if="item.ckstatus==4" type="button" class="submit disabled">还款中</button>
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
                            <p class="product-title"><a :href="'/borrowapply/info/'+item.baid+'/'+item.bdid+'/'+item.bzname">{{item.cpname}}</a></p>
                            <p class="p-rate"><span>{{item.nprofit}}</span><span class="small">%</span></p>
                            <span class="p-rate-text">预期年化收益率</span>
                        </div>
                        <div class="bottom">
                            <div class="line icon icon-progress">
                                <p style="float: left;">募集进度：</p>
                                <div class="layui-progress" style="float: left;width: 100px;margin-top: 13px" lay-showPercent="yes">
                                    <div class="layui-progress layui-progress-bar layui-bg-red" v-bind:lay-percent="item.ymoney/item.money*100 + '%'"></div>
                                </div>
                                {{item.ymoney/item.money*100 |formatNumber}}%
                            </div>
                            <p class="icon icon-doll">项目金额：{{item.money | money}}元</p>
                            <p class="icon icon-time">投资期限：{{item.term}}个月</p>
                        </div>
                        <div class="submit">
                            <div class="submit">
                                <button v-if="item.ckstatus==2" type="button" class="submit" @click="detail(item.baid,item.bdid,item.bzname)">立即投标</button>
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
                            <p class="product-title"><a :href="'/borrowapply/info/'+item.baid+'/'+item.bdid+'/'+item.bzname">{{item.cpname}}</a></p>
                            <p class="p-rate"><span>{{item.nprofit}}</span><span class="small">%</span></p>
                            <span class="p-rate-text">预期年化收益率</span>
                        </div>
                        <div class="bottom">
                            <div class="line icon icon-progress">
                                <p style="float: left;">募集进度：</p>
                                <div class="layui-progress" style="float: left;width: 100px;margin-top: 13px" lay-showPercent="yes">
                                    <div class="layui-progress layui-progress-bar layui-bg-red" v-bind:lay-percent="item.ymoney/item.money*100 + '%'"></div>
                                </div>
                                {{item.ymoney/item.money*100 |formatNumber}}%
                            </div>
                            <p class="icon icon-doll">项目金额：{{item.money | money}}元</p>
                            <p class="icon icon-time">投资期限：{{item.term}}个月</p>
                        </div>
                        <div class="submit">
                                <button v-if="item.ckstatus==2" type="button" class="submit" @click="detail(item.baid,item.bdid,item.bzname)">立即投标</button>
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
            <ul  class="news-main-list">
                <li v-for="item in media">
                    <a :href="'/dynaxq?id='+item.mid" target="_blank" class="news-main-content-left">
                    <img :src="item.pic" href="" target="_blank" class="list-title">{{item.title}}</a>
                    <a :href="'/dynaxq?id='+item.mid" target="_blank" class="list-main">
                   <dd class="line-limit-length" style="color: black"> {{item.title}}</dd>
                   </a>
                    <dd style="height: 160px;color: #999999"  > {{item.url}}</dd>
                </li>
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
                <li v-for="item in notice">
                    <a :href="'/dynaxq?id='+item.nid" target="_blank">{{item.title}}</a>
                    <span>{{item.createdTime | formatDate}}</span>
                </li>
            </ul>
        </div>
        <div class="news-main-top ptop">
            <h3>公司动态</h3>
            <p class="more icon icon-more"><a href="">更多</a></p>
        </div>
        <div class="news-main-content">
            <ul class="news-main-list" id="news-part">
                <li v-for="item in dynamic">
                    <a :href="'/dynaxq?id='+item.dyid" target="_blank">{{item.title}}</a>
                    <span >{{item.createdTime | formatDate}}</span>
                </li>
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
                <marquee id="affiche" align="left" behavior="alternate" direction="left" loop="-1" hspace="0" vspace="10"
                         scrollamount="2" onMouseOut="this.start()" onMouseOver="this.stop()">
                    <div class="link-list-box" style="width: 20000px;">
                        <ul class="cl" id="linkList" style="width: 6000px;">
                            <li v-for="item in friends">
                                <a target="_blank" :href="item.furl"><img style="width:260px;height: 58px;" :src="item.fpic"></a>
                            </li>
                        </ul>
                    </div>
                </marquee>
            </div>
        </div>
    </div>
<div id="ajaxFooter">
    <div class="mod-sidebar">
        <ul>
            <li><a target="_blank" href="http://web2.qq.com/"
                   class="sidebar-qq">
                <img src="/static/images/index/qq1.png">
            </a></li>
            <li id="aaa"><a href="javascript:;" class="sidebar-wx">
                <img src="/static/images/index/wx1.png">
            </a></li>
            <li><a href="/calculator" class="sidebar-cl">
                <img src="/static/images/index/sf.png">
            </a></li>
            <li><a href="javascript:;" class="wenquan" title="填写即送5元代金券">
                <img src="/static/images/index/log.png">
            </a></li>
            <li><a href="javascript:;" class="sidebar-top">
                <img src="/static/images/index/more.png">
            </a></li>
        </ul>
    </div>
    <!-- concat -->

    <%@include file="common/footer.jsp"%>
</div>
</div>
</div>
</body>
<script src="<%=path%>/static/js/vue.min.js/"></script>
<script src="<%=path%>/static/js/axios.min.js/"></script>
<script src="<%=path%>/static/layui/layui.js"></script>
<script src="/static/layui/lay/modules/element.js"></script>
<script src="/static/js/common.js"></script>
<script src="/static/js/jquery.min.js"></script>
<script>
    layui.use('carousel', function(){
        var carousel = layui.carousel;
        //建造实例
        carousel.render({
            elem: '#test1'
            ,width: '100%' //设置容器宽度
            ,arrow: 'always' //始终显示箭头
            //,anim: 'updown' //切换动画方式
        });
    });

    //标种三
    function three() {
        return axios.get('/borrowapply/data/json/three');
    }

    function Media() {
        return axios.get('/media/data/json/pager?page=1&limit=3');
    }

    function notice() {
        return axios.get('/notice/data/json/pager?page=1&limit=5');
    }

    function dynamic() {
        return axios.get('/dyna/data/json/pager?page=1&limit=5');
    };

    //合作伙伴
    function friends() {
        return axios.get('/friend/data/json/pager?page=1&limit=10');
    }
    //累计投资人
    function friends() {
        return axios.get('/friend/data/json/pager?page=1&limit=10');
    }

    function home() {
        return axios.get('/home/data/json/listhome');
    }

    new Vue({
        el:'#app',
        data:{
            djb:[],
            xsb:[],
            pjb:[],
            hjb:[],
            media:[],
            notice:[],
            dynamic:[],
            friends:[],
            touzi:[],
            numberPeople:'',
            home:{}
        },
        filters: {
            formatDate(time) {
                var date = new Date(time);
                return formatDate(date, 'yyyy-MM-dd');
            },
            formatNumber(value){
                if(value==Infinity){
                    return 0;
                }
                return value.toFixed(2);
            },
            money(value){
                return formatMoney(value,2);
            }
        },
        created () {
            axios.all([three(),Media(),notice(),dynamic(),friends(),home()]).then(axios.spread((threes,media,notice,dynamic,friends,home)=>{
                this.djb = threes.data.data['多金宝'].data;
                this.xsb = threes.data.data['新手标'].data;
                this.pjb = threes.data.data['普金保'].data;
                this.hjb = threes.data.data['恒金保'].data;
                this.media = media.data.rows;
                this.notice = notice.data.rows;
                this.dynamic = dynamic.data.rows;
                this.friends = friends.data.rows;
                this.home = home.data;
            }));
        },
        methods: {
            detail (baid,bdid,bzname) {
                window.location.href='/borrowapply/info/'+baid+'/'+bdid+'/'+bzname
            }
        },
        computed: {

        },
    });
</script>
</html>
