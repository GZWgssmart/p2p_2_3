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
        .up-btn{
            border-color: #1E9FFF;
            background-color: #1E9FFF;
            color: #fff;
            height: 28px;
            margin: 5px 5px 0;
            padding: 0 15px;
            font-weight: 400;
            cursor: pointer;
            text-decoration: none;
        }
        .con{
            margin:10px 0 10px 20px;
            font:400 14px/40px microsoft yahei;
        }
        .con[input] {
            width:30px;
            height: 40px;
        }
    </style>
</head>
<body>
<div id="upAdmin">
    <table class="layui-hide" id="admin" lay-filter="demo"></table>

    <div id="test" style="display: none">
        <div class="con">
        昵称：<input v-model="adminupdate.rname"/><br/>
        姓名：<input v-model="adminupdate.huname"/><br/>
        性别：<input name="adminupdate.rname" v-model="adminupdate.sex" type="radio" value="男" />男
                <input type="radio" v-model="adminupdate.sex" name="adminupdate.rname" value="女" />女<br/></li>
        号码：<input disabled="disabled"  v-model="adminupdate.phone"><br/>
        邮箱：<input  v-model="adminupdate.email"><br/>
        <%--状态：<select v-model="adminupdate.resstr2">--%>
                    <%--<option>可用</option>--%>
                    <%--<option>不可用</option>--%>
                <%--</select><br/>--%>
        <input @click="update" class="up-btn" value="修改"/>
        </div>
    </div>
</div>

<script type="text/html" id="barDemo">
<%--    <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">查看</a>--%>
    <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
</script>

<script type="text/javascript" src="<%=path%>/static/layui/layui.js"></script>
<script type="text/javascript" src="/static/js/jquery.min.js"></script>
<script type="text/javascript" src="/static/js/vue.min.js"></script>
<script type="text/javascript" src="/static/js/axios.min.js"></script>
<script type="text/javascript" src="/static/js/qs.js"></script>
<script>


    layui.use(['laydate', 'laypage', 'layer', 'table', 'carousel', 'upload', 'element'], function(){
        var laydate = layui.laydate //日期
            ,laypage = layui.laypage //分页
            ,layer = layui.layer //弹层
            ,table = layui.table //表格
            ,carousel = layui.carousel //轮播
            ,upload = layui.upload //上传
            ,element = layui.element; //元素操作

        //执行一个 table 实例
        table.render({
            elem: '#admin'
            ,id:'admin'
            ,height: 465
            ,url: '<%=path%>/admin/data/json/list' //数据接口接口地址。默认会自动传递两个参数：?page=1&limit=30（该参数可通过 request 自定义）page 代表当前页码、limit 代表每页数据量
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
               /* {field: 'huid', title: 'ID', width:80, sort: true, fixed: 'left'}
                ,*/{field: 'rname', title: '昵称', width:200}
                ,{field: 'huname', title: '姓名', width:200}
                ,{field: 'sex', title: '性别', width:150}
                ,{field: 'phone', title: '手机号', width:200}
                ,{field: 'email', title: '邮箱', width: 200}
                ,{fixed: 'right',title:'操作', width: 165, align:'center', toolbar: '#barDemo'}
            ]]
        });

        //监听工具条
        table.on('tool(demo)', function(obj){ //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
            var data = obj.data //获得当前行数据
                ,layEvent = obj.event; //获得 lay-event 对应的值
            if(layEvent === 'edit'){
               layer.open({
                   type: 1
                   ,content: $("#test")
                  /* ,btn: '关闭'*/
                   ,area: ['320px', '360px'] //自定义文本域宽高
                   ,btnAlign: 'r' //按钮居中
                   ,shade: 0.3 //不显示遮罩
                   ,yes: function(){
                       layer.closeAll();
                   }
               });
               vue.adminupdate = data;
            }
        });
    });


    var vue = new Vue({
        el:'#upAdmin',//元素
        data:{
            adminupdate:[]//json格式
        },
        methods : {
            update :function(){
                axios.post('<%=path%>/admin/data/json/update',Qs.stringify(this.adminupdate)).then((response)=>{
                    if(response.data.code == 0) {
                        /*layui.layer.msg('更新成功');*/
                        layer.closeAll();
                        layui.table.reload("admin");
                    }else {
                        layer.msg('更新失败');
                    }
                },(error)=>{
                    layer.msg('服务器错误');
                });
            }
        }
    });
</script>

</body>
</html>

