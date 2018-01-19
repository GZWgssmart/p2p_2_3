<%--
  Created by IntelliJ IDEA.
  User: CHEN JX
  Date: 2018/1/12
  Time: 9:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<%
    String path=request.getContextPath();
%>
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
                            <a :href="'/qdynaxq?id='+item.nid" target="_blank" class="title">{{item.title}}</a>
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
                $.getJSON('/notice/data/json/PagerCriteria', {pageNumber: 1,pageSize:5}, function(res){
                    laypage.render({
                        elem: 'demo5',
                        count: res.total, //数据总数，从服务端得到
                        limit :5,
                        jump: function(e, first){
                            if (!first) {
                                vue.commonGetJson(e,"/notice/data/json/PagerCriteria");
                            } else {
                                vue.commonGetJson(e,"/notice/data/json/PagerCriteria");
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