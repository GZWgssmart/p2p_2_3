<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="<%=path%>/static/layui/css/layui.css" media="all">
    <link rel="stylesheet" type="text/css" href="<%=path %>/static/layui/css/global.css" media="all">
    <link rel="stylesheet" type="text/css" href="<%=path %>/static/layui/css/common.css" media="all">
</head>

<body>
<div id="app">
    <section class="larry-grid">
        <div class="larry-personal">
            <div class="layui-tab">

                <div class="larry-separate"></div>
                <div class="layui-tab-content larry-personal-body clearfix mylog-info-box">
                    <!-- 操作日志 -->
                    <div class="layui-tab-item layui-field-box layui-show">
                        <table class="layui-hide" id="test" lay-filter="demo">
                            <%--<ul class="layui-tab-title">
                                <li class="layui-btn-warm "><i class="layui-icon">&#xe63c;</i>我的操作日志
                                <li class="layui-btn "><i class="layui-icon">&#xe63c;</i>我的登录日志</li>
                                <a class="layui-btn layui-btn-small larry-log-del">
                                    <i class="iconfont icon-huishouzhan1">
                                    </i>
                                    清空日志
                                </a>
                            </ul>--%>

                        </table>

                    </div>
                </div>
            </div>
        </div>

    </section>


    <div id="testSway" style="display: none">
        </BR>
        <div class="layui-form-item">
            <label class="layui-form-label">还款方式</label>
            <div class="layui-input-block">
                <input style="width: 200px;" type="text" v-model="sway.way" autocomplete="on" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item layui-form-text" style="width: 500px;height: 150px;">
            <label class="layui-form-label">计算</label>
            <div class="layui-input-block">
                <textarea name="desc" v-model="sway.fw" class="layui-textarea"></textarea>
            </div>
        </div>

        <div>
            <button class="layui-btn layui-col-md-offset5" @click="close">关闭</button>
        </div>
    </div>

</div>

<script type="text/html" id="barDemo">
    <a id="test2" class="layui-btn layui-btn-xs" lay-event="edit">查看</a>

</script>
<script type="text/html" id="status">
    {{# if(d.status==0){ }}
    <span>可用</span>
    {{#   }else{ }}
    <span>不可用</span>
    {{#  } }}
</script>

</body>
<script src="/static/layui/layui.js"></script>
<script src="/static/js/jquery.min.js"></script>
<script src="/static/js/vue.min.js"></script>

<script src="/static/js/axios.min.js"></script>
<script src="/static/js/qs.js"></script>
<script>

    /*$(function () {
     layui.use(['layer'], function(){
     var layer = layui.layer;
     });
     })*/
    var vue = new Vue({
        el: '#app',
        data: {
            sway: []
        },
        methods:{
            /*update:function () {
             axios.post('/letter/data/json/update', Qs.stringify(this.letter))
             .then((response)=>{
             layer.msg(response.data.message);
             window.location.reload();
             /!*layer.closeAll();*!/
             },(error)=>{
             layer.alert("请求失败");
             });
             },
             */
            close: function () {
                layer.closeAll();
            }
        }
    });

    layui.use(['laypage', 'layer', 'table', 'element'], function () {
        var laypage = layui.laypage //分页
        layer = layui.layer //弹层
            , table = layui.table //表格
            , element = layui.element; //元素操作
        //执行一个 table 实例
        table.render({
            elem: '#test'
            , height: 332
            , url: '/sway/data/json/pager' //数据接口
            , page: true //开启分页
            , limit: 5//每页显示多少个
            , response: {
                statusName: 'status'
                , statusCode: 0
                , msgName: 'message'
                , countName: 'total'
                , dataName: 'rows'
            }
            , cols: [[ //表头
                {field: 'sid', title: 'ID', width: 80, sort: true, fixed: 'left'}
                , {field: 'way', title: '还款方式', width: 120}
                , {field: 'fw', title: '计算', width: 120}
                , {field: 'status', title: '状态', width: 120, templet: "#status"}
                , {fixed: 'right', width: 165, align: 'center', toolbar: '#barDemo'}
            ]]

        });
        //监听工具条
        table.on('tool(demo)', function (obj) { //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
            var data = obj.data //获得当前行数据
                , layEvent = obj.event; //获得 lay-event 对应的值
            if (layEvent === 'detail') {
                layer.msg('查看操作');
            } else if (layEvent === 'del') {
                layer.confirm('真的删除行么', function (index) {
                    obj.del(); //删除对应行（tr）的DOM结构
                    layer.close(index);
                    //向服务端发送删除指令
                });
            } else if (layEvent === 'edit') {
                layer.open({
                    type: 1,
                    area: ['600px', '360px'],
                    shadeClose: true, //点击遮罩关闭
                    content: $("#testSway"),
                    maxmin: true

                });
                vue.sway = data;
            }
        });

    });



</script>
</html>