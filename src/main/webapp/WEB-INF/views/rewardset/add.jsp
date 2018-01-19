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
<div class="login" id="app">
    <ul class="login-list">
        <p class="error-msg icon icon-error"></p>
        <form id="addAdmin" >
            <div class="from">
                <li><input type="text" v-model="rewardSetting.minmoney" placeholder="请输入最小金额"></li>
            </div>
            <div class="from">
                <li><input type="text"  v-model="rewardSetting.maxmoney" placeholder="请输入最大金额"></li>
            </div>
            <div class="from">
                <li><input type="text" v-model="rewardSetting.percent"  placeholder="请输入奖励百分比"></li>
            </div>

            <li><input type="button" class="btn" @click="add" value="添加"></li>
        </form>
    </ul>
</div>
<script src="<%=path%>/static/js/jquery.min.js"></script>
<script src="<%=path%>/static/js/vue.min.js"></script>
<script src="<%=path%>/static/js/axios.min.js"></script>
<script src="<%=path%>/static/js/qs.js"></script>
<script>
    new Vue({
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
               if(this.rewardSetting.minmoney>this.rewardSetting.maxmoney){
                   return alert('最小值不能大于最大值');
               }
               axios.post('/rewardset/data/json/save',Qs.stringify(this.rewardSetting)).then((response)=>{
                   if(response.data.code ==0){
                        alert('添加成功');
                       this.rewardSetting.minmoney = '';
                       this.rewardSetting.maxmoney = '';
                       this.rewardSetting.percent = '';
                       return;
                   }
                   alert('添加失败');
               },(error)=>{

               });
           }
        }
    });
</script>
</body>
</html>
