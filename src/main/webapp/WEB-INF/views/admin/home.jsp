<%--
  Created by IntelliJ IDEA.
  User: Animo
  Date: 2017-12-21
  Time: 9:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
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
                    <a href="javascript:;">${sessionScope.admin.phone}</a>
                    <dl class="layui-nav-child">
                        <dd>
                            <a href="<%=path%>/admin/logout">退出登录</a>
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
                <shiro:hasPermission name="user:mannager">
                    <li class="layui-nav-item">
                        <a href="javascript:;">用户管理</a>
                        <dl class="layui-nav-child">
                            <dd>
                                <a href="javascript:;" data-url="<%=path%>/back/user/list" data-id="2">用户列表</a>

                            </dd>
                            <dd>

                                <a href="javascript:;" data-url="<%=path%>/back/user/tx" data-id="3">提现记录</a>
                            </dd>
                        </dl>
                    </li>
                </shiro:hasPermission>
                <shiro:hasPermission name="admin:mannager">
                    <li class="layui-nav-item">
                        <a href="javascript:;">管理员管理</a>
                        <dl class="layui-nav-child">
                            <dd>
                                <a href="javascript:;" data-url="<%=path%>/back/admin/add" data-id="4">添加管理员</a>
                            </dd>
                            <dd>
                                <a href="javascript:;" data-url="<%=path%>/back/admin/list" data-id="5">管理员列表</a>
                            </dd>
                            <dd>
                                <a href="javascript:;" data-url="<%=path%>/back/admin/password" data-id="7">修改密码</a>
                            </dd>
                                <%--<dd>--%>
                                <%--<a href="javascript:;" data-url="<%=path%>/back/admin/upInfo" data-id="8">修改信息</a>--%>
                                <%--</dd>--%>
                        </dl>
                    </li>
                </shiro:hasPermission>
                <shiro:hasPermission name="touzi:mannager">
                    <li class="layui-nav-item">
                        <a href="javascript:;">投资管理</a>
                        <dl class="layui-nav-child">
                            <dd>
                                <a href="javascript:;" data-url="<%=path%>/back/rewardset/add" data-id="9">投资奖励设置</a>
                            </dd>
                            <dd>

                                <a href="javascript:;" data-url="<%=path%>/back/rewardset/list" data-id="10">投资奖励列表</a>
                            </dd>
                        </dl>
                    </li>
                </shiro:hasPermission>
                <shiro:hasPermission name="yy:mannager">
                    <li class="layui-nav-item">
                        <a href="javascript:;">运营管理</a>
                        <dl class="layui-nav-child">
                            <dd>
                                <a href="javascript:;" data-url="/back/home/save" data-id="9">添加轮播图</a>
                            </dd>
                            <dd>
                                <a href="javascript:;" data-url="/back/home/list" data-id="8">首页轮播图</a>
                            </dd>
                            <dd>
                                <a href="javascript:;" data-url="/back/dyna/save" data-id="14">添加公司动态</a>
                            </dd>
                            <dd>
                                <a href="javascript:;" data-url="/back/dyna/pager" data-id="11">公司动态</a>
                            </dd>
                            <dd>
                                <a href="javascript:;" data-url="/back/med/save" data-id="15">添加媒体报道</a>
                            </dd>
                            <dd>
                                <a href="javascript:;" data-url="/back/med/pager" data-id="12">媒体报道</a>
                            </dd>
                            <dd>
                                <a href="javascript:;" data-url="/back/not/save" data-id="16">添加公司公告</a>
                            </dd>
                            <dd>
                                <a href="javascript:;" data-url="/back/not/pager" data-id="13">公司公告</a>
                            </dd>
                            <dd>
                                <a href="javascript:;" data-url="<%=path%>/back/letter/letterAdd" data-id="18">添加站内信</a>
                            </dd>
                            <dd>
                                <a href="javascript:;" data-url="<%=path%>/back/letter/pageAllLitter" data-id="17">站内信</a>
                            </dd>
                            <dd>
                                <a href="javascript:;" data-url="<%=path%>/back/dxmodel/add" data-id="20">添加短信模板</a>
                            </dd>
                            <dd>
                                <a href="javascript:;" data-url="<%=path%>/back/dxmodel/pagerDxmodel" data-id="19">短信模板</a>
                            </dd>
                            <dd>
                                <a href="javascript:;" data-url="<%=path%>/back/friends/addFriends" data-id="22">添加合作伙伴</a>
                            </dd>
                            <dd>
                                <a href="javascript:;" data-url="<%=path%>/back/friends/pagerFriend" data-id="21">合作伙伴</a>
                            </dd>
                            <dd>
                                <a href="javascript:;" data-url="<%=path%>/back/ticket/add" data-id="31">添加券</a>
                            </dd>
                            <dd>
                                <a href="javascript:;" data-url="<%=path%>/back/ticket/pager" data-id="30">所有券</a>
                            </dd>
                        </dl>
                    </li>
                </shiro:hasPermission>
               <shiro:hasPermission name="jk:mannager">
                   <li class="layui-nav-item">
                       <a href="javascript:;">借款管理</a>
                       <dl class="layui-nav-child">
                           <dd>
                               <a href="javascript:;" data-url="<%=path%>/back/jklx/pagerJklx" data-id="23">借款类型</a>
                           </dd>
                           <dd>
                               <a href="javascript:;" data-url="<%=path%>/back/bz/pagerBz" data-id="24">标种</a>
                           </dd>
                           <dd>
                               <a href="javascript:;" data-url="<%=path%>/back/sway/pagerSway" data-id="25">还款方式</a>
                           </dd>
                           <dd>
                               <a href="javascript:;" data-url="<%=path%>/back/sway/swayAdd" data-id="26">添加还款方式</a>
                           </dd>
                           <dd>
                               <a href="javascript:;" data-url="<%=path%>/back/borrowapply/all" data-id="27">所有借款</a>
                           </dd>
                       </dl>
                   </li>
               </shiro:hasPermission>
                <shiro:hasPermission name="role:pager">
                    <li class="layui-nav-item">
                        <a href="javascript:;">角色管理</a>
                        <dl class="layui-nav-child">
                            <dd>
                                <a href="javascript:;" data-url="<%=path%>/back/role/pagerRole" data-id="28">所有角色</a>
                            </dd>
                        </dl>
                    </li>
                </shiro:hasPermission>
                <shiro:hasPermission name="jur:pager">
                    <li class="layui-nav-item">
                        <a href="javascript:;">权限管理</a>
                        <dl class="layui-nav-child">
                            <dd>
                                <a href="javascript:;" data-url="<%=path%>/back/jur/pagerJur" data-id="29">所有权限</a>
                            </dd>
                        </dl>
                    </li>
                </shiro:hasPermission>
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
    layui.use(['jquery', 'form', 'layer'], function () {
        var $ = layui.jquery,
            layer = layui.layer,
            laypage = layui.laypage;

        // 修改密码
        $(document).on("click", ".edit-password", function () {
            layer.open({
                type: 2
                , area: ['450px', '320px']
                , title: "修改密码"
                , content: '修改密码.html'
            });
        });
    });
</script>
</body>
</html>
