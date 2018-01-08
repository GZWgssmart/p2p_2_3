<%--
Created by IntelliJ IDEA.
User: Animo
Date: 2017-12-21
Time: 10:05
To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/static/layui/css/layui.css" media="all">
</head>
<body>
<div id="app">
<table class="layui-hide" id="test" lay-filter="demo"></table>

    <div id="liyou" style="display: none">
        审核理由:<input type="text" v-model="shborrow.excuse">
    </div>
</div>
<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">查看详情</a>
    <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="jujue">拒绝</a>
    <a class="layui-btn layui-btn-xs" lay-event="succeed">同意</a>
</script>


</body>
<script src="/static/layui/layui.js"></script>
<script src="/static/js/vue.min.js"></script>
<script src="/static/js/axios.min.js"></script>
<script src="/static/js/qs.js"></script>
<script src="/static/js/jquery.min.js"></script>
<script>


    var vue = new Vue({
       el:'#app' ,
        data:{
            shborrow:{
                excuse:'',
                baid:'',
                isok:''
            }
        }
    });

    layui.use([ 'laypage', 'layer', 'table', 'element'], function(){
        var laypage = layui.laypage //分页
        layer = layui.layer //弹层
            ,table = layui.table //表格
            ,element = layui.element; //元素操作
        //执行一个 table 实例
        table.render({
            elem: '#test'
            ,height: 332
            ,url: '/borrowapply/data/json/pager' //数据接口
            ,page: true //开启分页
            ,limit:10//每页显示多少个
            //后台Pager响应对象 不要动
            ,response: {
                statusName: 'status'
                ,statusCode: 0
                ,msgName: 'message'
                ,countName: 'total'
                ,dataName: 'rows'
            }
            //后台Pager响应对象 不要动
            //表头
            ,cols: [[
                {field: 'rname', title: '真实姓名', width:150}
                ,{field: 'money', title: '申请金额', width:150}
                ,{field: 'baid', title: '借款id', width:150}
                ,{field: 'term', title: '借款期限', width:150}
                ,{field: 'deadline', title: '截止时间', width:150}
                ,{fixed: 'right', width: 180, align:'center', toolbar: '#barDemo'}
            ]]
            //表头
        });

        //监听工具条
        table.on('tool(demo)', function(obj){ //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
            var data = obj.data //获得当前行数据
                ,layEvent = obj.event; //获得 lay-event 对应的值
            if(layEvent === 'jujue'){
               zh(1,data,obj);
            } else if(layEvent === 'del'){
                layer.confirm('真的删除行么', function(index){
                    obj.del(); //删除对应行（tr）的DOM结构
                    layer.close(index);
                    //向服务端发送删除指令
                });
            } else if(layEvent === 'succeed'){
                zh(0,data,obj);
            }
        });
    });

    function zh(status,data,obj) {
        layer.open({
            type: 1,
            title: '审核理由',
            shadeClose: true,
            shade: 0.8,
            area: ['380px', '90%'],
            btn:'确定',
            content: $("#liyou"),
            yes:function(index){
                layer.close(index);
                vue.shborrow.baid=data.baid;
                vue.shborrow.isok = status;
                if(vue.shborrow.excuse==''){
                    layer.msg("请填写审核理由");
                    return;
                }
                axios.post('/shborrow/data/json/save', Qs.stringify(vue.shborrow)).then((response)=>{
                    layer.msg(response.data.message);
                    vue.shborrow.excuse='';
                    obj.del();
                },(error)=>{

                });
            }
        });
    }
</script>
</html>
