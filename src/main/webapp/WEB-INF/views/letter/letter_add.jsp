<%--
  Created by IntelliJ IDEA.
  User: CHEN JX
  Date: 2018/1/17
  Time: 8:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="/static/layui/css/layui.css" media="all">
</head>
<body>
</br></br>
<div id="letter-app">

    <form id="signupForm" class="layui-form">
        <div class="layui-form-item">
            <label class="layui-form-label">标题</label>
            <div class="layui-input-block">
                <input type="text" v-model="letter.title" style="width: 260px;"
                       lay-verify="title" placeholder="请输入标题"
                       autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">内容</label>
            <div class="layui-input-block">
                <textarea id="content" name="content" v-model="letter.content" placeholder="请输入内容" lay-verify="content"
                          class="layui-textarea" style="width: 500px;height: 200px;"></textarea>
            </div>
        </div>

       <div class="layui-form-item">
            <label class="layui-form-label">是否可用</label>
            <div class="layui-input-block">
                <input type="radio" v-model="letter.status" value="0" title="是">
                <input type="radio" v-model="letter.status" value="1" title="否" checked>
            </div>
        </div>


        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit lay-filter="formDemo" @click="save">添加站内信</button>
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </div>
    </form>
</div>
</body>
<script src="/static/layui/layui.js"></script>
<script src="/static/js/jquery.min.js"></script>
<script src="/static/js/vue.min.js"></script>
<script src="/static/js/qs.js"></script>
<script src="/static/js/axios.min.js"></script>
<script type="text/javascript" src="/static/layui/layui.all.js"></script>
<script>
    layui.use(['form', 'layedit', 'laydate'], function () {
        var form = layui.form
            , layer = layui.layer
            , layedit = layui.layedit
            , laydate = layui.laydate;

        //自定义验证规则
        form.verify({
            title: function (value) {
                if (value.length == 0) {
                    return '标题不能为空！';
                }
                else if (value.length < 5) {
                    return '标题至少得5个字符';
                }
            },
            content: function (value) {
                if (value.length == 0) {
                    return '内容不能为空！';
                }
                else if (value.length < 10) {
                    return '内容至少得10个字符';
                }
            },
        });

        //创建一个编辑器
        /*layedit.build('LAY_demo_editor');*/

        //监听提交
        /*form.on('submit(demo1)', function (data) {
            layer.alert(JSON.stringify(data.field), {
                title: '最终的提交信息'
            })
            return false;
        });*/

    });


    $(function () {
        layui.use(['layer'], function () {
            var layer = layui.layer;
        });
    })
    var vue = new Vue({
        el: '#letter-app',
        data: {
            letter: []
        },
        methods: {
            save: function () {
                alert(123);
                /*axios.post('/letter/data/json/save', Qs.stringify(this.letter))
                    .then((response) => {
                        layer.msg(response.data.message);
                        /!*table.reload('letter');*!/
                        layer.closeAll();
                    }, (error) => {
                        layer.alert("请求失败");
                    });*/
            },
        }
    });
</script>

</html>
