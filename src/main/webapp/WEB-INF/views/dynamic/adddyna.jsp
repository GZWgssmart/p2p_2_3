<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/12/22
  Time: 10:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<button class="layui-btn" onclick="myCheck();">提交</button>
<input type="text"  name="title" required  lay-verify="required" placeholder="请输入标题" autocomplete="off" class="layui-input" id="title">


<%--<input id="content">--%>
<input id="pic"  type="file">

<div style="width: 800px; height: 400px;">
    <script id="editor" type="text/plain"></script>
</div>

</body>

<script src="/static/ueditor/ueditor.config.js"></script>
<script src="/static/ueditor/ueditor.all.js"></script>
<script src="https://cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>
<script type="text/javascript" src="/static/layui/layui.js"></script>
<link rel="stylesheet" href="/static/layui/css/layui.css"/>
<link rel="stylesheet" href="/static/css/admin.css"/>

<script type="text/javascript">
    function myCheck(){
        var contextPath = "";
        var title=$('#title').val();
        var content=$('#content').val();
        var pic=$('#pic').val();
        $.post(contextPath+"/dyna/data/json/save", {
            'title':title,
            'pic' :pic,
            'content':getContent()

        },function(data) {
            $("#success").html(data);
            window.location.href="/back/dyna/pager";
                ;
        });


    }
</script>

<script>
    var ue = UE.getEditor('editor');

    function getContent() {
        return ue.getContent();
    }

</script>


</html>

