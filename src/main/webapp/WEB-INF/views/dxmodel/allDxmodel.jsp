<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="<%=path%>/static/layui/css/layui.css" media="all">
    <style>
        button {
            margin-right: 100px;
        }
    </style>
</head>

<body>
<div id="app">
    <section class="larry-grid">
        <table class="layui-hide" id="test" lay-filter="demo">

        </table>

    </section>
    <form id="signupForm" class="layui-form">
    <div id="testDxmodel" style="display: none">
        <div class="layui-form-item">
            </br></br>
            <div class="layui-form-item layui-form-text" style="width: 500px;height: 150px;">
                <label class="layui-form-label">内容</label>
                <div class="layui-input-block">
                    <textarea name="desc" v-model="dxmodel.content" lay-verify="content" class="layui-textarea"></textarea>


                    </br></br>

                    <div class="layui-fluid">
                        <div class="layui-row">
                            <div class="layui-col-sm6">
                                <div class="grid-demo grid-demo-bg1">
                                    <div class="layui-btn-group">
                                        <button class="layui-btn" lay-submit lay-filter="dxmodelUpdate" @click="update">修改</button>
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
    </form>
</div>

<script type="text/html" id="barDemo">
    <a id="test2" class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>

</body>
<script src="/static/layui/layui.js"></script>
<script src="/static/js/jquery.min.js"></script>
<script src="/static/js/vue.min.js"></script>
<script src="/static/js/qs.js"></script>
<script src="/static/js/axios.min.js"></script>
<script>
    var form;

    $(function () {
        layui.use(['layer'], function () {
            var layer = layui.layer;
        });
    })
    layui.use(['form', 'layer'], function () {
        var layer = layui.layer;
        form = layui.form;
        //自定义验证规则
        form.verify({
            content: function (value) {
                if (value.length == 0) {
                    return '内容不能为空！';
                }
                else if (value.length < 10) {
                    return '内容至少得10个字符';
                }
            },
        });
    });



    var vue = new Vue({
        el: '#app',
        data: {
            dxmodel: []
        },
        methods: {
            update: function () {


                //监听修改
                form.on('submit(dxmodelUpdate)', function (data) {
                        //请求修改url
                axios.post('/dxmodel/data/json/update', Qs.stringify(vue.dxmodel))
                    .then((response) => {
                        layer.msg(response.data.message);
                        table.reload('dxmodel');
                        layer.closeAll();
                    }, (error) => {
                    });
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
            , id: "dxmodel"
            , height: 332
            , url: '/dxmodel/data/json/pager' //数据接口
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
               /* {field: 'dxid', title: 'ID', width: 80, sort: true, fixed: 'left'}*/
                 {field: 'content', title: '内容', width: 940}
                , {fixed: 'right', width: 165, align: 'center', toolbar: '#barDemo'}
            ]]

        });
        //监听工具条
        table.on('tool(demo)', function (obj) { //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
            var data = obj.data //获得当前行数据
                , layEvent = obj.event; //获得 lay-event 对应的值
            vue.dxmodel = data;
            if (layEvent === 'detail') {
                layer.msg('查看操作');
            } else if (layEvent === 'del') {
                layer.msg('确认删除该条数据？10s后自动取消...', {
                    time: 10000, //10s后自动关闭
                    btn: ['YES', 'NO'],
                    yes: function () {
                        axios.post('/dxmodel/data/json/remove', Qs.stringify(vue.dxmodel)).then((response) => {
                            layer.msg('删除成功');
                            time: 800,
                                table.reload('dxmodel');
                        }, (error) => {
                            layer.alert("请求失败");
                        });
                    },
                    no: function () {
                        layer.msg('已取消');
                    }
                });
            } else if (layEvent === 'edit') {
                layer.open({
                    type: 1,
                    area: ['600px', '360px'],
                    shadeClose: true, //点击遮罩关闭
                    content: $("#testDxmodel"),
                    maxmin: true

                });

            }
        });

    });


</script>
</html>