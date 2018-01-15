<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html><head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="/static/dynajs/xxpl/css/public.css">
    <link rel="stylesheet" href="/static/dynajs/xxpl/css/about.css">
    <link rel="stylesheet" href="/static/dynajs/css/shenluehao.css">
    <link rel="stylesheet" href="/static/layui/css/layui.css">
    <style>
        body{ text-align:center}
        #divcss5{margin:0 auto;border:1px ;width:860px;height:100px}

    </style>

</head>
<body>
<%--<div class="about-right">--%>
<div id="monthData">
    <div class="ptyy" id="ptyy">
        <div class="details">
            <div class="shissj" id="shissj">
                <div class="about-right-nav">
                    <div class="sub-a-nav">
                        <a href="#shissj">实时数据</a><a href="#yunyjg">运营报告</a>
                    </div>
                    <em class="em-line" style="left: 0px;"></em>
                </div>
                <div class="about-content" id="sssjDiv"  style="display: block;" >
                    <div class="btnDiv">
                        撮合交易总额（元）
                    </div>

                    <div class="moneyDiv">
                        <div  v-for="item in tmoneyList">
                            <div class="marginLeft"> </div>
                            <div class="item_Div" id="allmoney7">{{item}}</div>
                        </div>
                        <div class="marginLeft">.</div>
                        <div class="item_Div" id="allmoney8">0</div>
                        <div class="marginLeft"> </div>
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
                    <!--月运营数据-->
                            <div class="tableDiv">
                                <a :href="'/ydata/data/json/downloadMonthData?longTime='+item.createdTime" v-for="item in ydatas">
                                    <img class="yybgImg" title="点击下载统计报表" src="/static/js/font/images/defaultjpg.jpg">
                                    <span>{{item.createdTime | formatDate}}</span>
                                </a>
                    </div>
                </div>
            </div>
        </div>
    </div>













</div>
</body>
<script type="text/javascript" src="/static/js/font/jquery.js"></script>
<script src="/static/js/common.js"></script>
<script src="/static/js/vue.min.js/"></script>
<script src="/static/js/axios.min.js/"></script>

<script type="text/javascript" src="/static/layui/layui.js"></script>
<script type="text/javascript" src="/static/layui/lay/modules/laypage.js"></script>
<script src="/static/dynajs/xxpl/js/json2.js"></script>
<script src="/static/js/common.js"></script>
<script type="text/javascript">
    $(function () {
        var vue = new Vue({
            el: '#monthData',
            data: {
                ydatas: [],
                list:{},
                tmoneyList:[]
            },
            methods: {
            },
            filters: {
                formatDate(time) {
                    var date = new Date(time);
                    return formatDate(date, 'yyyy年MM月份');
                }
            },
            created() {
                getMonthData();
                listydata();
            }
        });

        function getMonthData() {
            axios.get('/ydata/data/json/pager').then((response) => {
                vue.ydatas = response.data.rows;
                console.log(vue.ydatas);
            }, (error) => {
                layer.alert("请求失败");
            });
        }


        function listydata() {
            axios.post('/ydata/data/json/all').then((response) => {
                vue.list =response.data;
                var allMoney =vue.list.tmoney + "";
                var strList = "";
                for(var i = allMoney.length - 1, len = 0;i >= len; i--){
                    strList+= allMoney.charAt(i)+',';
                }
                vue.tmoneyList = strList.split(",");
                console.log(vue.tmoneyList);
                vue.tmoneyList.pop();
            }, (error) => {
                alert(error);
            });
        }

    })




</script>
<%--
</div>--%>
</html>