<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="<%=path%>/static/layui/css/layui.css" media="all">
</head>

<body>
<div id="app">
    <section class="larry-grid">
        <table class="layui-hide" id="test" lay-filter="demo">

        </table>
    </section>


    <div id="testJklx" style="display: none">
        <div class="layui-form-item">
            </br></br>
            <label class="layui-form-label">借款名称</label>
            <div class="layui-input-block">
                <input type="text" v-model="jklx.lxname" autocomplete="on" class="layui-input"/>
                </br></br>

                <div class="layui-fluid">
                    <div class="layui-row">
                        <div class="layui-col-sm6">
                            <div class="grid-demo grid-demo-bg1">
                                <div class="layui-btn-group">
                                    <button class="layui-btn" @click="update">修改</button>
                                </div>
                            </div>
                        </div>
                        <div class="layui-col-sm6">
                            <div class="grid-demo">
                                <div class="layui-btn-group">
                                    <button class="layui-btn" @click="close">关闭</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script type="text/html" id="barDemo">
    <a id="test2" class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>

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
<script src="/static/js/qs.js"></script>
<script src="/static/js/axios.min.js"></script>
<script>


    $(function () {
        layui.use(['layer'], function () {
            var layer = layui.layer;
        });
    })
    var vue = new Vue({
        el: '#app',
        data: {
            jklx: []
        },
        methods: {
            update: function () {
                axios.post('/jklx/data/json/update', Qs.stringify(this.jklx))
                    .then((response) => {
                        layer.msg(response.data.message);
                        table.reload('jklx');
                        layer.closeAll();
                    }, (error) => {
                        layer.alert("请求失败");
                    });
            },

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
            ,id:'jklx'
            , height: 332
            , url: '/jklx/data/json/pager' //数据接口
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
                /*{field: 'lxid', title: 'ID', width: 80, sort: true, fixed: 'left'}*/
                {field: 'lxname', title: '借款名称', width: 350}
                , {field: 'status', title: '状态', width: 350, templet: "#status"}
                , {fixed: 'right',title:'操作' , width: 430, align: 'center', toolbar: '#barDemo'}
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
                    content: $("#testJklx"),
                    maxmin: true

                });
                vue.jklx = data;
            }
        });

    });

    /**
     * 监听点击工具
     */


</script>
</html>