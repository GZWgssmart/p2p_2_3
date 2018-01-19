<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="layui-tab layui-tab-brief" id="monthData" lay-filter="demo" style="float: left;">
    <ul class="layui-tab-title">
        <li class="layui-this">实时数据</li>
        <li>运营报告</li>
    </ul>
    <div class="layui-tab-content" style="width: 900px">
        <div class="layui-tab-item layui-show">
            <div class="about-content">
                <div class="content">
                </div>
                <div class="about-content" id="sssjDiv" style="display: block;">
                    <div class="btnDiv">
                        撮合交易总额（元）
                    </div>

                    <div class="moneyDiv">
                        <div v-for="item in tmoneyList" >
                            <div class="marginLeft"></div>
                            <div v-if="item!=','" class="item_Div">{{item}}</div>
                            <div v-else class="marginLeft">,</div>
                        </div>
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
        </div>

        <div class="layui-tab-item">
            <div class="about-content" id="zdsxDiv">
                <div class="content">
                    <div class="yunyjg" id="yunyjg">
                        <div class="about-right-nav">
                            <em class="em-line" style="left: 120px;"></em>
                        </div>
                        <div class="about-content" id="yybgDiv" style="display: block;">
                            <!--月运营数据-->
                            <div class="tableDiv">
                                <a :href="'/ydata/data/json/downloadMonthData?longTime='+item.createdTime"
                                   v-for="item in ydatas">
                                    <img class="yybgImg" title="点击下载统计报表" src="/static/js/font/images/defaultjpg.jpg">
                                    <span>{{item.createdTime | formatDate}}</span>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
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
                list: {},
                tmoneyList: []
            },
            methods: {},
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
                vue.list = response.data;
                vue.tmoneyList = formatMoney(response.data.tmoney,2);
            }, (error) => {
                alert(error);
            });
        }

    })


</script>
