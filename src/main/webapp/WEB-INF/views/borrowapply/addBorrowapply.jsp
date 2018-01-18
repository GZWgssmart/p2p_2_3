<%@ page import="com.animo.pojo.User" %><%--
  Created by IntelliJ IDEA.
  User: qm
  Date: 2017/12/27
  Time: 20:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% String path = request.getContextPath();%>
<html lang="en">
<head>
    <link rel="stylesheet" href="<%=path%>/static/layui/css/layui.css"/>
    <link rel="stylesheet" href="<%=path%>/static/css/user/public.css">
    <link rel="stylesheet" href="<%=path%>/static/css/user/account.css">
    <style>
        .account .account-right {
            width: 900px;
            height: 1000px;
            overflow: hidden;
            display: inline-block;
        }
        .layui-upload-img{width: 92px; height: 92px; margin: 0 10px 10px 0;}
        .account-right, .myCount, .safe {
            width: 900px;
            height: 600px;
        }

        .sub-a-nav {
            width: 899px;
            height: 45px;
            border-bottom: 1px solid #e4e4e4;
        }
        .box1,.safe {

            width: 900px;
            height: 1250px;
        }

        .safe {
            padding-top: 30px;
        }

    </style>
    <style>
        body{padding: 20px;}
        .demo-input{padding-left: 10px; height: 38px; min-width: 262px; line-height: 38px; border: 1px solid #e6e6e6;  background-color: #fff;  border-radius: 2px;}
        .demo-footer{padding: 50px 0; color: #999; font-size: 14px;}
        .demo-footer a{padding: 0 5px; color: #01AAED;}
    </style>
</head>
<body>
<div>

    <div id="app">
        <div class="account cl">
            <div class="account-right">
                <div class="box1">
                    <div class="safe" id="safe">
                        <div class="account-right-nav">
                            <div class="sub-a-nav">
                                <a href="javascript:void(0);" class="active">申请借款</a>
                            </div>
                            <em></em>
                        </div>
                        <div class="account-content" style="display: block;">
                            <!-- 提现 -->
                            <div class="cash-pay">
                                <div class="pay-from layui-form">
                                    <div class="label cl">
                                        <label class="long">真实姓名：</label><input v-model="borrowApplyDetail.rname" type="text" maxlength="10" placeholder="请输入真实姓名">
                                    </div>
                                    <div class="label cl">
                                        <label class="long">申请金额：</label><input v-model="borrowApplyDetail.money" type="text" maxlength="10" placeholder="请输入申请金额">
                                    </div>
                                    <div class="layui-form-item">
                                        <label class="layui-form-label">借款类型：</label>
                                        <div class="layui-input-block" style="width: 295px;">
                                            <select v-model="borrowApplyDetail.type" name="interest" lay-filter="aihao">
                                                <option value="0" >个人</option>
                                                <option value="1">企业</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="layui-form-item">
                                        <label class="layui-form-label">标种：</label>
                                        <div class="layui-input-block" style="width: 295px;">
                                            <select borrowApplyDetail.bzid name="interest" lay-filter="aihao">
                                                <option value="1">恒金保</option>
                                                <option value="2">多金宝</option>
                                                <option value="3">新手标</option>
                                                <option value="4">普金保</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="layui-form-item">
                                        <label class="layui-form-label">借款期限：</label>
                                        <div class="layui-input-block" style="width: 295px;">
                                            <select v-model="borrowApplyDetail.term" name="interest" lay-filter="aihao">
                                                <option value="3">3</option>
                                                <option value="6">6</option>
                                                <option value="9">9</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="label cl label-msg">
                                        <label class="long">截止时间：</label>
                                        <input type="text" v-model="borrowApplyDetail.deadline" class="demo-input" placeholder="请选择日期" id="tests">
                                    </div>
                                    <div class="label cl">
                                        <label class="long">年化收益：</label><input v-model="borrowApplyDetail.nprofit" type="text" maxlength="10"  placeholder="请输入年化收益">
                                    </div>
                                    <div class="layui-form-item" >
                                        <label class="layui-form-label">收益方式：</label>
                                        <div class="layui-input-block" style="width: 295px;">
                                            <select v-model="borrowApplyDetail.way" name="interest" lay-filter="aihao">
                                                <option value="1">等额本息</option>
                                                <option value="2">等额本金</option>
                                                <option value="3">每月付息到账还本</option>
                                                <option value="4">一次性还本付息</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="label cl">
                                        <label class="long">资金用途：</label><input v-model="borrowApplyDetail.mpurpose" type="text" maxlength="80" placeholder="请输入资金用途">
                                    </div>
                                    <div class="label cl">
                                        <label class="long">还款来源：</label><input v-model="borrowApplyDetail.hksource" type="text" maxlength="80" placeholder="请输入还款来源">
                                    </div>
                                    <div class="label cl">
                                        <label class="long">借款人介绍：</label><input v-model="borrowApplyDetail.suggest" type="text" maxlength="10" placeholder="请输借款人">
                                    </div>
                                    <div class="label cl">
                                        <label class="long">项目描述：</label><input v-model="borrowApplyDetail.xmdes" type="text" maxlength="80" placeholder="请输项目描述">
                                    </div>
                                    <div class="label cl">
                                        <label class="long">保障措施：</label><input v-model="borrowApplyDetail.guarantee" type="text" maxlength="80" placeholder="请输项目描述">
                                    </div>
                                    <div class="layui-upload">
                                        <ui class="layui-tab-title">
                                            <li class="first">
                                                <button type="button" class="layui-btn" id="test1">法人身份证</button>
                                                <input class="layui-upload-file" type="file" name="file">
                                                <div class="layui-upload-list">
                                                    <img class="layui-upload-img" id="demo1">
                                                    <p id="demoText1"></p>
                                                </div>
                                            </li>
                                            <li class="first">
                                                <button type="button" class="layui-btn" id="test2">营业执照</button>
                                                <input class="layui-upload-file" type="file" name="file">
                                                <div class="layui-upload-list">
                                                    <img class="layui-upload-img" id="demo2">
                                                    <p id="demoText2"></p>
                                                </div>
                                            </li>
                                            <li class="first">
                                                <button type="button" class="layui-btn" id="test3">银行卡</button>
                                                <input class="layui-upload-file" type="file" name="file">
                                                <div class="layui-upload-list">
                                                    <img class="layui-upload-img" id="demo3">
                                                    <p id="demoText3"></p>
                                                </div>
                                            </li>
                                            <li class="first">
                                                <button type="button" class="layui-btn" id="test4">其他资料</button>
                                                <input class="layui-upload-file" type="file" name="file">
                                                <div class="layui-upload-list">
                                                    <img class="layui-upload-img" id="demo4">
                                                    <p id="demoText4"></p>
                                                </div>
                                            </li>
                                        </ui>
                                    </div>

                                    <button type="button" class="btn layui-btn" id="cash-submit" @click="add">提交申请</button>
                                </div>
                                <div id="returnHtml"></div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>

    </div></div>
</body>
<script src="<%=path%>/static/layui/layui.js"></script>
<script src="<%=path%>/static/js/jquery.min.js"></script>
<script src="<%=path%>/static/js/vue.min.js"></script>
<script src="<%=path%>/static/js/axios.min.js"></script>
<script src="<%=path%>/static/js/qs.js"></script>
<script>

    layui.use(['form', 'upload','laydate'], function(){  //如果只加载一个模块，可以不填数组。如：layui.use('form')
        var form = layui.form //获取form模块
            ,upload = layui.upload //获取upload模块
        ,laydate = layui.laydate;

        var uploadInst = upload.render({
            elem: '#test1'
            ,url: '/upload/'
            ,before: function(obj){
                //预读本地文件示例，不支持ie8
                obj.preview(function(index, file, result){
                    $('#demo1').attr('src', result); //图片链接（base64）
                });
            }
        });
        var uploadInst = upload.render({
            elem: '#test2'
            ,url: '/upload/'
            ,before: function(obj){
                //预读本地文件示例，不支持ie8
                obj.preview(function(index, file, result){
                    $('#demo2').attr('src', result); //图片链接（base64）
                });
            }
        });
        var uploadInst = upload.render({
            elem: '#test3'
            ,url: '/upload/'
            ,before: function(obj){
                //预读本地文件示例，不支持ie8
                obj.preview(function(index, file, result){
                    $('#demo3').attr('src', result); //图片链接（base64）
                });
            }
        });
        var uploadInst = upload.render({
            elem: '#test4'
            ,url: '/upload/'
            ,before: function(obj){
                //预读本地文件示例，不支持ie8
                obj.preview(function(index, file, result){
                    $('#demo4').attr('src', result); //图片链接（base64）
                });
            }
        });
        laydate.render({
            elem: '#tests' //指定元素
        });
    });

    new Vue({
        el:'#app' ,
        data:{
            borrowApplyDetail:{
                rname:'',
                money:0,
                type:0,
                bzid:1,
                term:3,
                deadline:'',
                nprofit:0,
                way:1,
                mpurpose:'',
                hksource:'',
                suggest:'',
                xmdes:'',
                guarantee:''
            }
        },
        methods:{
            add () {
                console.log(this.borrowApplyDetail);
            }
        }
    });
</script>

</html>