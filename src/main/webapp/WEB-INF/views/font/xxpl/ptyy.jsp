<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html><head>

    <style>
        body{ text-align:center}
        #divcss5{margin:0 auto;border:1px ;width:860px;height:100px}

    </style>

</head>
<body>

<%--<div class="about-right">--%>
<div id="monthData">
<div class="layui-tab layui-tab-brief" lay-filter="demo" style="float: left;">
    <ul class="layui-tab-title">
        <li class="layui-this">实时数据</li>
        <li>运营报告</li>
    </ul>
    <div class="layui-tab-content" style="width: 900px">
        <div class="shissj" id="shissj">
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

        <!--月运营数据-->
        <div class="layui-tab-item" id="monthData">
            <div class="about-content" id="yybgDiv" style="display: block;">
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