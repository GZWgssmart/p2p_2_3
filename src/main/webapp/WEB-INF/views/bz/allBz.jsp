<%--
  Created by IntelliJ IDEA.
  User: CHEN JX
  Date: 2017/12/26
  Time: 14:52
  To change this template use File | Settings | File Templates.
--%>
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
                            <ul class="layui-tab-title">
                                <li class="layui-btn-warm "><i class="layui-icon">&#xe63c;</i>我的操作日志
                                <li class="layui-btn "><i class="layui-icon">&#xe63c;</i>我的登录日志</li>
                                <a class="layui-btn layui-btn-small larry-log-del">
                                    <i class="iconfont icon-huishouzhan1">
                                    </i>
                                    清空日志
                                </a>
                            </ul>

                        </table>

                    </div>
                </div>
            </div>
        </div>

    </section>

    <%-- <div id="testbz" style="display: none">
         <input v-model="bz.bzname" /><button @click="update">更新</button>
     </div>--%>

    <div id="testbz" style="display: none">
        <div class="layui-form-item">
            </br></br>
            <label class="layui-form-label">输入框</label>
            <div class="layui-input-block">
                <input type="text" v-model="bz.bzname" autocomplete="on" class="layui-input"/>
                <%--<input type="button" class="layui-btn" @click="update">更新</input>--%>
                </br></br></br> </br></br></br></br>


                <div class="layui-fluid">
                    <div class="layui-row">
                        <div class="layui-col-sm6">
                            <div class="grid-demo grid-demo-bg1">
                                <div class="layui-btn-group">
                                    <button class="layui-btn"@click="update">增加</button>
                                </div>
                            </div>
                        </div>
                        <div class="layui-col-sm6">
                            <div class="grid-demo">
                                <div class="layui-btn-group">
                                    <button class="layui-btn"@click="update">关闭</button>
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


</body>
<script src="<%=path%>/static/layui/layui.js"></script>
<script src="/static/js/jquery.min.js"></script>
<script src="/static/js/vue.min.js"></script>
<script>

    var vue = new Vue({
        el: '#app',
        data: {
            bz: []
        },
        methods: {
            update(){
                console.log(this.bz);
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
            , url: '/bz/data/json/pager' //数据接口
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
                {field: 'bzid', title: 'ID', width: 80, sort: true, fixed: 'left'}
                , {field: 'bzname', title: '标种名称', width: 120}
                , {field: 'status', title: '状态', width: 120}
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
                    content: $("#testbz"),
                    maxmin: true

                });
                vue.bz = data;
            }
        });

    });

    /**
     * 监听点击工具
     */


</script>
</html>