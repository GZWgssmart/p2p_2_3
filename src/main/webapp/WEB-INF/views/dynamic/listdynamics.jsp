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
<link rel="stylesheet" href="/static/css/index/public.css">
<link rel="stylesheet" href="/static/css/index/index.css">
<link rel="stylesheet" href="/static/layui/css/layui.css">

<script src="/static/js/vue.min.js/"></script>
<script src="/static/js/axios.min.js/"></script>
<script src="/static/layui/layui.js"></script>
<script src="/static/layui/lay/modules/element.js"></script>
<script src="/static/js/axios.min.js"></script>
<html>

<head>
    <title>Title</title>
    <style>
        body{ text-align:center}
        .center{ margin:0 auto;}
        .right{float:right;}
        /* css注释：为了观察效果设置宽度 边框 高度等样式 */
    </style>
</head>
<body>
<input id="id" type="hidden" value="${requestScope.id}">
<div id="app"  >
<div style="width: 1120px" class="center" >
    <div id="title" class="center" ></div>
    <div id="crea" class="right" > <a href="/back/dyna/pager">返回列表</a></div>
    <div><br/><br/> </div>
    <div style="width: 1020px" id="content" class="center" ></div>
    <%--  <td><span @click="tofindone(apps.dyid);">查看</span></td>--%>
    <%--{{code}}--%>
</div>
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
            title:"",
            list: [],
            code: "",
        },created(){
            tofindone();
            messageT();
            messageF();
        }
    });

    function tofindone (id) {
            var params = new URLSearchParams();
            params.append('id', id);

            axios.post('dyna/data/json/byiddync', params).then((response) => {
                this.code = response.data.data.content;
                $("#code").append(this.code)
            }, (error) => {

            });
    }
    function messageT(msg) {
        this.messagevalid = true;
        this.message = msg;
    }
    function messageF(msg) {
        this.messagevalid = false;
    }
</script>


</body>
</html>
