<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/1/8
  Time: 15:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<html>
<head>
    <title>合作伙伴</title>
    <link rel="stylesheet" href="<%=path%>/static/layui/css/layui.css"/>
</head>
<body>
<div id="appFriend">
    <div id="btn">
        <button class="layui-btn" @click="showAddWin">添加</button>
    </div>
    <!--layui表格-->
    <table class="layui-hide" id="friends" lay-filter="friend"></table>

    <!--table工具栏-->
    <script type="text/html" id="barFriend">
        <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
        <a class="layui-btn layui-btn-xs" lay-event="bigPic">查看大图</a>
    </script>

    <div id="addFriendWin" style="display: none">
        <!--添加合作伙伴-->
        <div class="layui-form-item">
            <label class="layui-form-label">合作伙伴url</label>
            <div class="layui-input-block">
                <input type="text" v-model="friend.furl" required lay-verify="required" placeholder="合作伙伴url"
                       autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">图标来源</label>
            <div class="layui-input-block">
                <input type="text" v-model="friend.fpic" disabled required lay-verify="required" placeholder="图标来源"
                       autocomplete="off" class="layui-input">
            </div>
        </div>
        <form enctype="multipart/form-data" method="post">
            <div class="layui-form-item" v-model="friend">
                <label class="layui-form-label">图标</label>
                <div class="layui-upload-drag" id="uploadPic">
                    <i class="layui-icon"></i>
                    <p>点击上传，或将文件拖拽到此处</p>
                    <img id="imgSrc">
                </div>
            </div>
        </form>

        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" @click="saveFriend">保存</button>
            </div>
        </div>
    </div>

    <div id="editFriendWin" style="display: none">
        <!--修改合作伙伴-->
        <div class="layui-form-item">
            <label class="layui-form-label">合作伙伴url</label>
            <div class="layui-input-block">
                <input type="text" v-model="friend.furl" required lay-verify="required" placeholder="合作伙伴url"
                       autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">图标来源</label>
            <div class="layui-input-block">
                <input type="text" v-model="friend.fpic" disabled required lay-verify="required" placeholder="图标来源"
                       autocomplete="off" class="layui-input">
            </div>
        </div>
        <form enctype="multipart/form-data" method="post">
            <div class="layui-form-item" v-model="friend">
                <label class="layui-form-label">图标</label>
                <div class="layui-upload-drag" id="uploadPic2">
                    <i class="layui-icon"></i>
                    <p>点击上传，或将文件拖拽到此处</p>
                    <img id="imgSrc2">
                </div>
            </div>
        </form>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" @click="updateFriend">保存</button>
            </div>
        </div>
    </div>

    <div id="bigPicWin" style="display: none">
        <!--查看大图-->
        <div class="layui-form-item">
            <label class="layui-form-label">图标来源</label>
            <div class="layui-input-block">
                <input type="text" v-model="friend.fpic" disabled required lay-verify="required" placeholder="图标来源"
                       autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item" v-model="friend">
            <label class="layui-form-label">图标</label>
                <img id="imgSrc3">
        </div>
    </div>
</div>
</body>
<script src="<%=path%>/static/js/jquery-js/jquery.min.js"></script>
<script type="text/javascript" src="<%=path%>/static/js/vue.min.js"></script>
<script type="text/javascript" src="<%=path%>/static/js/axios.min.js"></script>
<script type="text/javascript" src="<%=path%>/static/layui/layui.js"></script>
<script type="text/javascript" src="<%=path%>/static/js/qs.js"></script>
<!--自定义js文件-->
<script type="text/javascript" src="<%=path%>/static/js/friend-js/friend.js"></script>
</html>
