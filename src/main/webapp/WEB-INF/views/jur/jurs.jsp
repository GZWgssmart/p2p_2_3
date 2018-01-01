<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/12/28
  Time: 10:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<html>
<head>
    <title>所有权限</title>
    <%@include file="jur-head.jsp"%>
</head>
<body>
<div id="appJur">

    <!--layui表格-->
    <table class="layui-hide" id="jurs" lay-filter="jur"></table>

    <!--table工具栏-->
    <script type="text/html" id="barJur">
        <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
        <a class="layui-btn layui-btn-xs" lay-event="distr">分配权限</a>
    </script>

    <!--编辑窗口-->
    <div id="editWin" style="display: none">
        <form class="layui-form">
        <div class="layui-form-item">
            <label class="layui-form-label">权限url</label>
            <div class="layui-input-block">
                <input type="text" v-model="jur.jurl" required  lay-verify="required" placeholder="请输入权限url" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">权限描述</label>
            <div class="layui-input-block">
                <input type="text" v-model="jur.content" required  lay-verify="required" placeholder="请输入权限描述" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" v-on:click="update">保存</button>
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </div>
        </form>
    </div>

    <!--权限分配-->
    <div id="distrWin" style="display: none">
        <input type="hidden" v-model="jur.jid" required  lay-verify="required" autocomplete="off" class="layui-input">
        <div class="layui-form-item">
            <label class="layui-form-label">当前权限url</label>
            <div class="layui-input-block">
                <input type="text" disabled v-model="jur.jurl" required  lay-verify="required" placeholder="请输入权限url" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">权限描述</label>
            <div class="layui-input-block">
                <input type="text" disabled v-model="jur.content" required  lay-verify="required" placeholder="请输入权限描述" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">请勾选权限分配的角色</label>
            <!--角色树-->
            <ul id="roleTree" class="ztree" style="width:auto; overflow:auto;"></ul>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" @click="saveRoleJur">保存</button>
            </div>
        </div>
    </div>

</div>
</body>
<%@include file="jur-foot.jsp"%>
</html>
