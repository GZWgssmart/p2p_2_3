<%--
  Created by IntelliJ IDEA.
  User: CHEN JX
  Date: 2018/1/16
  Time: 20:45
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
<div id="dxmodel_app">
<form class="layui-form">
    <div class="layui-form-item layui-form-text" >
        <label class="layui-form-label">内容</label>
        <div class="layui-input-block">
                <textarea id="content" name="content" v-model="dxmodel.content" placeholder="请输入内容" lay-verify="content"
                          class="layui-textarea" style="width: 500px;height: 200px;"></textarea>
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-input-block">
            <button class="layui-btn" lay-submit lay-filter="dxmodelSave" @click="save">立即提交</button>
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
        });
    });


    var vue = new Vue({
        el: '#dxmodel_app',
        data: {
            dxmodel: []
        },
        methods: {
            save: function () {
                //监听提交
                form.on('submit(dxmodelSave)', function (data) {
                    /*var status = $('#status input[name="status"]:checked ').val();
                    vue.letter.status = status;*/
                    axios.post('/dxmodel/data/json/save', Qs.stringify(vue.dxmodel))
                        .then((response) => {
                            layer.closeAll();
                        }, (error) => {
                        });
                });

            }
        }
    });

</script>
</html>
