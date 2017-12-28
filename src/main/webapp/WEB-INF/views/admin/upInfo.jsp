<%--
  Created by IntelliJ IDEA.
  User: Animo
  Date: 2017-12-21
  Time: 8:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
    <title>修改密码</title>
    <link rel="stylesheet" href="<%=path%>/static/css/style.css"/>
</head>
<body>
<div class="login">
    <ul class="login-list">
        <p class="error-msg icon icon-error"></p>
        <form id="upInfo" method="post">
            <div class="from">
                <li>昵称：<input type="text" id="rname" name="rname" placeholder="请输入昵称"></li>
            </div>
            <div class="from">
                <li>姓名：<input type="text" id="huname" name="huname" placeholder="请输入真实姓名"></li>
            </div>
            <div class="from">
                <li>邮箱：<input type="email" id="email" name="email" placeholder="请输入邮箱"></li>
            </div>
            <div class="from">
                性别：<input type="radio" name="sex">男<input type="radio" name="sex"/>女
            </div>

            <li><input type="button" class="btn" onclick="upInfo();" value="修改"></li>
        </form>
    </ul>
</div>
<script src="<%=path%>/static/js/jquery.min.js"></script>
<script>
    //错误提示
    function showError(msg,obj){
        $('.error-msg').text(msg).addClass('show');
        obj.parent('.from').addClass('error');
        obj.focus(function(){
            obj.parent('.from').removeClass('error');
            $('.error-msg').removeClass('show');
        });
    }

</script>
<script>
    function upInfo(){
        $.post('/admin/data/json/upInfo',
            $("#upInfo").serialize(),
            function (data) {
                if (data.message === 'success') {
                    alert("修改成功");
                    $(":text").val("");
                } else {
                    alert(data.message);
                }
            },
            'json'
        );
    }
</script>
</body>
</html>
