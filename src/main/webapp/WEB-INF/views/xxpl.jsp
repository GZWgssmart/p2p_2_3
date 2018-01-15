
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html >
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="/static/dynajs/xxpl/css/public.css">
    <link rel="stylesheet" href="/static/dynajs/xxpl/css/about.css">
    <link rel="stylesheet" href="/static/dynajs/css/shenluehao.css">
    <link rel="stylesheet" href="/static/layui/css/layui.css">
    <style>

        .disclosure,.details,.gdbj,.gsjj,.ptzz,.gwtd,.gsdt,.ptgg,.zxns,.lxwm,.dongtai,.baodao{
            width:900px;
            height:950px;
        }



        .disclosure,.details{
            overflow:hidden;
        }
    </style>
</head>
<link rel="icon" href="resources/front/v01/src/images/logo_title.jpg" type="image/x-icon" />
<body>
<%@include file="common/top.jsp"%>
<div id="app">
<div class="about cl" >
    <div class="about-left">
        <div class="about-left-nav">
            <ul id="animateUl" class="sub-nav">
                <li class="xxpl"><a href="javaScript:void(0);" onclick="animate1()" class="icon-about about-xxpl">信息披露</a></li>
                <li ><a href="#cyjg" class="icon-about about-cyjg">从业机构信息</a></li>
                <li ><a href="#ptyy" class="icon-about about-ptyy" @click="listydata">平台运营信息</a></li>
                <li ><a href="#jkxm" class="icon-about about-jkxm">借款项目信息</a>
                </li>
            </ul>
            <ul class="sub-nav">
                <li><div class="hr"></div></li>
                <li id="gd"><a href="#gdbj" class="icon-about about-gudong" >股东背景</a></li>
                <li><a href="#gsjj" class="icon-about about-jianjie">公司简介</a></li>
                <li><a href="#ptzz" class="icon-about about-zizhi">平台资质</a></li>
                <!-- <li><a href="#gltd" class="icon-about about-guanli">管理团队</a></li> -->
                <li><a href="#gwtd" class="icon-about about-guwen">顾问团队</a></li>
                <li><a href="#gsdt" class="icon-about about-dongtai" @click="commonUtil('/dyna/data/json/PagerCriteria','demo3')">公司动态</a></li>
                <li><a href="#ptgg" class="icon-about about-gonggao" @click="commonUtil('/notice/data/json/PagerCriteria','demo5')">平台公告</a></li>
                <li><a href="#zxns" class="icon-about about-zhaopin">招贤纳士</a></li>
                <li><a href="#lxwm" class="icon-about about-lianxi">联系我们</a></li>
            </ul>
        </div>
    </div>
    <!-- begin -->
    <div class="about-right">
        <div class="disclosure">
            <div class="gdbj" id="gdbj"></div>
            <div class="gsjj" id="gsjj"></div>
            <div class="ptzz" id="ptzz"></div>
            <div class="gwtd" id="gwtd"></div>
            <div class="gsdt" id="gsdt">
                <div class="details">
                    <div class="dongtai" id="dongtai">
                        <div class="about-right-nav">
                            <div class="sub-a-nav">
                                <a href="#dongtai" @click="commonUtil('/dyna/data/json/PagerCriteria','demo3')">公司动态</a><a href="#baodao" @click="commonUtil('/media/data/json/PagerCriteria'),'demo4'" >媒体报道</a>
                            </div>
                            <em class="em-line" style="left: 0px;"></em>
                        </div>




                        <%--公司动态--%>
                        <div class="about-content">
                            <div  style="display: block;" id="dynamic">
                                <ul class="news-list listData">
                                    <li v-for="item in rows"  class="interval">
                                        <div class="children0">
                                            <img :src="item.pic" class="news-img"  width="200" height="120">
                                            <div class="news-content">
                                                <a :href="'/dynaxq?id='+item.dyid"  class="news-title">{{item.title}}</a>
                                               <p class="news-about line-limit-length"  >{{item.url}}</p>
                                                <p class="news-time">{{item.createdTime}}</p>
                                            </div>
                                        </div>
                                    </li>
                                </ul>
                                <ul>
                                <div id="demo3"></div>
                                </ul>
                            </div>
                        </div>
                    </div>

                    <div class="baodao" id="baodao">
                        <div class="about-right-nav">
                            <div class="sub-a-nav">
                                <a href="#dongtai" @click="commonUtil('/dyna/data/json/PagerCriteria','demo3')">公司动态</a><a href="#baodao" @click="commonUtil('/media/data/json/PagerCriteria','demo4')">媒体报道</a>
                            </div>
                            <em class="em-line" style="left: 120px;"></em>
                        </div>

                        <%--媒体报道--%>
                        <div class="about-content">
                            <div  style="display: block;" id="media">
                                <ul class="news-list listData">
                                    <li v-for="item in rows"  class="interval">
                                        <div class="children0">
                                            <img :src="item.pic" class="news-img"  width="200" height="120">
                                            <div class="news-content">
                                                <a :href="'/dynaxq?id='+item.mid" class="news-title">{{item.title}}</a>
                                                <p class="news-about line-limit-length"  >{{item.url}}</p>
                                                <p class="news-time">{{item.createdTime}}</p>
                                            </div>
                                        </div>
                                    </li>
                                </ul>
                                <ul>
                                <div id="demo4"></div>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="ptyy" id="ptyy">
                <div class="details">
                    <div class="shissj" id="shissj">
                        <div class="about-right-nav">
                            <div class="sub-a-nav">
                                <a href="#shissj">实时数据</a><a href="#yunyjg">运营报告</a>
                            </div>
                            <em class="em-line" style="left: 0px;"></em>
                        </div>
                        <div class="about-content" id="sssjDiv" style="display: block;">
                            <div class="btnDiv">
                                撮合交易总额（元）
                            </div>

                            <div   class="moneyDiv">
                                <div v-for="item in tmoneyList">
                                <div class="item_Div" id="allmoney7">{{item}}</div>
                                </div>
                                <div class="marginLeft">.</div>
                                <div class="item_Div" id="allmoney8">0</div>
                                <div class="item_Div" id="allmoney9">0</div>
                            </div>


                            <div class="btnDiv">平台数据总览</div>
                            <div class="sjList sjList-1">
                                <div class="item">

                                    <div class="item-icon icon-dealNumber"></div>
                                    <div class="itemText">交易笔数（笔）</div>
                                    <div class="itemSJ" id="dealNumber">{{list.allTrade}}</div>
                                </div>
                                <div class="item">
                                    <div class="item-icon icon-repayAmount"></div>
                                    <div class="itemText">已还本金（元）</div>
                                    <div class="itemSJ" id="repayAmount">{{list.alreadyMoney}}</div>
                                </div>
                                <div class="item">
                                    <div class="item-icon icon-unRepayAmount"></div>
                                    <div class="itemText">待还本金（元）</div>
                                    <div class="itemSJ" id="unRepayAmount">{{list.stillreturnMoney}}</div>
                                </div>
                                <div class="item">
                                    <div class="item-icon icon-unRepayNumber"></div>
                                    <div class="itemText">总贷款笔数（笔）</div>
                                    <div class="itemSJ" id="unRepayNumber">{{list.tdkbno}}</div>
                                </div>
                                <div class="item">
                                    <div class="item-icon icon-hasInteres"></div>
                                    <div class="itemText">为用户创造的收益（元）</div>
                                    <div class="itemSJ" id="hasInterest">{{list.usersProfit}}</div>
                                </div>

                            </div>
                            <div class="btnDiv btnDiv-P">平台用户数据</div>
                            <div class="sjList sjList-2">
                                <div class="item-yh">
                                    <i class="icon-userTotal"></i>
                                    <div class="itemText">注册用户数（人）</div>
                                    <div class="itemSJ color-b" id="userTotal">11,219</div>
                                </div>
                                <div class="item-yh">
                                    <i class="icon-investorCount"></i>
                                    <div class="itemText">累计出借人数量（人）</div>
                                    <div class="itemSJ color-g" id="investorCount">439</div>
                                </div>
                                <div class="item-yh">
                                    <i class="icon-borrowerCount"></i>
                                    <div class="itemText">累计借款人数量（人）</div>
                                    <div class="itemSJ color-y" id="borrowerCount">35</div>
                                </div>
                                <div class="item-yh">
                                    <i class="icon-avgUserInvest"></i>
                                    <div class="itemText">人均累计投资金额（元）</div>
                                    <div class="itemSJ color-b" id="avgUserInvest">77,151.48</div>
                                </div>
                                <div class="item-yh">
                                    <i class="icon-avgInvest"></i>
                                    <div class="itemText">笔均投资额（元）</div>
                                    <div class="itemSJ color-g" id="avgInvest">17,585.41</div>
                                </div>
                                <div class="item-yh">
                                    <i class="icon-investorNew"></i>
                                    <div class="itemText">当期出借人数量（人）</div>
                                    <div class="itemSJ color-y" id="investorNew">147</div>
                                </div>
                                <div class="item-yh">
                                    <i class="icon-borrowerNew"></i>
                                    <div class="itemText">当期借款人数量（人）</div>
                                    <div class="itemSJ color-b" id="borrowerNew">19</div>
                                </div>
                                <div class="item-yh">
                                    <i class="icon-AssociationNumber"></i>
                                    <div class="itemText">关联关系借款笔数（笔）</div>
                                    <div class="itemSJ color-g" id="AssociationNumber">0</div>
                                </div>
                                <div class="item-yh">
                                    <i class="icon-AssociationSum"></i>
                                    <div class="itemText">关联关系借款余额（元）</div>
                                    <div class="itemSJ color-y" id="AssociationSum">0.00</div>
                                </div>
                                <div class="item-yh">
                                    <i class="icon-borrowerPer"></i>
                                    <div class="itemText">前十大借款代还金额占比（%）</div>
                                    <div class="itemSJ color-b" id="borrowerPer">43.21</div>
                                </div>
                                <div class="item-yh">
                                    <i class="icon-bigBorrowerPer"></i>
                                    <div class="itemText">最大借款代还金额占比（%）</div>
                                    <div class="itemSJ color-g" id="bigBorrowerPer">7.96</div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="yunyjg" id="yunyjg">
                        <div class="about-right-nav">
                            <div class="sub-a-nav">
                                <a href="#shissj">实时数据</a><a href="#yunyjg">运营报告</a>
                            </div>
                            <em class="em-line" style="left: 120px;"></em>
                        </div>
                        <div class="about-content" id="yybgDiv" style="display: block;">
                            <div class="tableDiv">
                                <a href="http://pujinziben.com/upload/operatereport/front/2018/1/20180103141623751.pdf" download="">
                                    <img class="yybgImg" alt="" src="images/20180103141607653.jpg"></a>
                                <a href="https://www.pujinziben.com:443/upload/operatereport/front/2017/12/20171206145349608.pdf" download=""><img class="yybgImg" alt="" src="images/20171206145342235.jpg"></a>
                                <a href="http://pujinziben.com/upload/operatereport/front/2017/11/20171103084426675.pdf" download=""><img class="yybgImg" alt="" src="images/20171103084409964.jpg"></a>
                                <a href="http://www.pujinziben.com/upload/operatereport/front/2017/10/20171010103911597.pdf" download=""><img class="yybgImg" alt="" src="images/20171010103706853.jpg"></a>
                                <a href="http://www.pujinziben.com/upload/operatereport/front/2017/9/20170902163654022.pdf" download=""><img class="yybgImg" alt="" src="images/20170902163618853.jpg"></a>
                                <a href="../upload/operatereport/front/2017/8/20170802115615736.pdf" download=""><img class="yybgImg" alt="" src="images/20170802115538445.jpg"></a>
                                <a href="https://pujinziben.com/upload/yybg/201707041659007394.pdf" download=""><img class="yybgImg" alt="" src="images/201707041658181221.png"></a>
                                <a href="https://www.pujinziben.com/upload/yybg/201706021854322124.pdf" download=""><img class="yybgImg" alt="" src="images/201706021848519136.jpg"></a>
                                <a href="https://www.pujinziben.com:8443/upload/yybg/201705050916342143.pdf" download=""><img class="yybgImg" alt="" src="images/201705050915048087.jpg"></a>
                                <a href="https://www.pujinziben.com/upload/yybg/201704101141308789.pdf" download=""><img class="yybgImg" alt="" src="images/201704101141172039.png"></a>
                                <a href="http://www.pujinziben.com/upload/yybg/201704061519519851.pdf" download=""><img class="yybgImg" alt="" src="images/20170406151936564.jpg"></a>
                                <a href="http://www.pujinziben.com/upload/yybg/201704101103162901.pdf" download=""><img class="yybgImg" alt="" src="images/201702201718479704.jpg">
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>


            <div class="ptgg" id="ptgg">

                <div class="about-right-nav">
                    <div class="sub-a-nav">
                        <a href="javascript:void(0);" class="active" id="">平台公告</a>
                    </div>
                    <em class="em-line"></em>
                </div>
                <%--公告--%>
                <div class="about-content">
                    <div id="notice">
                        <ul class="notice-list listData">
                            <li class="interval"  v-for="item in rows">
                                <div class="children0">
                                    <a :href="'/dynaxq?id='+item.nid" target="_blank" class="title">{{item.title}}</a>
                                    <span class="time">{{item.createdTime}}</span>
                                </div>
                            </li>
                        </ul>
                        <ul>
                            <div id="demo5"></div>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="zxns" id="zxns"></div>
            <div class="lxwm" id="lxwm"></div>
        </div>
    </div>
    <!-- end -->
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
</div>
</body>

<script src="/static/js/jquery.min.js"></script>
<script src="/static/dynajs/xxpl/js/json2.js"></script>
<script src="/static/js/vue.min.js/"></script>
<script src="/static/js/axios.min.js/"></script>
<script src="/static/layui/layui.js"></script>
<script src="/static/layui/lay/modules/laypage.js"></script>
<script src="/static/js/common.js"></script>
<script >



    layui.use(['laypage','layer','element'], function(){
        var element = layui.element;
        laypage = layui.laypage

        vue.laypage = laypage;
    });


    var vue = new Vue({
        el:'#app',
        data:{
            rows:[],
            laypage:'',
            list:{},
            tmoneyList:[]

        },
        filters: {
            formatDate(time) {
                var date = new Date(time);
                return formatDate(date, 'yyyy-MM-dd');
            }
        },
        created () {
        },
        methods: {
                 listydata: function () {
                 axios.post('/ydata/data/json/all').then((response) => {
                    this.list =response.data;
                     var allMoney =this.list.tmoney + "";
                     var strList = "";
                     for(var i = allMoney.length - 1, len = 0;i >= len; i--){
                         strList+= allMoney.charAt(i)+',';
                     }
                     this.tmoneyList = strList.split(",");
                     this.tmoneyList.pop();
                     }, (error) => {
                 alert(error);
                 });
                 }
            ,
            commonUtil(url,demo) {
                var laypage = this.laypage;
                $.getJSON(url, {
                    pageNumber: 1,
                    pageSize: 5,
                }, function(res){
                    laypage.render({
                        count: res.total,
                        limit :5,
                        elem: demo,
                        jump: function(e, first){
                            if (!first) {
                                vue.commonGetJson(e,url);
                            } else {
                                vue.commonGetJson(e,url);
                            }
                        }
                    });
                });
            },
            commonGetJson(e,url){
                $.getJSON(url, {
                    pageNumber: e.curr,
                    pageSize: e.limit,
                }, function (res) {
                    vue.rows = res.rows;
                });
            }
        },

        computed: {

        },
    });



</script>



</html>