<%--
  Created by IntelliJ IDEA.
  User: CHEN JX
  Date: 2017/12/26
  Time: 9:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <title>Layui时间模块同页面显示多种时间样式</title>
    <link rel="stylesheet" href="<%=path %>/static/layui/css/layui.css" media="all">
    <style>
        body{margin: 10px;}
    </style>
</head>
<body>
<div id="app">

    <form class="layui-form" action="">
        <div class="layui-form-item">
            <label class="layui-form-label">输入框</label>
            <div class="layui-input-block">
                <input type="text" name="title" v-model="title" required  lay-verify="required" placeholder="请输入标题" autocomplete="off" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">文本域</label>
            <div class="layui-input-block">
                <textarea name="content" v-model="content" placeholder="请输入内容" class="layui-textarea"></textarea>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit lay-filter="formDemo" @click="add()">立即提交</button>
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </div>
    </form>
</div>
<script src="<%=path %>/static/layui/layui.js"></script>
<script src="/static/js/vue.min.js"></script>
<script src="/static/js/axios.min.js"></script>
<script>


    new Vue({
        el:"#app",
        data:{
            title:'',
            content:'',
        },
        methods:{
            add () {
                var params = new URLSearchParams();
                params.append('title', this.title);
                params.append('content', this.content);
                axios.post('/letter/data/json/save',params).then((response)=>{

                },(error)=>{

                });
            }
        }

    })
</script>
</body>
</html>