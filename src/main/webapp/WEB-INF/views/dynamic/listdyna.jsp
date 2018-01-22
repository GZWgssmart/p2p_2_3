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
   <%-- <table >

        <tr v-for="apps in list ">
            <td>{{apps.title}}</td>
            &lt;%&ndash; <td>{{apps.content}}</td>&ndash;%&gt;
            <td>{{apps.pic}}</td>
            <td>{{apps.created_time}}</td>
            <td><span @click="tofindone(apps.dyid);">查看</span></td>
            <td><span @click="toupd(apps.dyid);">修改</span></td>
            <td><a href="javascript:;" data-id="8"><span @click="remove(apps.dyid);">删除</span></a></td>
            <td>  <a href="/back/dyna/save" data-url="/back/dyna/save" data-id="8">添加</a></td>
        </tr>

    </table>--%>
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
           /* listdyna: function () {
                var params = new URLSearchParams();
                params.append('pageNo', this.pageNo);
                params.append('pageSize', this.pageSize);

                axios.post('/dyna/data/json/pager', params).then((response) => {
                    this.list = response.data.rows;
                }, (error) => {
                    alert(error);
                });
            },*/
            save: function () {
                window.location.href = " /back/dyna/save";

            },
            tofindone: function (id) {

                var params = new URLSearchParams();
                params.append('id', id);
                window.location.href = "/back/dyna/byiddync?id=" + id

                /*  axios.post('/dyna/data/json/byiddync', params).then((response) => {
                 this.code=response.data.data.content;
                 $("#code").append(this.code)
                 }, (error) => {
                 alert(error);
                 });*/
            },
            toupd: function (id) {

                var params = new URLSearchParams();
                params.append('id', id);
                window.location.href = "/back/dyna/updateDynamic?id=" + id

                /*  axios.post('/dyna/data/json/byiddync', params).then((response) => {
                 this.code=response.data.data.content;
                 $("#code").append(this.code)
                 }, (error) => {
                 alert(error);
                 });*/
            },
            remove: function (id) {

                var params = new URLSearchParams();
                params.append('id', id);
//                window.location.href = "/back/dyna/upddync?id="+id

                axios.post('/dyna/data/json/removedyna', params).then((response) => {
                    this.listdyna();
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
//    list.listdyna();
</script>
<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="listdyna">查看</a>
    <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="upddyna">编辑</a>
    <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="deldyna">删除</a>
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
            ,url: '/dyna/data/json/pager' //数据接口
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
            if(layEvent === 'listdyna'){
                console.log(data.dyid);
                window.location.href = "/back/dyna/byiddync?id=" + data.dyid;
            }
            if(layEvent === 'upddyna'){
                console.log(data);
                window.location.href = "/back/dyna/upddync?id=" + data.dyid;
            } else if(layEvent === 'deldyna'){
                layer.msg('是否删除当前首页图片10s后自动取消', {
                    time: 10000, //10s后自动关闭
                    btn: ['是的', '取消'],
                    yes:function(){
                        var params = new URLSearchParams();
                        params.append('id', data.dyid);
                        axios.post('/dyna/data/json/removedyna', params).then((response) => {
                            layer.msg(response.data.message);
                        }, (error) => {
                            alert(error);
                        });
                        obj.del(data.dyid); //删除对应行（tr）的DOM结构
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
