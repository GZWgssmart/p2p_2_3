<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/12/25
  Time: 10:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<html>
<head>
    <title>所有角色</title>
    <link rel="stylesheet" href="<%=path%>/static/css/zTree-css/zTreeStyle.css"/>
    <link rel="stylesheet" href="<%=path%>/static/layui/css/layui.css"/>
</head>
<body>
<div>
    <input type="button" value="添加角色" onclick="editRole()">
</div>

<!--角色zTree的显示容器-->
<ul id="roleTree" class="ztree" style="width:auto; overflow:auto;"></ul>

<div id="nodeTip" v-model="checked">当前选中：{{checked}}</div>

</body>
<script src="<%=path%>/static/js/jquery-js/jquery.min.js"></script>
<script type="text/javascript" src="<%=path%>/static/js/zTree-js/jquery.ztree.core.js"></script>
<script type="text/javascript" src="<%=path%>/static/js/zTree-js/jquery.ztree.excheck.js"></script>
<script type="text/javascript" src="<%=path%>/static/js/zTree-js/jquery.ztree.exedit.js"></script>
<script type="text/javascript" src="<%=path%>/static/js/zTree-js/jquery.ztree.exhide.js"></script>
<script type="text/javascript" src="<%=path%>/static/js/vue.min.js"></script>
<script type="text/javascript" src="<%=path%>/static/js/axios.min.js"></script>
<script type="text/javascript" src="<%=path%>/static/layui/layui.js"></script>
<!--自定义js文件-->
<script type="text/javascript" src="<%=path%>/static/js/role-js/role.js"></script>
<script type="text/javascript">
    new Vue({
        data:{
            list:[]
        },
        created () {
            initTreeRole();
            getNodes(0);
        }
    })
    layui.use(['layer'], function(){
        var layer = layui.layer;
    });
</script>
</html>
