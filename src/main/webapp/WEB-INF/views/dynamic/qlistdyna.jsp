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
    <style>
        body{ text-align:center}
        .center{ margin:0 auto;}
        .right{float:right;}

        }
        /* css注释：为了观察效果设置宽度 边框 高度等样式 */
    </style>
</head>
<body>

<div id="app">
     <table >
         <%--{{apps.pic}}--%>
             <HR>

         <tr v-for="apps in list " >

             <td width="230px" height="150px"><img height="100px" src="/static/dynajs/text11111.png" /></td>
             <td  width="713px">
                 <span @click="tofindone(apps.dyid);">
                 <div class="center">{{apps.title}}</div><br/><div class="right">{{apps.createdTime}}</div>
                    </span>
             </td>

             <%--<td>{{apps.content}}</td>--%>



             <%--<td><span @click="toupd(apps.dyid);">修改</span></td>--%>
             <%--<td><a href="javascript:;" data-id="8"><span @click="remove(apps.dyid);">删除</span></a></td>--%>
             <%--<td>  <a href="/back/dyna/save" data-url="/back/dyna/save" data-id="8">添加</a></td>--%>

         </tr>



     </table>
        <%--
    <button  class="layui-btn" v-on:click="save">添加</button>
    <table class="layui-hide" id="test" lay-filter="demo"></table>--%>


    <div id="code"></div>
</div>

<script>
    var list;
    list = new Vue({
        el: "#app",
        data: {
            page: 1,
            limit: 10,
            list: [],
            code: "",
        },
        methods: {
             listdyna: function () {
             var params = new URLSearchParams();
             params.append('page', this.page);
             params.append('limit', this.limit);

             axios.post('/dyna/data/json/pager', params).then((response) => {
             this.list = response.data.rows;
             }, (error) => {
             alert(error);
             });
             },
            save: function () {
                window.location.href = " /back/dyna/save";

            },
            tofindone: function (id) {

                var params = new URLSearchParams();
                params.append('id', id);
                window.location.href = "/byqlist?id=" + id

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
                window.location.href = "/back/dyna/upddync?id=" + id

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
        list.listdyna();
</script>
<%--<script type="text/html" id="barDemo">--%>
    <%--<a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="listdyna">查看</a>--%>
    <%--&lt;%&ndash;<a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="upddyna">编辑</a>&ndash;%&gt;--%>
    <%--&lt;%&ndash;<a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="deldyna">删除</a>&ndash;%&gt;--%>
<%--</script>--%>
<%--<script>--%>
    <%--layui.use([ 'laypage', 'layer', 'table', 'element'], function(){--%>
        <%--var laypage = layui.laypage //分页--%>
        <%--layer = layui.layer //弹层--%>
            <%--,table = layui.table //表格--%>
            <%--,element = layui.element; //元素操作--%>
        <%--//执行一个 table 实例--%>
        <%--table.render({--%>
            <%--elem: '#test'--%>
            <%--,height: 332--%>
            <%--,url: '/dyna/data/json/pager' //数据接口--%>
            <%--,page: true //开启分页--%>
            <%--,limit:10//每页显示多少个--%>
            <%--//后台Pager响应对象 不要动--%>
            <%--,response: {--%>
                <%--statusName: 'status'--%>
                <%--,statusCode: 0--%>
                <%--,msgName: 'message'--%>
                <%--,countName: 'total'--%>
                <%--,dataName: 'rows'--%>
            <%--}--%>
            <%--//后台Pager响应对象 不要动--%>
            <%--//表头--%>
            <%--,cols: [[--%>
                <%--{field: 'dyid', title: 'ID', width:80, sort: true, fixed: 'left'}--%>
                <%--,{field: 'title', title: '标题', width:680}--%>
                <%--,{field: 'createdTime', title: '添加时间', width:189}--%>
                <%--,{fixed: 'right',title: '操作', width: 171, align:'center', toolbar: '#barDemo'}--%>
            <%--]]--%>
            <%--//表头--%>
        <%--});--%>

        <%--//监听工具条--%>
        <%--table.on('tool(demo)', function(obj){ //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"--%>
            <%--var data = obj.data //获得当前行数据--%>
                <%--,layEvent = obj.event; //获得 lay-event 对应的值--%>
            <%--if(layEvent === 'listdyna'){--%>
                <%--layer.msg('查看操作');--%>
                <%--console.log(data.dyid);--%>
                <%--window.location.href = "/back/dyna/byiddync?id=" + data.dyid;--%>
            <%--}--%>
            <%--if(layEvent === 'upddyna'){--%>
                <%--layer.msg('修改');--%>
<%--//                console.log(data.dyid);--%>
                <%--window.location.href = "/back/dyna/upddync?id=" + data.dyid;--%>
            <%--}--%>
            <%--else if(layEvent === 'deldyna'){--%>
                <%--var params = new URLSearchParams();--%>
                <%--params.append('id', data.dyid);--%>
                <%--layer.confirm('真的删除行么', function(index){--%>
                    <%--axios.post('/dyna/data/json/removedyna', params).then((response) => {--%>
                        <%--layer.msg(response.data.message);--%>
                    <%--}, (error) => {--%>
                        <%--alert(error);--%>
                    <%--});--%>
                    <%--console.log(data.dyid)--%>
                    <%--obj.del(data.dyid); //删除对应行（tr）的DOM结构--%>
                    <%--layer.close(index);--%>
                    <%--//向服务端发送删除指令--%>
                <%--});--%>
            <%--}--%>
        <%--});--%>
    <%--});--%>
<%--</script>--%>
</body>
</html>
