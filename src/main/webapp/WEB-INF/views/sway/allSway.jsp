<%--
  Created by IntelliJ IDEA.
  User: CHEN JX
  Date: 2017/12/27
  Time: 9:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/static/layui/css/layui.css" media="all">
</head>
<body>
<table class="layui-hide" id="test" lay-filter="demo"></table>
</body>
<%--<script src="<%=path%>/static/layui/layui.all.js"></script>--%>
<script src="<%=path%>/static/layui/layui.js"></script>
<script>
    layui.use([ 'laypage', 'layer', 'table', 'element'], function(){
        var laypage = layui.laypage //分页
        layer = layui.layer //弹层
            ,table = layui.table //表格
            ,element = layui.element; //元素操作
        //执行一个 table 实例
        table.render({
            elem: '#test'
            ,height: 332
            ,url: '/sway/data/json/pager' //数据接口
            ,page: true //开启分页
            ,limit:5//每页显示多少个
            ,response: {
                statusName: 'status'
                ,statusCode: 0
                ,msgName: 'message'
                ,countName: 'total'
                ,dataName: 'rows'
            }
            ,cols: [[ //表头
                {field: 'sid', title: 'ID', width:80, sort: true, fixed: 'left'}
                ,{field: 'way', title: '还款方式', width:120}
                ,{field: 'fw', title: '算法', width:200}
                ,{field: 'status', title: '状态', width:100}

            ]]
        });
        //监听工具条

    });




</script>
</html>