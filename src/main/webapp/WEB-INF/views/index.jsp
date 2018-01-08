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
<%@include file="common/top.jsp" %>
<div id="app">
    <div class="top" id="top">
        <!-- top -->
        <!-- banner -->
        <div class="banner">
            <div class="layui-carousel" id="test1">
                <div carousel-item>
                    <div><img style="width: 100%;height: 100%"
                              src="http://b.zol-img.com.cn/desk/bizhi/start/1/1388973662507.jpg"></div>
                    <div><img style="width: 100%;height: 100%"
                              src="http://b.zol-img.com.cn/desk/bizhi/start/1/1388973662507.jpg"></div>
                </div>
            </div>
        </div>
        <!-- news -->
        <div class="news">
            <div class="wrap">
                <div class="news-list icon icon-news">
                    <ul id="news-list" style="height: 192px; top: -48px;">
                        <li><span>最新动态&nbsp;&nbsp;|&nbsp;&nbsp;</span><a href="" target="_blank">2017年12月24日新标预告</a>
                        </li>
                    </ul>
                </div>
                <%--<div class="bang-list">--%>
                <%--<a href="" target="_blank" class="icon icon-bang">投资、推荐排行榜</a>--%>
                <%--</div>--%>
            </div>
        </div>
        <!-- statis -->
        <div class="statis">
            <div class="wrap">
                <div class="statis-main">
                    <ul class="statis-top cl">
                        <li class="first"><p>普金资本高收益网络借贷信息中介平台</p></li>
                        <li class="center"><p>累计投资金额：<span id="investAmount">31,768,031.00</span><span
                                class="small">元</span>
                        </p></li>
                        <!--<li class="center"><p>累计赚取收益：<span id="hasInterest">0</span><span class="small">元</span></p></li>-->
                        <li class="last"><p>累计注册投资人：<span id="userTotal">66666</span><span class="small">人</span></p>
                        </li>
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
                    <a href="<%=path%>/borrowapply/all/1" class="bottom"></a>
                </div>
                <div class="product-h-m">
                    <ul class="product-list" id="product-h">
                        <li v-for="item in hjb">
                            <div class="product-content">
                                <div class="top">
                                    <p class="product-title"><a
                                            :href="'/borrowapply/info/'+item.baid+'/'+item.bdid+'/'+item.bzname">{{item.cpname}}</a>
                                    </p>
                                    <p class="p-rate"><span>{{item.nprofit}}</span><span class="small">%</span></p>
                                    <span class="p-rate-text">预期年化收益率</span>
                                </div>
                                <div class="bottom">
                                    <div class="line icon icon-progress">
                                        <p style="float: left;">募集进度：</p>
                                        <div class="layui-progress" style="float: left;width: 150px;margin-top: 13px"
                                             lay-showPercent="yes">
                                            <div class="layui-progress layui-progress-bar layui-bg-red"
                                                 v-bind:lay-percent="item.ymoney/item.money*100 + '%'"></div>
                                        </div>
                                    </div>
                                    <p class="icon icon-doll">项目金额：{{item.money}}万元</p>
                                    <p class="icon icon-time">投资期限：{{item.term}}个月</p>
                                </div>
                                <div class="submit">
                                    <div class="submit">
                                        <button v-if="item.ckstatus==2" type="button" class="submit"
                                                @click="detail(item.baid,item.bdid,item.bzname)">立即投标
                                        </button>
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
                <div class="product-h-m">
                    <ul class="product-list" id="product-p">

                        <li v-for="item in pjb">
                            <div class="product-content">
                                <div class="top">
                                    <p class="product-title"><a
                                            :href="'/borrowapply/info/'+item.baid+'/'+item.bdid+'/'+item.bzname">{{item.cpname}}</a>
                                    </p>
                                    <p class="p-rate"><span>{{item.nprofit}}</span><span class="small">%</span></p>
                                    <span class="p-rate-text">预期年化收益率</span>
                                </div>
                                <div class="bottom">
                                    <div class="line icon icon-progress">
                                        <p style="float: left;">募集进度：</p>
                                        <div class="layui-progress" style="float: left;width: 150px;margin-top: 13px"
                                             lay-showPercent="yes">
                                            <div class="layui-progress layui-progress-bar layui-bg-red"
                                                 v-bind:lay-percent="item.ymoney/item.money*100 + '%'"></div>
                                        </div>
                                    </div>
                                    <p class="icon icon-doll">项目金额：{{item.money}}万元</p>
                                    <p class="icon icon-time">投资期限：{{item.term}}个月</p>
                                </div>
                                <div class="submit">
                                    <div class="submit">
                                        <button v-if="item.ckstatus==2" type="button" class="submit"
                                                @click="detail(item.baid,item.bdid,item.bzname)">立即投标
                                        </button>
                                        <button v-else type="button" class="submit disabled" onclick="">还款中</button>
                                    </div>
                                </div>
                            </div>
                        </li>


                    </ul>
                </div>
            </div>
            <!-- 多金宝 -->
            <div class="product-h" id="pj_duojin">
                <div class="product-h-l">
                    <img src="<%=path%>/static/images/index/product_03.png" alt="多金宝">
                    <a href="" class="top"></a>
                    <a href="<%=path%>/borrowapply/all/2" class="bottom"></a>
                </div>
                <div class="product-h-m">
                    <ul class="product-list" id="product-d">


                        <li v-for="item in djb">
                            <div class="product-content">
                                <div class="top">
                                    <p class="product-title"><a
                                            :href="'/borrowapply/info/'+item.baid+'/'+item.bdid+'/'+item.bzname">{{item.cpname}}</a>
                                    </p>
                                    <p class="p-rate"><span>{{item.nprofit}}</span><span class="small">%</span></p>
                                    <span class="p-rate-text">预期年化收益率</span>
                                </div>
                                <div class="bottom">
                                    <div class="line icon icon-progress">
                                        <p style="float: left;">募集进度：</p>
                                        <div class="layui-progress" style="float: left;width: 150px;margin-top: 13px"
                                             lay-showPercent="yes">
                                            <div class="layui-progress layui-progress-bar layui-bg-red"
                                                 v-bind:lay-percent="item.ymoney/item.money*100 + '%'"></div>
                                        </div>
                                    </div>
                                    <p class="icon icon-doll">项目金额：{{item.money}}万元</p>
                                    <p class="icon icon-time">投资期限：{{item.term}}个月</p>
                                </div>
                                <div class="submit">
                                    <button v-if="item.ckstatus==2" type="button" class="submit"
                                            @click="detail(item.baid,item.bdid,item.bzname)">立即投标
                                    </button>
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
                        <li v-for="item in media"><a :href="item.url" target="_blank"
                                                     class="news-main-content-left">
                            <img :src="item.pic"
                                 href="" target="_blank" class="list-title">{{item.title}}</a><a
                                href="" target="_blank" class="list-main">
                            <dd class="line-limit-length" style="color: black"> {{item.title}}</dd>
                        </a>
                            <dd style="height: 150px;color: #999999"> {{item.url}}</dd>
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
                            <a href="" target="_blank">{{item.title}}</a>
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
                            <a href="" target="_blank">{{item.title}}</a>
                            <span>{{item.createdTime | formatDate}}</span>
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
                                <li><a target="view_frame" href="http://www.gzctgroup.cn" title="赣州城投集团"><img
                                        src="/static/images/index/gzct.jpg" alt="赣州城投集团"></a></li>
                                <li><a target="view_frame" href="http://www.heimadc.com/" title="黑马地产"><img
                                        src="/static/images/index/hmdc.jpg" alt="黑马地产"></a></li>
                                <li><a target="view_frame" href="http://www.chinapnr.com/" title="汇付天下"><img
                                        src="/static/images/index/hftx.jpg" alt="汇付天下"></a></li>
                                <li><a target="view_frame" href="https://www.fadada.com/" title="法大大"><img
                                        src="/static/images/index/fdd.jpg" alt="法大大"></a></li>
                                <li><a target="view_frame" href="http://www.evergrande.com/" title="恒大集团"><img
                                        src="/static/images/index/hdtcjt.jpg" alt="恒大集团"></a></li>
                                <li><a target="view_frame" href="http://www.erongtu.com/" title="融途网"><img
                                        src="/static/images/index/rtw.jpg" alt="融途网"></a></li>
                                <li><a target="view_frame" href="http://www.jxifa.org.cn/" title="江西省互联网金融协会"><img
                                        src="/static/images/index/jxshlwjrxh.png" alt="江西省互联网金融协会"></a></li>
                                <li><a target="view_frame" href="http://www.cgfae.cn/" title="江西赣南金融资产交易中心"><img
                                        src="/static/images/index/jxsgyjrd.png" alt="江西赣南金融资产交易中心"></a></li>
                                <li><a target="view_frame" href="http://www.chinacsfl.cn/" title="中国供应链金融服务联盟"><img
                                        src="/static/images/index/zggyl.png" alt="中国供应链金融服务联盟"></a></li>
                                <li><a target="view_frame" href="http://www.wdzj.com/" title="网贷之家"><img
                                        src="/static/images/index/wdzj.png" alt="网贷之家"></a></li>


                                <li><a target="view_frame" href="http://www.gzctgroup.cn" title="赣州城投集团"><img
                                        src="/static/images/index/gzct.jpg" alt="赣州城投集团"></a></li>
                                <li><a target="view_frame" href="http://www.heimadc.com/" title="黑马地产"><img
                                        src="/static/images/index/hmdc.jpg" alt="黑马地产"></a></li>
                                <li><a target="view_frame" href="http://www.chinapnr.com/" title="汇付天下"><img
                                        src="/static/images/index/hftx.jpg" alt="汇付天下"></a></li>
                                <li><a target="view_frame" href="https://www.fadada.com/" title="法大大"><img
                                        src="/static/images/index/fdd.jpg" alt="法大大"></a></li>
                                <li><a target="view_frame" href="http://www.evergrande.com/" title="恒大集团"><img
                                        src="/static/images/index/hdtcjt.jpg" alt="恒大集团"></a></li>
                                <li><a target="view_frame" href="http://www.erongtu.com/" title="融途网"><img
                                        src="/static/images/index/rtw.jpg" alt="融途网"></a></li>
                                <li><a target="view_frame" href="http://www.jxifa.org.cn/" title="江西省互联网金融协会"><img
                                        src="/static/images/index/jxshlwjrxh.png" alt="江西省互联网金融协会"></a></li>
                                <li><a target="view_frame" href="http://www.cgfae.cn/" title="江西赣南金融资产交易中心"><img
                                        src="/static/images/index/jxsgyjrd.png" alt="江西赣南金融资产交易中心"></a></li>
                                <li><a target="view_frame" href="http://www.chinacsfl.cn/" title="中国供应链金融服务联盟"><img
                                        src="/static/images/index/zggyl.png" alt="中国供应链金融服务联盟"></a></li>
                                <li><a target="view_frame" href="http://www.wdzj.com/" title="网贷之家"><img
                                        src="/static/images/index/wdzj.png" alt="网贷之家"></a></li>
                            </ul>
                        </div>
                    </marquee>
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
                        <img src="/static/images/index/index_erweima.png" alt="扫码关注普金资本">
                    </div>
                    <div class="index-concat-phone">
                        <p>财富热线</p>
                        <h3>400-606-2079</h3>
                    </div>
                    <div class="index-concat-channel">
                        <p class="about_cel_text">
                            <a target="_blank" href="http://weibo.com/pujinziben" class="about_wb">
                                <img src="/static/images/index/wb.png">
                            </a>
                            <a href="javascript:void(0);" class="about_wx line_02">
                                <img src="/static/images/index/wx.png">
						<span class="line_l_h">
							<span class="line_l_sj"></span>
							<span class="line_l_text">关注普金资本公众号</span>
							<span class="line_l_pic"></span>
						</span>
                            </a>
                            <a target="_blank" href=""
                               class="about_qq">
                                <img src="/static/images/index/qq.png">
                            </a>
                            <a href="javascript:void(0);" class="about_wx about_rr">
                                <img src="/static/images/index/phone.png">
						<span class="line_l_j">
							<span class="line_l_sj"></span>
							<span class="line_l_texts">400-606-2079</span>
						</span>
                            </a>
                        </p>
                        <p class="about_cel_no">admin@pujinziben.com</p>
                    </div>
                    <div class="index-concat-link cl"><a href="javascript:;" class="title">友情链接</a><a target="_blank"
                                                                                                      href="http://www.p2peye.com/">网贷天眼</a><a
                            target="_blank" href="http://www.wdtianxia.com/">网贷天下</a><a target="_blank" href="http://bank.pingan.com/">中国平安银行</a><a
                            target="_blank" href="http://www.ccb.com/cn/home/indexv3.html">中国建设银行</a><a target="_blank"
                                                                 href="http://www.wangdaidongfang.com/">网贷东方</a><a
                            target="_blank" href="http://www.p2p001.com/">第一网贷</a></div>
                </div>
            </div>
            <div class="footer">
                <div class="wrap">
                    <p class="text">
                        版权所有 © 普金资本运营（赣州）有限公司 All rights reserved <br>
                        备案确认书：<a href="http://www.miitbeian.gov.cn/publish/query/indexFirst.action" target="_blank"
                                 class="beian">赣ICP备16004010号
                                <img src="/static/images/index/CNZZ.png">
                                </a>
                        <a href="" target="_blank"></a>&nbsp;&nbsp;&nbsp;&nbsp;<a

                        target="_blank" href="http://www.beian.gov.cn/portal/registerSystemInfo?recordcode=36070202000195"

                        style="display:inline-block;text-decoration:none;height:20px;line-height:20px;"

                        class="beian">
                        <img src="/static/images/index/beian.png">
                        赣公网安备
                        36070202000195号</a>

                    </p>
                    <div class="footer-list" style="width:650px;text-align:center">
                        <a id="___szfw_logo___" href="https://credit.szfw.org/CX05252017016185201512.html" target="_blank"><img src="/static/images/index/foot2.png" border="0"></a>
                        <!-- <a href="https://credit.cecdc.com/CX20160720023638001698.html"><img src="resources/front/v01/src/images/ft_link_01.png" alt=""></a> -->
                        <a href="https://www.yunaq.com/analytics/login/?site=pujinziben.com" target="_blank"><img src="resources/front/v01/src/images/ft_link_02.png" alt=""></a>
                        <a href="http://si.trustutn.org/info?sn=685170725000594426611&amp;certType=4" target="_blank"><img width="110px" height="40px" src="http://v.trustutn.org/images/cert/p2p_bottom_large_img.jpg" alt=""></a>
                        <!-- 				<a href="http://webscan.360.cn/index/checkwebsite/url/www.pujinziben.com"><img width="110px" height="40px" border="0" src="http://img.webscan.360.cn/status/pai/hash/745ef449cbf0f6a74791f73d57aa7ac2"/></a> -->
                        <a href="https://v.pinpaibao.com.cn/authenticate/cert/?site=www.pujinziben.com&amp;at=business" target="_blank">
                            <img src="/static/images/index/ft_link_02.png" alt="安全网站">
                        </a>
                        <a target="_blank" href="http://ec.eqixin.com/?sn=QX3712005910061483682343"><img width="112px" height="34px" src="/static/images/index/foot1.png" alt="企信验证"></a>
                    </div>

                </div>
            </div>
        </div>
    </div>
</div>
</body>
<script src="<%=path%>/static/js/vue.min.js/"></script>
<script src="<%=path%>/static/js/axios.min.js/"></script>
<script src="<%=path%>/static/layui/layui.js"></script>
<script src="/static/layui/lay/modules/element.js"></script>
<script src="/static/js/common.js"></script>

<script>
    layui.use('carousel', function () {
        var carousel = layui.carousel;
        //建造实例
        carousel.render({
            elem: '#test1'
            , width: '100%' //设置容器宽度
            , arrow: 'always' //始终显示箭头
            //,anim: 'updown' //切换动画方式
        });
    });

    //标种三
    function three() {
        return axios.get('/borrowapply/data/json/three');
    }

    function Media() {
        return axios.get('/media/data/json/pager?page=1&limit=5');
    }

    function notice() {
        return axios.get('/notice/data/json/pager?page=1&limit=5');
    }

    function dynamic() {
        return axios.get('/dyna/data/json/pager?page=1&limit=5');
    };

    new Vue({
        el: '#app',
        data: {
            djb: [],
            xsb: [],
            pjb: [],
            hjb: [],
            media: [],
            notice: [],
            dynamic: []
        },
        filters: {
            formatDate(time) {
                var date = new Date(time);
                return formatDate(date, 'yyyy-MM-dd');
            }
        },
        created () {
            axios.all([three(), Media(), notice(), dynamic()]).then(axios.spread((threes, media, notice, dynamic) => {
                this.djb = threes.data.data['多金宝'].data;
                this.xsb = threes.data.data['新手标'].data;
                this.pjb = threes.data.data['普金保'].data;
                this.hjb = threes.data.data['恒金保'].data;
                this.media = media.data.rows;
                this.notice = notice.data.rows;
                this.dynamic = dynamic.data.rows;
            }));
        },
        methods: {
            detail (baid, bdid, bzname) {
                window.location.href = '/borrowapply/info/' + baid + '/' + bdid + '/' + bzname
            }
        },
        computed: {},
    });
</script>
</html>
