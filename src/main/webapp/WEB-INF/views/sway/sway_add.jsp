<%--
  Created by IntelliJ IDEA.
  User: CHEN JX
  Date: 2018/1/17
  Time: 9:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="/static/layui/css/layui.css" media="all">
</head>
<body>

<div id="sway_app">
    <form class="layui-form">
        <label class="layui-form-label">还款方式</label>

        <div class="layui-input-block" style="width: 200px;">
            <select id="way" name="way" lay-verify="way">
                <option v-model="sway.way" name="way" value="">请选择一个还款方式</option>
                <option v-model="sway.way" name="way" value="等额本息">等额本息</option>
                <option v-model="sway.way" name="way" value="等额本金">等额本金</option>
                <option v-model="sway.way" name="way" value="每月付息到期还本">每月付息到期还本</option>
                <option v-model="sway.way" name="way" value="一次性还本付息">一次性还本付息</option>
            </select>
        </div>
        </br>
        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">算法</label>
            <div class="layui-input-block">
                <textarea id="fw" name="fw" v-model="sway.fw" placeholder="请输入算法" lay-verify="fw"
                          class="layui-textarea" style="width: 500px;height: 200px;"></textarea>
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">是否可用</label>
            <div class="layui-input-block" id="status" lay-verify="status">
                <input type="radio" v-model="sway.status" lay-verify="status" name="status" value="0" title="是">
                <input type="radio" v-model="sway.status" lay-verify="status" name="status" value="1" title="否">
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit lay-filter="swaySave" @click="save">添加还款方式</button>
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
            way: function (value) {
                if (value.length == 0) {
                    return '请选择一项还款方式！';
                }
            },
            fw: function (value) {
                if (value.length == 0) {
                    return '算法不能为空！';
                }
                else if (value.length < 10) {
                    return '算法至少得10个字符';
                }
                else if (/^\d+\d+\d$/.test(value)) {
                    return '算法不能全是数字';
                }
            },

            status: function () {
                var status = $('input:radio[name="status"]:checked').val();
                if (status == null) {
                    return '请选择一个状态！';
                }
            },
        });
    });


    var vue = new Vue({
        el: '#sway_app',
        data: {
            sway: []
        },
        methods: {
            save: function () {
                var options = $("#way option:selected");
                var status = $('#status input[name="status"]:checked ').val();
                /* vue.sway.way = options;*/
                vue.sway.way = options.val();
                vue.sway.status = status;
                //监听提交
                form.on('submit(swaySave)', function (data) {
                    axios.post('/sway/data/json/save', Qs.stringify(vue.sway))
                        .then((response) => {
                             layer.msg('添加成功');
                             layer.closeAll();
                        }, (error) => {
                        });
                });

            }
        }
    });

</script>
</html>
