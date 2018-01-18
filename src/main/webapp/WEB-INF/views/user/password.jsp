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
            height: 450px;
            background:#fff;
            border-radius: 5px;
            position: fixed;
            left: 50%;
            top: 50%;
            margin:-139px 0 0 -200px;
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
        <form id="updatePwd" method="post">
            <div class="from">
                <li><input type="password" id="pwd" name="pwd" placeholder="请输入原密码"></li>
            </div>
            <div class="from">
                <li><input type="password" id="nowPwd" name="nowPwd" placeholder="请输入现密码"></li>
            </div>
            <div class="from">
                <li><input type="password" id="rePwd" name="rePwd" placeholder="请确认密码"></li>
            </div>

            <li><input type="button" id="btn" class="btn" onclick="updatePwd();" value="修改"></li>
        </form>
    </ul>
</div>
<script src="<%=path%>/static/js/jquery.min.js"></script>
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


    function updatePwd(){
        var pwd = $("#pwd").val();
        var nowPwd = $("#nowPwd").val();
        var rePwd = $("#rePwd").val();
        if(pwd=='') {
            showError('请输密码',$("#pwd"));
            return;
        }else if(nowPwd==''){
            showError('请输入现密码',$("#nowPwd"));
            return;
        }else if(rePwd==''){
            showError('请确认密码',$("#rePwd"));
            return;
        };
        $.post('/user/data/json/updatePwd',
            $("#updatePwd").serialize(),
            function (data) {
                if (data.message === 'success') {
                    parent.layer.close(index); //再执行关闭
                    alert("修改成功");
                    $(":password").val("");

                } else {
                    showError(data.message, $("#pwd"));
                }
            },
            'json'
        );
    }
</script>
</body>
</html>
