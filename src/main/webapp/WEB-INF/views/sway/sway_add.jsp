<%--
  Created by IntelliJ IDEA.
  User: CHEN JX
  Date: 2018/1/17
  Time: 9:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="/static/layui/css/layui.css" media="all">
    <link rel="stylesheet" href="/static/css/user/style.css"/>
</head>
<body>
<form class="layui-form" action="">
    <label class="layui-form-label">还款方式</label>

        <div class="layui-input-block" style="width: 200px;">
            <select name="sway" lay-verify="">
                <option value="">请选择一个还款方式</option>
                <option value="010">等额本息</option>
                <option value="021">等额本金</option>
                <option value="0571">每月付息到期还本</option>
                <option value="0571">一次性还本付息</option>
            </select>
    </div>
    </br>
    <div class="layui-form-item layui-form-text" >
        <label class="layui-form-label">算法</label>
        <div class="layui-input-block">
            <textarea name="desc" placeholder="请输入内容" class="layui-textarea" style="width: 500px;height: 200px;"></textarea>
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">是否可用</label>
        <div class="layui-input-block">
            <input type="radio" name="sex" value="Y" title="是">
            <input type="radio" name="sex" value="N" title="否" checked>
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
<script type="text/javascript" src="/static/js/jquery-js/jquery.min.js"></script>
<script type="text/javascript" src="/static/js/vue.min.js"></script>
<script type="text/javascript" src="/static/js/axios.min.js"></script>
<script type="text/javascript" src="/static/layui/layui.js"></script>
<script type="text/javascript" src="/static/js/user/province.js"></script>
<script type="text/javascript" src="/static/js/qs.js"></script>
</html>
