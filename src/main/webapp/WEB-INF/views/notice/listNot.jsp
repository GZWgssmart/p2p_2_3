<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/12/25
  Time: 10:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<script src="https://cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>
<script src="/static/js/vue.min.js"></script>
<script src="/static/js/axios.min.js"></script>
<script src="/static/layui/layui.all.js"></script>
<link rel="stylesheet" href="/static/layui/css/layui.css"/>
<link rel="stylesheet" href="/static/css/admin.css"/>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/static/layui/css/layui.css" media="all">
</head>
<body>

<div id="app">
    <br/>
    <button style="width: 1125px; margin: 0;"  class="layui-btn" v-on:click="save">添加</button>

       <table class="layui-hide" id="test" lay-filter="demo"></table>


    <div id="code"></div>
</div>

<script>
    var list;
    list = new Vue({
        el: "#app",
        data: {
            pageNo: 1,
            pageSize: 10,
            list: [],
            code: "",
        },
        methods: {

            save: function () {
                window.location.href = " /back/not/save";

            },
            tofindone: function (id) {

                var params = new URLSearchParams();
                params.append('id', id);
                window.location.href = "/back/not/byiddync?id=" + id


            },
            toupd: function (id) {

                var params = new URLSearchParams();
                params.append('id', id);
                window.location.href = "/back/not/updnot?id=" + id


            },
            remove: function (id) {

                var params = new URLSearchParams();
                params.append('id', id);

                axios.post('/notice/data/json/removenotice', params).then((response) => {
                    this.listmed();
                }, (error) => {
                    alert(error);
                });
            },
            messageT: function (msg) {
                this.messagevalid = true;
                this.message = msg;
            },
            messageF: function () {
                this.messagevalid = false;
            },
        },
    });
</script>
<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="listmed">查看</a>
    <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="updmed">编辑</a>
    <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="delmed">删除</a>
</script>
<script>
    layui.use([ 'laypage', 'layer', 'table', 'element'], function(){
        var laypage = layui.laypage //分页
        layer = layui.layer //弹层
            ,table = layui.table //表格
            ,element = layui.element; //元素操作
        //执行一个 table 实例
        table.render({
            elem: '#test'
            ,height: 440
            ,url: '/notice/data/json/pager' //数据接口
            ,page: true //开启分页
            ,limit:10//每页显示多少个
            //后台Pager响应对象 不要动
            ,response: {
                statusName: 'status'
                ,statusCode: 0
                ,msgName: 'message'
                ,countName: 'total'
                ,dataName: 'rows'
            }
            //后台Pager响应对象 不要动
            //表头
            ,cols: [[
                {field: 'title', title: '标题', width:680}
                ,{field: 'createdTime', title: '添加时间', width:270}
                ,{fixed: 'right',title: '操作', width: 171, align:'center', toolbar: '#barDemo'}
            ]]
            //表头
        });

        //监听工具条
        table.on('tool(demo)', function(obj){ //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
            var data = obj.data //获得当前行数据
                ,layEvent = obj.event; //获得 lay-event 对应的值
            if(layEvent === 'listmed'){
//                console.log(data.mid);
                window.location.href = "/back/not/byiddync?id=" + data.nid;
            }
            if(layEvent === 'updmed'){
                window.location.href = "/back/not/updnot?id=" + data.nid;
            }else if(layEvent === 'delmed'){
                layer.msg('是否删除当前首页图片10s后自动取消', {
                    time: 10000, //10s后自动关闭
                    btn: ['是的', '取消'],
                    yes:function(){
                        var params = new URLSearchParams();
                        params.append('id', data.nid);
                        axios.post('/notice/data/json/removenotice', params).then((response) => {
                            layer.msg(response.data.message);
                        }, (error) => {
                            alert(error);
                        });
                        console.log(data.nid)
                        obj.del(data.nid); //删除对应行（tr）的DOM结构
                        layer.close(index);
                    },
                    btn2: function () {
                        layer.msg('已取消');
                    }
                });
            }
        });
    });
</script>
</body>
</html>
