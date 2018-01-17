<%--
  Created by IntelliJ IDEA.
  User: CHEN JX
  Date: 2018/1/16
  Time: 20:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="/static/layui/css/layui.css" media="all">
</head>
<body>
</br></br>
<form class="layui-form" action="">
    <div class="layui-form-item layui-form-text" >
        <label class="layui-form-label">内容</label>
        <div class="layui-input-block">
            <textarea name="desc" placeholder="请输入内容" class="layui-textarea" style="width: 500px;height: 200px;"></textarea>
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-input-block">
            <button class="layui-btn" lay-submit lay-filter="formDemo">立即提交</button>
            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
        </div>
    </div>
</form>

</body>
<script src="/static/layui/layui.js"></script>
<script src="/static/js/jquery.min.js"></script>
<script src="/static/js/vue.min.js"></script>

</html>
