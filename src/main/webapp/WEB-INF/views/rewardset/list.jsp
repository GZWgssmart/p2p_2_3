<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/12/26
  Time: 8:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <title>投资奖励列表</title>
    <link rel="stylesheet" href="<%=path%>/static/layui/css/layui.css"/>
    <style>
        body{margin: 10px;}
        .demo-carousel{height: 200px; line-height: 200px; text-align: center;}
    </style>
</head>
<body>

<table class="layui-hide" id="user" lay-filter="demo"></table>

<div class="login" id="app" style="display: none">
        <form class="layui-form">
            <div class="layui-form-item">
                <div class="layui-input-block">
                    <input type="text" v-model="rewardSetting.minmoney" lay-verify="required" placeholder="请输入最小金额"
                           autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-input-block">
                    <input type="text"  v-model="rewardSetting.maxmoney" lay-verify="required" placeholder="请输入最大金额"
                           autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-input-block">
                    <input type="text" v-model="rewardSetting.percent" lay-verify="required" placeholder="请输入奖励百分比"
                           autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <li><button class="layui-btn layui-btn-fluid" lay-submit lay-filter="update" @click="update">保存</button></li>
            </div>
        </form>
</div>

<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-xs" lay-event="view">修改</a>
</script>
<script src="/static/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=path%>/static/layui/layui.js"></script>
<script src="<%=path%>/static/js/vue.min.js"></script>
<script src="<%=path%>/static/js/axios.min.js"></script>
<script src="<%=path%>/static/js/qs.js"></script>
<script type="text/javascript" src="<%=path%>/static/js/layui-formVerify.js"></script>
<script>

    var vue = new Vue({
        el:'#app',
        data:{
            rewardSetting:{
                minmoney:'',
                maxmoney:'',
                percent:'',
                rwsid:''
            }
        },
        methods:{
            update:function () {
                form.on('submit(update)', function(data){
                    axios.post('/rewardset/data/json/update',Qs.stringify(vue.rewardSetting)).then((response)=>{
                        if(response.data.code ==0){
                            layer.msg('修改成功');
                            layer.close(index);
                            return table.reload("rewardSetting");
                        }
                        layer.alert('修改失败');
                    },(error)=>{

                    });
                });
            }
        }
    });
    layui.use(['laydate', 'laypage', 'layer', 'table', 'carousel', 'upload', 'element'], function(){
        var laydate = layui.laydate //日期
            ,laypage = layui.laypage //分页
            ,layer = layui.layer //弹层
            ,table = layui.table //表格
            ,carousel = layui.carousel //轮播
            ,upload = layui.upload //上传
            ,element = layui.element; //元素操作

        //执行一个 table 实例
        table.render({
            elem: '#user'
            ,height: 465
            ,id:'rewardSetting'
            ,url: '<%=path%>/rewardset/data/json/list' //数据接口接口地址。默认会自动传递两个参数：?page=1&limit=30（该参数可通过 request 自定义）page 代表当前页码、limit 代表每页数据量
            ,page: true//开启分页
            ,limit:10
            ,response: {
                statusName: 'status'
                ,statusCode: 0
                ,msgName: 'message'
                ,countName: 'total'
                ,dataName: 'rows'
            }
            //后台Pager响应对象 不要动
            ,cols: [[//表头
                {field: 'minmoney', title: '最小金额(元)', align:'center', width:265}
                ,{field: 'maxmoney', title: '最大金额（元）',align:'center', width:265}
                ,{field: 'percent', title: '奖励百分比%', align:'center', width:265}
                ,{fixed: 'right',title:'操作', width: 320, align:'center', toolbar: '#barDemo'}
            ]]
        });

        //监听工具条
        table.on('tool(demo)', function(obj){ //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
            var data = obj.data //获得当前行数据
                ,layEvent = obj.event; //获得 lay-event 对应的值
            if(layEvent === 'view'){
                vue.rewardSetting = data;
                layer.open({
                    type: 1,
                    title:'修改',
                    offset:['100px'],
                    area: ['350px', '250px'],
                    fixed: false, //不固定
                    skin: '',
                    content: $("#app")
                });

            }
        });
    });
</script>

</body>
</html>

