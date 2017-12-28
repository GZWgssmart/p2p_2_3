<%--
  Created by IntelliJ IDEA.
  User: Animo
  Date: 2017-12-21
  Time: 9:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<html>
<head>
    <title>后台管理——p2p</title>
    <link rel="stylesheet" href="<%=path%>/static/layui1/css/layui.css"/>
    <link rel="stylesheet" href="<%=path%>/static/css/admin.css"/>
</head>
<body>
<!-- 布局容器 -->
<div class="layui-layout layui-layout-admin">
    <!-- 头部 -->
    <div class="layui-header">
        <div class="layui-main">
            <div class="top-left">
                <!-- logo -->
                <a href="javascript:;" class="logo">互联金融</a>
                <a href="javascript:;" class="menu-flexible ml10">
                    <i class="layui-icon">&#xe635;</i>
                </a>
            </div>
            <!-- 头部右侧操作 -->
            <ul class="layui-nav operate">
                <li class="layui-nav-item">
                    <!-- 进入商城首页    -->
                    <a href="javascript:;">商品首页</a>
                </li>
                <li class="layui-nav-item">
                    <!-- 进入移动端首页    -->
                    <a href="javascript:;" class="wap">商城WAP</a>
                    <dl class="layui-nav-child">
                        <dd class="p10">
                            <%--<img src="img/pic.png" width="150px" height="150px" alt="">--%>
                            <p class="tac" style="color:#333;">扫一扫进入商城WAP</p>
                        </dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;">137****6116</a>
                    <dl class="layui-nav-child">
                       <%-- <dd>
                            <a href="javascript:;" class="edit-password">修改密码</a>
                        </dd>--%>
                        <dd>
                            <a href="<%=path%>/admin/data/json/logout" >退出登录</a>
                        </dd>
                    </dl>
                </li>
            </ul>
        </div>
    </div>

    <!-- 左侧菜单 -->
    <div class="layui-side layui-bg-black left-menu-all ">
        <div class="layui-side-scroll">
            <ul class="layui-nav layui-nav-tree left-menu" lay-filter="left-menu">
                <li class="layui-nav-item layui-this">
                    <a href="javascript:;" data-url="" data-id="1">后台首页</a>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;">用户管理</a>
                    <dl class="layui-nav-child">
                        <dd>
                            <a href="javascript:;" data-url="<%=path%>/back/user/list" data-id="2">用户列表</a>
                        </dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;">管理员管理</a>
                    <dl class="layui-nav-child">
                        <dd>
                            <a href="javascript:;" data-url="<%=path%>/back/admin/add" data-id="3">添加管理员</a>
                        </dd>
                        <dd>
                            <a href="javascript:;" data-url="<%=path%>/back/admin/list" data-id="4">管理员列表</a>
                        </dd>
                        <dd>
                            <a href="javascript:;" data-url="<%=path%>/back/admin/upInfo" data-id="6">修改信息</a>
                        </dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;">订单管理</a>
                    <dl class="layui-nav-child">
                        <dd>
                            <a href="javascript:;" data-url="" data-id="5">待发货</a>
                        </dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;">运营管理</a>
                    <dl class="layui-nav-child">
                        <dd>
                            <a href="javascript:;" data-url="" data-id="8">首页轮播图</a>
                        </dd>
                        <dd>
                        <a href="javascript:;" data-url="/back/dyna/pager" data-id="8">公司动态</a>
                    </dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;">账号管理</a>
                    <dl class="layui-nav-child">
                        <dd>
                            <a href="javascript:;" data-url="" data-id="12">运营管理账号</a>
                        </dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;">财务管理</a>
                    <dl class="layui-nav-child">
                        <dd>
                            <a href="javascript:;" data-url="" data-id="15">财务统计</a>
                        </dd>
                    </dl>
                </li>

                <li class="layui-nav-item">
                    <a href="javascript:;">统计查询</a>
                    <dl class="layui-nav-child">
                        <dd>
                            <a href="javascript:;" data-url="" data-id="20">会员统计</a>
                        </dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;">系统设置</a>
                    <dl class="layui-nav-child">
                        <dd>
                            <a href="javascript:;" data-url="" data-id="24">操作日志</a>
                        </dd>
                    </dl>
                </li>

                <li class="layui-nav-item">
                    <a href="javascript:;">宣传管理</a>
                    <dl class="layui-nav-child">
                        <dd>
                            <a href="javascript:;" data-url="<%=path%>/back/letter/pagerLetter" data-id="25">站内信添加</a>
                        </dd>
                        <dd>
                            <a href="javascript:;" data-url="<%=path%>/back/letter/pageAllLitter" data-id="25">所有站内信</a>
                        </dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;">定时任务</a>
                    <dl class="layui-nav-child">
                        <dd>
                            <a href="javascript:;" data-url="<%=path%>/back/dxmodel/pagerDxmodel" data-id="25">短信模板</a>
                        </dd>

                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;">借款管理</a>
                    <dl class="layui-nav-child">
                        <dd>
                            <a href="javascript:;" data-url="<%=path%>/back/jklx/pagerJklx" data-id="25">所有借款类型</a>
                        </dd>
                        <dd>
                            <a href="javascript:;" data-url="<%=path%>/back/bz/pagerBz" data-id="25">所有标种</a>
                        </dd>
                        <dd>
                            <a href="javascript:;" data-url="<%=path%>/back/sway/pagerSway" data-id="25">所有还款方式</a>
                        </dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;">角色管理</a>
                    <dl class="layui-nav-child">
                        <dd>
                            <a href="javascript:;" data-url="<%=path%>/back/role/pagerRole" data-id="25">所有角色</a>
                        </dd>
                    </dl>
                </li>

            </ul>
        </div>
    </div>

    <!-- 主体 -->
    <div class="layui-body">
        <!-- 顶部切换卡 -->
        <div class="layui-tab layui-tab-card" lay-filter="top-tab" lay-allowClose="true">
            <ul class="layui-tab-title"></ul>
            <div class="layui-tab-button">
                <a href="javascript:;"><i class="layui-icon">&#x1002;</i></a>
            </div>
            <div class="layui-tab-content"></div>
        </div>
    </div>

    <!-- 底部 -->
    <div class="layui-footer">
        <span class="red">互联金融管理平台</span>
    </div>
</div>

<script type="text/javascript" src="<%=path%>/static/layui1/layui.js"></script>
<script type="text/javascript" src="<%=path%>/static/js/admin.js"></script>
<script>
    layui.use(['jquery','form','layer'], function(){
        var $ = layui.jquery,
            layer = layui.layer,
            laypage = layui.laypage;

        // 修改密码
        $(document).on("click", ".edit-password", function() {
            layer.open({
                type:2
                ,area:['450px', '320px']
                ,title:"修改密码"
                ,content: '修改密码.html'
            });
        });
    });
</script>
</body>
</html>
