<%--
  Created by IntelliJ IDEA.
  User: Master
  Date: 2017/10/31
  Time: 8:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
  <head>
    <title>ueditor</title>
    <script src="/static/ueditor/ueditor.config.js"></script>
    <script src="/static/ueditor/ueditor.all.js"></script>
    <script src="https://cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>
  </head>
  <td>
  <div style="width: 800px; height: 400px;">
    <script id="editor" type="text/plain"></script>
  </div>
  </td>
  <a href="javascript:void(0);" onclick="getContent();">获取内容</a>
  </body>
<script>
    var ue = UE.getEditor('editor');

    function getContent() {
        alert(ue.getContent());
    }

  </script>
</html>
