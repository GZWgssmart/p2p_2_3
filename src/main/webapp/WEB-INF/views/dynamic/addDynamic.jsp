<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/12/31
  Time: 19:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<html>
<head>
    <title>添加动态</title>
    <link rel="stylesheet" href="<%=path%>/static/layui/css/layui.css"/>
</head>
<body>
<div id="app">
    <button class="layui-btn" @click="saveDynamic">保存</button>
    <input type="text"  v-model="dynamic.title" required  lay-verify="required" placeholder="请输入标题" autocomplete="off" class="layui-input">
    <!-- 加载编辑器的容器 -->
    <script id="container" name="content" type="text/plain">
          这里写你的初始化内容
      </script>
</div>
<script type="text/javascript" src="<%=path%>/static/js/jquery-js/jquery.min.js"></script>
<script type="text/javascript" src="<%=path%>/static/layui/layui.js"></script>
<script type="text/javascript" src="<%=path%>/static/js/vue.min.js"></script>
<script type="text/javascript" src="<%=path%>/static/js/axios.min.js"></script>
<script type="text/javascript" src="<%=path%>/static/js/qs.js"></script>
<!-- 配置文件 -->
<script type="text/javascript" src="<%=path%>/static/ueditor/ueditor.config.js"></script>
<!-- 编辑器源码文件 -->
<script type="text/javascript" src="<%=path%>/static/ueditor/ueditor.all.js"></script>
<!-- 实例化编辑器 -->
<script type="text/javascript">
    $(function () {
        layui.use(['layer'], function(){
            var layer = layui.layer;
        });
        var vue = new Vue({
            el:'#app',
            data:{
                dynamic:{
                    title:'',
                    content:''
                }
            },
            methods:{
                saveDynamic:function () {
                    vue.dynamic.content = getContent();
                    axios.post('/dyna/data/json/save', Qs.stringify(this.dynamic)).then((response) => {
                        layer.msg(response.data.message);
                        window.location.href="/back/dyna/pager";
                    }, (error) => {
                        layer.alert("请求失败");
                    });
                }
            }
        });
    })
    var ue = UE.getEditor('container');
    //获取文本
    function getContent() {
        return ue.getContent();
    }
</script>
</body>
</html>
