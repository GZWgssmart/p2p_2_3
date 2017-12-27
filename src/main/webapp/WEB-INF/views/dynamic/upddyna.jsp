<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/12/25
  Time: 10:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script src="/static/ueditor/ueditor.config.js"></script>
<script src="/static/ueditor/ueditor.all.js"></script>
<script src="/static/js/vue.min.js"></script>
<script src="/static/js/axios.min.js"></script>
<script src="https://cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>
<script type="text/javascript" src="/static/layui/layui.js"></script>
<link rel="stylesheet" href="/static/layui/css/layui.css"/>
<link rel="stylesheet" href="/static/css/admin.css"/>
<html>
<head>
    <title>Title</title>
</head>
<body>
<input id="id" type="hidden" value="${requestScope.id}">
<div id="app">
    <button onclick="myCheck();">提交</button>
   <input type="hidden" v-model="lists.dyid" id="dyid">
    <input type="text"  v-model="lists.title" id="title"></input>

    <%--<input type="text"  v-model="lists.crea"></input>--%>
    <input  type="hidden" v-model="lists.content" ></input>
    <input type="text" v-model="lists.pic"  id="pic"></input>
    <%--  <td><span @click="tofindone(apps.dyid);">查看</span></td>--%>
    <%--{{code}}--%>
<script  id="editor" type="text/plain" name="content"  >
    {{lists.content}}
</script>

 </div>



<script>

    var list = new Vue({
        el: "#app",
        data: {
            lists: {
                content: '',
                createdTime: '',
                dyid:'',
                pic:'',
                title:''
            },
            code: "",
        },
        methods: {
            tofindone: function () {
                var id = $("#id").val();
                alert(id);
                var params = new URLSearchParams();
                params.append('id', id);

                axios.post('/dyna/data/json/byiddync', params).then((response) => {
                    this.code = response.data.data.content;
                    this.lists = response.data.data;

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
        }
    });
    list.tofindone();
</script>

<script>
    var ue = UE.getEditor('editor');

    function getContent() {

        return ue.getContent();
    }

</script>


<script>
    function myCheck(){

        var contextPath = "";
        var dyid=$('#dyid').val();
        var title=$('#title').val();
        var content=$('#content').val();
        var pic=$('#pic').val();
        $.post(contextPath+"/dyna/data/json/updatedync", {
            'dyid':dyid,
            'title':title,
            'pic' :pic,
            'content':getContent()

        },function(data) {
            $("#success").html(data);
            window.location.href="/back/dyna/pager";
        });
    }
</script>

</body>
</html>
