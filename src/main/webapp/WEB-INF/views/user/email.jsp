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
    <link rel="stylesheet" href="<%=path%>/static/css/style.css"/>
    <link rel="stylesheet" href="<%=path%>/static/layui/css/layui.css"/>
    <style>
        div.login{
            width: 400px;
            height: 250px;
            background:#fff;
            border-radius: 5px;
            position: fixed;
            left: 50%;
            top: 50%;
            margin:-85px 0 0 -200px;
            text-align:center;
        }

        .login-list #btn{
            width: 318px;
            height: 40px;
            line-height: 20px;
            text-align: center;
            background:#e62538;
            font-size: 20px;
            color:#fff;
            display: block;
        }
        .login-list #btn:hover{
            cursor:pointer;
            background:#e62538;
        }
    </style>
</head>
<body>
<div class="login">
    <ul class="login-list">
        <p class="error-msg icon icon-error"></p>
        <form id="upEmail" method="post">
            <input name="uid" value="${sessionScope.user.uid}" type="hidden"/>
            <div class="from">
                <li><input type="email" id="email" name="email" placeholder="请输入邮箱"></li>
            </div>
            <li><input type="button" id="btn" class="btn" onclick="upEmail();" value="修改"></li>
        </form>
    </ul>
</div>

<script src="<%=path%>/static/js/jquery.min.js"></script>
<script src="<%=path%>/static/js/user/jquery-latest.js"></script>
<script type="text/javascript" src="<%=path%>/static/layui/layui.js"></script>

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
    var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引

    layui.use(['layer'], function() {
        var layer = layui.layer //弹层
    });

    function upEmail() {
        var email = $("#email").val();
        if(email == '') {
            showError("请输入邮箱", $("#email"));
            return;
        }else if(!$("input[name='email']").val().match(/^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+((\.[a-zA-Z0-9_-]{2,3}){1,2})$/)) {
            showError("邮箱格式不正确", $("#email"));
            return false;
        }
        $.post('/user/data/json/saveEmail',
            $("#upEmail").serialize(),
            function (data) {
                if (data.code === 0) {
                    layer.msg("修改成功");
                    parent.layer.close(index); //再执行关闭
                    $(":text").val("");

                } else if(data.message == 'error'){
                    showError("该邮箱已存在", $("#email"));
                }
            },
            'json'
        );
    }
</script>
</body>
</html>
