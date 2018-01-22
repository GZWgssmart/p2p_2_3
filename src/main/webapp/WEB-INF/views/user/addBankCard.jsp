<%--
  Created by IntelliJ IDEA.
  User: qm
  Date: 2017/12/28
  Time: 10:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% String path = request.getContextPath();%>
<html>
<head>
    <title>汇付天下</title>
    <link rel="stylesheet" href="<%=path%>/static/layui/css/layui.css"/>
    <link rel="stylesheet" href="<%=path%>/static/css/user/style.css"/>
    <link rel="icon" href="<%=path%>/static/images/index/logo_title.jpg" type="image/x-icon"/>
</head>
<body class="w960">
<%@include file="../common/top.jsp"%>
<div class="wrapper">
    <div class="min-width-out">
        <div class="min-width-in">
            <div class="min-width">
                <div class="header">
                    <div class="content">
                        <a href="" target="_blank" class="logo-new" title="汇付天下"></a>
                        <div id="logo-extra"><img id="logo-extra-img"/></div>
                    </div>
                </div>
                <div class="main">
                    <div class="content">
                        <h1 class="page-title">绑定取现银行卡<span> 该银行卡将作为利息发放及本金发放的银行卡</span></h1>
                        <div autocomplete="off"
                             class="validate-form errFocus" novalidate=""><input type="text" name="prevent_autofill"
                                                                                 id="prevent_autofill" value=""
                                                                                 style="display:none;"><input
                                type="password" id="password_fake" value="" style="display:none;" pname="password_fake">
                            <input type="hidden" name="loginId" id="loginId" value="pjzb_111193">
                            <div class="form form-border mb30">
                                <!--平台名称-->
                                <div class="form-title form-title-big">
                                    <p class="info mb15"><span>平台名称: 普金资本</span>
                                        <span>公司名称: 普金资本运营(赣州)有限公司</span></p>
                                </div>
                                <div id="bankCard" class="layui-form">
                                    <div class="form-content">
                                        <!--账户余额开始-->
                                        <dl class="form-list form-list-no-icon">
                                            <dd>
                                                <div class="form-group">
                                                    <label class="label">真实姓名:</label>
                                                    <span class="form-text">{{user.rname}}</span>
                                                </div>
                                                <div class="form-group">
                                                    <label class="label">证件号码:</label>
                                                    <span class="form-text">{{user.idno}}</span>
                                                </div>
                                            </dd>
                                            <dd>
                                                <div id="belongBank">
                                                    <div class="layui-form-item">
                                                        <label class="layui-form-label">所属银行</label>
                                                        <div class="layui-input-block" style="width: 300px;">
                                                            <select id="type">
                                                                <option value="中国银行">中国银行</option>
                                                                <option value="中国农业银行">中国农业银行</option>
                                                                <option value="中国建设银行">中国建设银行</option>
                                                                <option value="中国工商银行">中国工商银行</option>
                                                                <option value="招商银行">招商银行</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="layui-form-item">
                                                    <div class="layui-inline">
                                                        <label class="layui-form-label">银行卡号</label>
                                                        <div class="layui-input-inline" style="width: 300px;">
                                                            <input id="cardno" type="tel" v-model="bankcard.cardno" required
                                                                   lay-verify="required" autocomplete="off"
                                                                   class="layui-input">
                                                        </div>
                                                    </div>
                                                </div>
                                            </dd>
                                        </dl>
                                        <div class="layui-form-item">
                                            <div class="layui-input-block">
                                                <button class="layui-btn" lay-submit="" lay-filter="demo1"
                                                        @click="save">立即提交
                                                </button>
                                                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="secure-tips">
                    <h2>汇付天下，全面保障您的资金安全<i></i></h2>
                    <div class="content">
                        <p>
                            汇付天下P2P账户系统托管，是汇付天下为P2P行业量身定制的账户系统与支付服务系统。一方面，为P2P平台开发定制账户系统，提供系统外包运营服务；另一方面，为P2P平台提供支付和结算服务，帮助平台和用户实现充值、取现、资金划拨等服务；投资人资金划入虚拟账户后，平台无法触碰资金，避免了资金池模式。但是，我们对投资风险（包括但不限于平台或其他借款人违约）不承担任何责任，投资需谨慎。</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="min-width-out">
    <div class="min-width-in">
        <div class="footer min-width">
            <div class="content">
                汇付天下有限公司版权所有 Copyright &copy; 2016 ChinaPnR All Right Reserved &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <a target="_blank" href="">
                    <img src="<%=path%>/static/css/images/babhtb.png" style="absolute:middle;"> 沪公网安备
                    31010402000137号</a>
                <br>
                <a href="">关于汇付天下</a>
                <a href="" target="_blank">安全保障</a>
                <a href="" target="_blank">帮助中心</a>
                <a href="" target="_blank">联系我们</a>
                <span style="position: absolute;left: 522px;">沪ICP备17052888号-2</span>
                <span class="phone">客服电话: <i>400 820 2819</i></span>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript" src="<%=path%>/static/js/jquery-js/jquery.min.js"></script>
<script type="text/javascript" src="<%=path%>/static/js/vue.min.js"></script>
<script type="text/javascript" src="<%=path%>/static/js/axios.min.js"></script>
<script type="text/javascript" src="<%=path%>/static/layui/layui.js"></script>
<script type="text/javascript" src="<%=path%>/static/js/user/province.js"></script>
<script type="text/javascript" src="<%=path%>/static/js/qs.js"></script>
<script type="text/javascript">
    var vue = new Vue({
        el: "#bankCard",
        data: {
            bankcard: {
                type: '',
                cardno: '',
                rname:'',
                idno:''
            },
            user:[]
        },
        created () {
            axios.get('/user/data/json/byiddync?id='+${sessionScope.user.uid}).then((response) => {
                this.user = response.data.data;
            });
        },
        methods: {
            save: function () {
                var options=$("#type option:selected"); //获取选中的项
                vue.bankcard.type = options.val();
                vue.bankcard.rname=vue.user.rname;
                vue.bankcard.idno=vue.user.idno;
                console.log(vue.bankcard);
               if(vue.bankcard.cardno!=''){
                axios.post('/bankcard/data/json/save', Qs.stringify(vue.bankcard))
                    .then((response) => {
                        if(response.data.code==0){
                            alert('绑定成功');
                           return window.location.href="/user/accountOverride";
                        }
                        alert(response.data.message);
                    }, (error) => {
                        alert('服务器错误');
                    });

               }
            }
        }
    })
</script>
</body>
</html>
