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
    <title>添加媒体报道</title>
    <link rel="stylesheet" href="<%=path%>/static/layui/css/layui.css"/>
</head>
<body>
<div id="app" style="width: 1140px; margin: 0;">
    <br/>
    <button style="width: 1144px; margin: 0;" class="layui-btn" @click="saveMedia">保存</button>
    <br/>
    <br/>
    <a href="/back/med/pager"><button  style="width: 1144px; margin: 0;" class="layui-btn layui-btn-normal" >返回列表</button></a>
    <br/>
    <br/>
    <input type="text"  v-model="media.title" required  lay-verify="required" placeholder="请输入媒体报道标题" autocomplete="off" class="layui-input">
    <br/>
    <!-- 加载编辑器的容器 -->
    <script id="container" name="content"  type="text/plain">

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
                media:{
                    title:'',
                    content:'',
                    url:''
                }
            },
            methods:{
                saveMedia:function () {
                    vue.media.content = getContent();
                    vue.media.url = getContentTxt();
                    if (vue.media.content.length > 0) {
                        axios.post('/media/data/json/save', Qs.stringify(this.media)).then((response) => {
                            layer.msg(response.data.message);
                            window.location.href = "/back/med/pager";
                        }, (error) => {
                            layer.alert("请求失败");
                        });
                    }else {
                            layer.alert("请输入内容！")
                    }

                }
            }
        });
    })
    var ue = UE.getEditor('container');
    //获取文本
    function getContent() {
        return ue.getContent();
    }
    function getContentTxt() {
       return ue.getContentTxt()
    }

</script>
</body>
</html>

