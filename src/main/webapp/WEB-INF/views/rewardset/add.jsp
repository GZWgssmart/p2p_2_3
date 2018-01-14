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
    <title>添加奖励</title>
    <link rel="stylesheet" href="<%=path%>/static/css/style.css"/>

</head>
<body>
<div class="login">
    <ul class="login-list">
        <p class="error-msg icon icon-error"></p>
        <form id="addAdmin" method="post">
            <div class="from">
                <li><input type="text" id="minmoney" name="minmoney" placeholder="请输入最小金额"></li>
            </div>
            <div class="from">
                <li><input type="text" id="maxmoney" name="maxmoney" placeholder="请输入最小最大"></li>
            </div>
            <div class="from">
                <li><input type="text" id="percent" name="percent" placeholder="请输入奖励百分比"></li>
            </div>

            <li><input type="button" class="btn" value="添加"></li>
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
</body>
</html>
