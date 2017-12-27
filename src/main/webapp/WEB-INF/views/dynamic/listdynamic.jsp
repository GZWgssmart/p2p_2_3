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
<html>
<head>
    <title>Title</title>
</head>
<body>
<input id="id" type="hidden" value="${requestScope.id}">
<div id="app">

    <div id="title"></div>
    <div id="pic"></div>
    <div id="crea"></div>
    <div id="content"></div>
    <%--  <td><span @click="tofindone(apps.dyid);">查看</span></td>--%>


    <%--    {{code}}--%>
</div>

<script>
    $(function () {
        var id = $("#id").val();
        $.post("/dyna/data/json/byiddync",
            {id: id}
            , function (data) {
                $("#title").append(data.data.title),
                    $("#pic").append(data.data.pic),
                    $("#crea").append(data.data.createdTime),
                    $("#content").append(data.data.content)
            }, "json"
        );
    });


    var list = new Vue({
        el: "#app",
        data: {

            list: [],
            code: "",
        },
        tofindone: function (id) {
            alert("111");
            var params = new URLSearchParams();
            params.append('id', id);

            axios.post('dyna/data/json/byiddync', params).then((response) => {
                this.code = response.data.data.content;
                $("#code").append(this.code)
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

    });
    list.listdyna();
</script>


</body>
</html>
