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
            <div class="layui-input-block" id="status">
                <input type="radio" lay-verify="status" v-model="letter.status" name="status" value="0" title="是" checked="">
                <input type="radio" lay-verify="status" v-model="letter.status" name="status" value="1" title="否">
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit lay-filter="letterSave" @click="save">添加站内信</button>
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
<script>
    var form;
    layui.use(['form', 'layer'], function () {
        var layer = layui.layer;
        form = layui.form;
        //自定义验证规则
        form.verify({
            title: function (value,item) {
                if (value.length == 0) {
                    return '标题不能为空！';
                }
                else if (value.length < 5) {
                    return '标题至少得5个字符';
                }
                else if (!new RegExp("^[a-zA-Z0-9_\u4e00-\u9fa5\\s·]+$").test(value)) {
                    return '标题不能有特殊字符';
                }
                else if (/(^\_)|(\__)|(\_+$)/.test(value)) {
                    return '用户名首尾不能出现下划线\'_\'';
                }
                else if (/^\d+\d+\d$/.test(value)) {
                    return '标题不能全是数字';
                }
            },
            content: function (value) {
                if (value.length == 0) {
                    return '内容不能为空！';
                }
                else if (value.length < 10) {
                    return '内容至少得10个字符';
                }
                else if (!new RegExp("^[a-zA-Z0-9_\u4e00-\u9fa5\\s·]+$").test(value)) {
                    return '内容不能有特殊字符';
                }
                else if (/^\d+\d+\d$/.test(value)) {
                    return '内容不能全是数字';
                }
            },
            status: function () {
                var value = $('input:radio[name="status"]:checked').val();
                if (value == null) {
                    return '请选择一个状态！';
                }
            },
        });
    });


    var vue = new Vue({
        el: '#letter-app',
        data: {
            letter: []
        },
        methods: {
            save: function () {
                //监听提交
                form.on('submit(letterSave)', function (data) {
                    /*var layEvent = data.event;*/
                    var status = $('#status input[name="status"]:checked ').val();
                    vue.letter.status = status;
                    axios.post('/letter/data/json/save', Qs.stringify(vue.letter))
                        .then((response) => {
                            layer.msg('添加成功！！！');
                            time: 800,
                                table.reload('letter');
                        }, (error) => {
                            layer.msg('添加失败');
                        });
                });

            }
        }
    });

</script>

</html>
