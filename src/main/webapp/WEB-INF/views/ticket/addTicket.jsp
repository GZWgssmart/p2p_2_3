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
    <title>添加券</title>
    <link rel="stylesheet" href="<%=path%>/static/layui/css/layui.css"/>
</head>
<body>
<div id="appTicket">
    <div id="addTicketWin">
        <form class="layui-form">
            <div class="layui-form-item">
                <label class="layui-form-label">券名称</label>
                <div class="layui-input-block">
                    <input type="text" v-model="ticket.name" lay-verify="required" placeholder="券名称"
                           autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">类型</label>
                <div class="layui-input-block">
                    <input type="radio" name="type" value="1" title="现金券">
                    <input type="radio" name="type" value="0" title="代金券" checked>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">价值</label>
                <div class="layui-input-block">
                    <input type="text" v-model="ticket.tkmoney" lay-verify="required|dPoint|isDInt" placeholder="￥"
                           autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">数量</label>
                <div class="layui-input-block">
                    <input type="text" v-model="ticket.tnum" lay-verify="required|isPInt" placeholder="数量"
                           autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">是否vip专享</label>
                <div class="layui-input-block">
                    <div>
                        <input type="radio" name="isvip" value="1" title="是">
                        <img title="尊贵会员" src="/static/uploads/user/liang.png">
                    </div>
                    <div>
                        <input type="radio" name="isvip" value="0" title="否" checked>
                        <img title="非会员" src="/static/uploads/user/hui.png">
                    </div>
                </div>
            </div>
            <div class="layui-form-item layui-inline">
                <label class="layui-form-label">有效时间</label>
                <div class="layui-input-inline">
                    <input type="text" id="tktime" class="layui-input" lay-verify="required" v-model="ticket.tktime" placeholder="yyyy-MM-dd HH:mm:ss">
                </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-input-block">
                    <button class="layui-btn" lay-submit lay-filter="saveTicket" @click="saveTicket">保存</button>
                    <button class="layui-btn" type="reset">重置</button>
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
<script type="text/javascript" src="<%=path%>/static/js/ticket-js/ticket.js"></script>
<script type="text/javascript" src="<%=path%>/static/js/layui-formVerify.js"></script>
</html>
