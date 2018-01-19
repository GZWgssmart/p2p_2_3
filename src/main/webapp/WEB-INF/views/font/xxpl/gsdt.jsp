<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path=request.getContextPath();
%>

<html>
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

<body>
<div id="app">
    <div class="gsdt" id="gsdt">
        <div class="details">
            <div class="dongtai" id="dongtai">
                <div class="about-right-nav">
                    <div class="sub-a-nav">
                        <a href="#dongtai" @click="gsdt">公司动态</a><a href="#baodao" @click="mtbd" >媒体报道</a>
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
                                        <a :href="'/qdynaxq?id='+item.dyid"  class="news-title">{{item.title}}</a>
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
                        <a href="#dongtai" @click="gsdt" >公司动态</a><a href="#baodao" @click="mtbd">媒体报道</a>
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
                                        <a :href="'/qdynaxq?id='+item.mid" class="news-title">{{item.title}}</a>
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
</div>
</body>

<script type="text/javascript" src="<%=path%>/static/layui/layui.js"></script>
<script type="text/javascript" src="<%=path%>/static/layui/lay/modules/laypage.js"></script>
<script src="/static/dynajs/xxpl/js/json2.js"></script>
<script src="<%=path%>/static/js/vue.min.js/"></script>
<script src="<%=path%>/static/js/axios.min.js/"></script>
<script src="<%=path%>/static/js/common.js"></script>

<script >

    var laypage = layui.laypage;

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
                this.gsdt();
            },
            methods: {
                gsdt(){
                    //执行一个laypage实例
                    $.getJSON('/dyna/data/json/PagerCriteria', {pageNumber: 1,pageSize:5}, function(res){
                        laypage.render({
                            elem: 'demo3',
                            count: res.total, //数据总数，从服务端得到
                            limit :5,
                            jump: function(e, first){
                                if (!first) {
                                    vue.commonGetJson(e,"/dyna/data/json/PagerCriteria");
                                } else {
                                    vue.commonGetJson(e,"/dyna/data/json/PagerCriteria");
                                }
                            }
                        });
                    });


                },
                mtbd(){
                    //执行一个laypage实例
                    $.getJSON('/media/data/json/PagerCriteria', {pageNumber: 1,pageSize:5}, function(res){
                        laypage.render({
                            elem: 'demo4',
                            count: res.total, //数据总数，从服务端得到
                            limit :5,
                            jump: function(e, first){
                                if (!first) {
                                    vue.commonGetJson(e,"/media/data/json/PagerCriteria");
                                } else {
                                    vue.commonGetJson(e,"/media/data/json/PagerCriteria");
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

//        function commonUtil(url,demo) {
//            $.getJSON(url, {
//                pageNumber: 1,
//                pageSize: 5,
//            }, function(res){
//                laypage.render({
//                    count: res.total,
//                    limit :5,
//                    elem: demo,
//                    jump: function(e, first){
//                        if (!first) {
//                            vue.commonGetJson(e,url);
//                        } else {
//                            vue.commonGetJson(e,url);
//                        }
//                    }
//                });
//            });
//        }
//        function  commonGetJson(e,url){
//            $.getJSON(url, {
//                pageNumber: e.curr,
//                pageSize: e.limit,
//            }, function (res) {
//                vue.rows = res.rows;
//            });
//        }





</script>

</html>
