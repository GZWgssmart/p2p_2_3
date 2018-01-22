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
    <link rel="stylesheet" href="<%=path%>/static/layui/css/layui.css"/>

</head>
<body>
<div class="login" id="app">
    <ul class="login-list">
        <%--<p class="error-msg icon icon-error"></p>--%>
        <form class="layui-form" id="addAdmin" >
            <div class="layui-form-item">
                <li><input type="text" v-model="rewardSetting.minmoney" lay-verify="required" placeholder="请输入最小金额" autocomplete="off" class="layui-input"></li>
            </div>
            <div class="layui-form-item">
                <li><input type="text"  v-model="rewardSetting.maxmoney" placeholder="请输入最大金额" lay-verify="required" autocomplete="off" class="layui-input"></li>
            </div>
            <div class="layui-form-item">
                <li><input type="text" v-model="rewardSetting.percent"  placeholder="请输入奖励百分比" lay-verify="required" autocomplete="off" class="layui-input"></li>
            </div>
            <div class="layui-form-item">
                <li><button class="layui-btn layui-btn-fluid" lay-submit lay-filter="add" @click="add">保存</button></li>
            </div>
        </form>
    </ul>
</div>
<script src="<%=path%>/static/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=path%>/static/layui/layui.js"></script>
<script src="<%=path%>/static/js/vue.min.js"></script>
<script src="<%=path%>/static/js/axios.min.js"></script>
<script src="<%=path%>/static/js/qs.js"></script>
<script type="text/javascript" src="<%=path%>/static/js/layui-formVerify.js"></script>
<script>
    layui.use(['layer'], function () {
        var layer = layui.layer;
    });
    var vue = new Vue({
       el:'#app',
        data:{
            rewardSetting:{
                minmoney:'',
                maxmoney:'',
                percent:''
            }
        },
        methods:{
           add(){
               if(parseInt(this.rewardSetting.minmoney)>parseInt(this.rewardSetting.maxmoney)){
                   return layer.alert('最小值不能大于最大值');
               }
               form.on('submit(add)', function(data){
                   axios.post('/rewardset/data/json/save',Qs.stringify(vue.rewardSetting)).then((response)=>{
                       if(response.data.code ==0){
                           layer.msg('添加成功');
                           this.rewardSetting.minmoney = '';
                           this.rewardSetting.maxmoney = '';
                           this.rewardSetting.percent = '';
                           window.location.reload();
                           return;
                       }
                       layer.msg('添加失败');
               });
               },(error)=>{

               });
           }
        }
    });
</script>
</body>
</html>
