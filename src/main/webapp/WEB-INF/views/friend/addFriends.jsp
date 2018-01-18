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
    <div id="appFriend">

        <!--添加合作伙伴-->
        <form class="layui-form">
            <div class="layui-form-item">
                <label class="layui-form-label">合作伙伴url</label>
                <div class="layui-input-block">
                    <input type="text" class="layui-input" lay-verify="required|url" v-model="friend.furl" placeholder="合作伙伴url">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">图标来源</label>
                <div class="layui-input-block">
                    <input type="text" v-model="friend.fpic" disabled placeholder="图标来源"
                           autocomplete="off" class="layui-input">
                </div>
            </div>
                <div class="layui-form-item" v-model="friend">
                    <label class="layui-form-label">图标</label>
                    <div class="layui-upload-drag" id="uploadPic">
                        <i class="layui-icon"></i>
                        <p>点击上传，或将文件拖拽到此处</p>
                        <img id="imgSrc">
                    </div>
                </div>
            <div class="layui-form-item">
                <div class="layui-input-block">
                    <button class="layui-btn" lay-submit lay-filter="saveFriend" @click="saveFriend">保存</button>
                    <%--<a href="<%=path%>/back/friends/pagerFriend">--%>
                        <%--<button class="layui-btn">返回列表</button>--%>
                    <%--</a>--%>
                </div>
            </div>
        </form>
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
<script type="text/javascript" src="<%=path%>/static/js/layui-formVerify.js"></script>

</html>
