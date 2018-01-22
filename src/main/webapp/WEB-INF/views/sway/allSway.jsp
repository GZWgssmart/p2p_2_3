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

    <form id="signupForm" class="layui-form">
        <div id="testSway" style="display: none">
            </BR>
            <div class="layui-form-item">
                <label class="layui-form-label">还款方式</label>
                <div class="layui-input-block">
                    <input style="width: 200px;" type="text" v-model="sway.way" lay-verify="way" autocomplete="on"
                           class="layui-input">
                </div>
            </div>
            <div class="layui-form-item layui-form-text" style="width: 500px;height: 150px;">
                <label class="layui-form-label">计算</label>
                <div class="layui-input-block">
                    <textarea name="desc" style="width:380px;" v-model="sway.fw" lay-verify="fw"
                              class="layui-textarea"></textarea>
                    </br></br>

                    <div class="layui-fluid">
                        <div class="layui-row">
                            <div class="layui-col-sm6">
                                <div class="grid-demo grid-demo-bg1">
                                    <div class="layui-btn-group">
                                        <button class="layui-btn" lay-submit lay-filter="swayUpdate" @click="update">
                                            修改
                                        </button>
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
    </form>
</div>

<script type="text/html" id="barDemo">
    <a id="test2" class="layui-btn layui-btn-xs" lay-event="edit">查看</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>

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
            way: function (value) {
                if (value.length == 0) {
                    return '内容不能为空！';
                }
            },
            fw: function (value) {
                if (value.length == 0) {
                    return '算法不能为空！';
                }
                else if (value.length < 10) {
                    return "算法格式不正确且长度不能小于8个字符"
                }
            },
        });
    });


    $(function () {
        layui.use(['layer'], function () {
            var layer = layui.layer;
        });
    })
    var vue = new Vue({
        el: '#app',
        data: {
            sway: []
        },
        methods: {
            update: function () {

                //监听修改
                form.on('submit(swayUpdate)', function (data) {
                    //请求修改url
                    axios.post('/sway/data/json/update', Qs.stringify(vue.sway))
                        .then((response) => {
                            layer.msg(response.data.message);
                            table.reload('sway');
                            layer.closeAll();
                        }, (error) => {
                            layer.alert("请求失败");
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
            , id: 'sway'
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
                {field: 'way', title: '还款方式', width: 230}
                , {field: 'fw', title: '计算', width: 500}
                , {field: 'status', title: '状态', width: 208, templet: "#status"}
                , {fixed: 'right', width: 185, align: 'center', toolbar: '#barDemo'}
            ]]

        });
        //监听工具条
        table.on('tool(demo)', function (obj) { //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
            var data = obj.data //获得当前行数据
                , layEvent = obj.event; //获得 lay-event 对应的值
            vue.sway = data;
            if (layEvent === 'detail') {
                layer.msg('查看操作');
            } else if (layEvent === 'del') {
                layer.msg('确认删除该条数据？10s后自动取消...', {
                    time: 10000, //10s后自动关闭
                    btn: ['YES', 'NO'],
                    yes: function () {
                        axios.post('/sway/data/json/remove', Qs.stringify(vue.sway)).then((response) => {
                            layer.msg('删除成功');
                            time: 800,
                                table.reload('sway');
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
                    content: $("#testSway"),
                    maxmin: true

                });
            }
        });

    });


</script>
</html>