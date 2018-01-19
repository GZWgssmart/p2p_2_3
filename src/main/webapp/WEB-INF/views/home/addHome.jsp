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
    <title>添加合作伙伴</title>
    <link rel="stylesheet" href="<%=path%>/static/layui/css/layui.css"/>
</head>
<div>
    <div id="appHome">

        <!--添加轮播图一-->
        <div class="layui-form-item">
            <label class="layui-form-label">轮播图第一</label>
            <div class="layui-input-block">
                <input type="text" v-model="home.url1" required lay-verify="required" placeholder="轮播图一"
                       autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">轮播图路径</label>
            <div class="layui-input-block">
                <input type="text" v-model="home.pic1" disabled required lay-verify="required" placeholder="轮播图路径"
                       autocomplete="off" class="layui-input">
            </div>
        </div>
        <form enctype="multipart/form-data" method="post">
            <div class="layui-form-item" v-model="home">
                <label class="layui-form-label">图片</label>
                <div class="layui-upload-drag" id="uploadPic">
                    <i class="layui-icon"></i>
                    <p>点击上传，或将文件拖拽到此处</p>
                    <img id="imgSrc">
                </div>
            </div>
        </form>
        <!--添加轮播图二-->
        <div class="layui-form-item">
            <label class="layui-form-label">轮播图第二</label>
            <div class="layui-input-block">
                <input type="text" v-model="home.url2" required lay-verify="required" placeholder="轮播图二"
                       autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">轮播图路径</label>
            <div class="layui-input-block">
                <input type="text" v-model="home.pic2" disabled required lay-verify="required" placeholder="轮播图路径"
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
        <!--添加轮播图三-->
        <div class="layui-form-item">
            <label class="layui-form-label">轮播图第三</label>
            <div class="layui-input-block">
                <input type="text" v-model="home.url3" required lay-verify="required" placeholder="轮播图三"
                       autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">轮播图路径</label>
            <div class="layui-input-block">
                <input type="text" v-model="home.pic3" disabled required lay-verify="required" placeholder="轮播图路径"
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
                <button class="layui-btn" @click="saveHome">保存</button>
            </div>
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
