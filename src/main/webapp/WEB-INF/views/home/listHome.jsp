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
    <title>首页轮播图</title>
    <link rel="stylesheet" href="<%=path%>/static/layui/css/layui.css"/>
</head>
<body>
<div id="appHome">
    <%--<div id="btn">--%>
    <%--<button class="layui-btn" @click="showAddWin">添加</button>--%>
    <%--</div>--%>
    <!--layui表格-->
    <table class="layui-hide" id="home" lay-filter="home"></table>
    <!--table工具栏-->
    <script type="text/html" id="barFriend">
        <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
        <a class="layui-btn layui-btn-xs" lay-event="bigPic">查看图一</a>
        <a class="layui-btn layui-btn-xs" lay-event="bigPic2">查看图二</a>
        <a class="layui-btn layui-btn-xs" lay-event="bigPic3">查看图三</a>
        <a class="layui-btn layui-btn-xs" lay-event="upd">激活</a>


    </script>

    <div id="editFriendWin" style="display: none">
        <!--修改合作伙伴-->
        <div class="layui-form-item">
            <label class="layui-form-label">跳转地址</label>
            <div class="layui-input-block">
                <input type="text" v-model="home.url1" required lay-verify="required" placeholder="请输入跳转地址"
                       autocomplete="off" class="layui-input">
            </div>
        </div>
        <form enctype="multipart/form-data" method="post">
            <input type="hidden" name="hid" id="hid">
            <div class="layui-form-item" v-model="home">
                <label class="layui-form-label">图片</label>
                <div class="layui-upload-drag" id="uploadPic">
                    <i class="layui-icon"></i>
                    <p>点击上传，或将文件拖拽到此处</p>
                    <img id="imgSrc">
                </div>
            </div>
        </form>


        <div class="layui-form-item">
            <label class="layui-form-label">跳转地址</label>
            <div class="layui-input-block">
                <input type="text" v-model="home.url2" required lay-verify="required" placeholder="请输入跳转地址"
                       autocomplete="off" class="layui-input">
            </div>
        </div>
        <form enctype="multipart/form-data" method="post">
            <div class="layui-form-item" v-model="home">
                <label class="layui-form-label">图片</label>
                <div class="layui-upload-drag" id="uploadPic2">
                    <i class="layui-icon"></i>
                    <p>点击上传，或将文件拖拽到此处</p>
                    <img id="imgSrc2">
                </div>
            </div>
        </form>

        <div class="layui-form-item">
            <label class="layui-form-label">跳转地址</label>
            <div class="layui-input-block">
                <input type="text" v-model="home.url3" required lay-verify="required" placeholder="请输入跳转地址"
                       autocomplete="off" class="layui-input">
            </div>
        </div>
        <form enctype="multipart/form-data" method="post">
            <div class="layui-form-item" v-model="home">
                <label class="layui-form-label">图片</label>
                <div class="layui-upload-drag" id="uploadPic3">
                    <i class="layui-icon"></i>
                    <p>点击上传，或将文件拖拽到此处</p>
                    <img id="imgSrc3">
                </div>
            </div>
        </form>


        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" @click="updateHome">保存</button>
            </div>
        </div>
    </div>


    <div id="bigPicWin" style="display: none">
        <div class="layui-form-item" v-model="home">
            <label class="layui-form-label">图片</label>
            <img id="imgSrc7">
        </div>
    </div>

    <div id="bigPicWin2" style="display: none">
        <div class="layui-form-item" v-model="home">
            <label class="layui-form-label">图片</label>
            <img id="imgSrc4">
        </div>
    </div>
    <div id="bigPicWin3" style="display: none">
        <div class="layui-form-item" v-model="home">
            <label class="layui-form-label">图片</label>
            <img id="imgSrc5">
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
<script type="text/javascript" src="<%=path%>/static/js/home-js/home.js"></script>
</html>
