<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--<div class="about-right">--%>
<div class="layui-tab layui-tab-brief" lay-filter="demo" style="float: left;">
    <ul class="layui-tab-title">
        <li class="layui-this">实时数据</li>
        <li>运营报告</li>
    </ul>
    <div class="layui-tab-content" style="width: 900px">
        <div class="layui-tab-item layui-show">
            <div class="about-content">
                <div class="content">
                    <p class="text">全称及简称：<span class="textRight">普金资本运营（赣州）有限公司</span></p>
                    <p class="text">注册资本：<span class="textRight">3000万元</span></p>
                    <p class="text">注册地址：<span class="textRight">江西省赣州市章贡区章江新区赣州中航城10B-18</span></p>
                    <p class="text">成立时间：<span class="textRight">2016年3月7日</span></p>
                    <p class="text">法定代表人：<span class="textRight">姜茗盛</span></p>
                    <div class="textDivs">
                        <p class="xx">经营范围：<span class="textRight">资产管理：企业项目投资与管理；企业营销与策划；接受金融机构委托从事金融信息技术外包；接受金融机构委托从事金融业务流程外包；接受金融机构委托从事金融知识流程外包。</span>
                        </p>
                    </div>
                    <p class="text">联系方式：<span class="textRight">0797-2190888</span></p>
                    <p class="text">邮箱：<a href="mailto:ling.gu@pujinziben.com" class="xxpl_a">ling.gu@pujinziben.com</a>
                    </p>
                    <p class="text">从业机构及其各分支机构经营场所：<span class="textRight">无</span></p>
                    <p class="text">注册协议模板：<a href="javascript:AgreeMent();" class="xxpl_a">《普金资本服务协议》</a></p>
                    <p class="text">资金存管情况：<span class="textRight">与江西银行协议洽谈中</span></p>
                    <p class="text">合作第三方机构的关联系：<span class="textRight">无</span></p>
                    <p class="text">与保险机构、担保机构等各类涉及个体网络借贷业务相关的第三方机构合作情况：<span class="textRight">无</span></p>
                </div>

                <div id="popup-captcha"></div>
                <div class="popup AgreeMent" style="left:auto;top:20%;width:800px; height: 500px;">
                    <p class="title left">普金资本服务协议</p>
                    <a href="javascript:void(0);" class="close icon icon-close"></a>
                    <div class="popup-area">

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
<script type="text/javascript" src="/static/js/font/jquery.js"></script>
<script src="/static/js/common.js"></script>
<script src="/static/js/vue.min.js/"></script>
<script src="/static/js/axios.min.js/"></script>
<script type="text/javascript">
    $(function () {
        var vue = new Vue({
            el: '#monthData',
            data: {
                ydatas: []
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
    })
</script>
<%--
</div>--%>
