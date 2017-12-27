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
<link rel="stylesheet" href="/static/layui/css/layui.css"/>
<link rel="stylesheet" href="/static/css/admin.css"/>
<html>
<head>
    <title>Title</title>
</head>
<body>

<div id="app">
    <table>

        <tr v-for="apps in list ">
            <td>{{apps.title}}</td>
            <%-- <td>{{apps.content}}</td>--%>
            <td>{{apps.pic}}</td>
            <td>{{apps.created_time}}</td>
            <td><span @click="tofindone(apps.dyid);">查看</span></td>
            <td><span @click="toupd(apps.dyid);">修改</span></td>
            <td><a href="javascript:;" data-id="8"><span @click="remove(apps.dyid);">删除</span></a></td>
            <td>  <a href="/back/dyna/save" data-url="/back/dyna/save" data-id="8">添加</a></td>
        </tr>

    </table>
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
            listdyna: function () {
                var params = new URLSearchParams();
                params.append('pageNo', this.pageNo);
                params.append('pageSize', this.pageSize);

                axios.post('/dyna/data/json/pager', params).then((response) => {
                    this.list = response.data.rows;
                }, (error) => {
                    alert(error);
                });
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

</body>
</html>
