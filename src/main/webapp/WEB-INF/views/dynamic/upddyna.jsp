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
<!-- 配置文件 -->
<script type="text/javascript" src="/static/ueditor/ueditor.config.js"></script>
<!-- 编辑器源码文件 -->
<script type="text/javascript" src="/static/ueditor/ueditor.all.js"></script>
<html>
<head>
    <title>Title</title>
</head>
<body>
<input id="id" type="hidden" value="${requestScope.id}">
<div id="app" style="width: 1120px; margin: 0;">
    <br/>
    <button style="width: 1120px; margin: 0;"  class="layui-btn" onclick="myCheck();">提交</button>
    <br/>  <br/>
   <input type="hidden" v-model="lists.dyid" id="dyid">
    <input style="width: 1120px; margin: 0;"  type="text"  v-model="lists.title" id="title" required  lay-verify="required" placeholder="请输入标题" autocomplete="off" class="layui-input"/>
    <br/>  <br/>

    <script id="container" name="content" type="text/plain">
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
    var ue = UE.getEditor('container');

    function getContent() {

        return ue.getContent();
    }
    function getContentTxt() {
        return ue.getContentTxt()
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
            'content':getContent(),
            'url':getContentTxt()

        },function(data) {
            $("#success").html(data);
            window.location.href="/back/dyna/pager";
        });
    }
</script>

</body>
</html>
