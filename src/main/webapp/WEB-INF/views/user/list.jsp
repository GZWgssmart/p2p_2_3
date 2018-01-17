<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/12/26
  Time: 8:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <title>管理员列表</title>
    <link rel="stylesheet" href="<%=path%>/static/layui/css/layui.css"/>
    <style>
        body{margin: 10px;}
        .demo-carousel{height: 200px; line-height: 200px; text-align: center;}
    </style>
</head>
<body>

<table class="layui-hide" id="user" lay-filter="demo">

</table>

<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-xs" lay-event="view">投资记录</a>
</script>

<script type="text/javascript" src="<%=path%>/static/layui/layui.js"></script>
<script>
    layui.use(['laydate', 'laypage', 'layer', 'table', 'carousel', 'upload', 'element'], function(){
        var laydate = layui.laydate //日期
            ,laypage = layui.laypage //分页
            ,layer = layui.layer //弹层
            ,table = layui.table //表格
            ,carousel = layui.carousel //轮播
            ,upload = layui.upload //上传
            ,element = layui.element; //元素操作
        table.render({
            elem: '#user'
            ,height: 465
            ,url: '<%=path%>/user/data/json/list'
            ,page: true//开启分页
            ,limit:10
            ,response: {
                statusName: 'status'
                ,statusCode: 0
                ,msgName: 'message'
                ,countName: 'total'
                ,dataName: 'rows'
            }
            //后台Pager响应对象 不要动
            ,cols: [[//表头
                {field: 'face', title: '头像', width:100,templet:'<div style="width: 80px;height: 80px;border-radius: 100%;">{{head(d.face)}}</div>'}
                ,{field: 'uname', title: '昵称', width:100}
                ,{field: 'phone', title: '手机号', width:130}
                ,{field: 'email', title: '邮箱', width:130}
                ,{field: 'idno', title: '证件号', width:180}
                ,{field: 'resstr1', title: '推荐码', width:80}
                ,{field: 'rname', title: '真实姓名', width:100}
                ,{field: 'isvip', title: '是否VIP', width:80,templet:'<div>{{isvip(d.isvip)}}</div>'}
                ,{field: 'resint1', title: '创建时间', width:200}
                ,{fixed: 'right',title:'操作', width: 100, align:'center', toolbar: '#barDemo'}
            ]]
        });

        //监听工具条
        table.on('tool(demo)', function(obj){ //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
            var data = obj.data //获得当前行数据
                ,layEvent = obj.event; //获得 lay-event 对应的值
                if(layEvent === 'view'){
                layer.msg('用户记录');
            }
        });
    });

    function isvip(value) {
        if(value==0){
            return'<img src="/static/uploads/user/hui.png"/>';
        }else if(value==1){
            return'<img src="/static/uploads/user/liang.png"/>';
        }
    }

    function head(value) {
        return '<img style="width: 80px;height: 80px;" src='+value+'/>'
    }
    
</script>

</body>
</html>

