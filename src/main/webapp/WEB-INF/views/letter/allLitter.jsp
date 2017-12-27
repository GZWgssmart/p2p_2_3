<%--
  Created by IntelliJ IDEA.
  User: CHEN JX
  Date: 2017/12/26
  Time: 15:33
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

<script type="text/html" id="barDemo">

</script>
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
            ,url: '/letter/data/json/pager' //数据接口
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
                {field: 'lid', title: 'ID', width:80, sort: true, fixed: 'left'}
                ,{field: 'title', title: '标题', width:120}
                ,{field: 'content', title: '内容', width:120}
                ,{field: 'createdTime', title: '添加时间', width:200}

            ]]
        });
    });




</script>
</html>