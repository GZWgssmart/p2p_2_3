<%--
  Created by IntelliJ IDEA.
  User: qm
  Date: 2018/1/8
  Time: 16:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% String path = request.getContextPath();%>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <title>提现审核列表</title>
    <link rel="stylesheet" href="<%=path%>/static/layui/css/layui.css"/>
    <style>
        body {
            margin: 10px;
        }

        .demo-carousel {
            height: 200px;
            line-height: 200px;
            text-align: center;
        }
        #agree,#refuse{
            width: 400px;
            height: 100px;
        }
    </style>
</head>
<body>
<div id="apptxCheck">
    <table class="layui-hide" id="user" lay-filter="demo"></table>

    <!--拒绝编辑窗口-->
    <div id="editWin" style="display: none">
        <form class="layui-form">
            <div class="layui-form-item">
                <label class="layui-form-label">原因</label>
                <div class="layui-input-block">
                    <textarea v-model="txCheckVO.excuse" placeholder="请输入拒绝原因" class="layui-textarea" style="width: 400px;"></textarea>
                </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-input-block">
                    <button class="layui-btn" @click="agreeCheck">保存</button>
                    <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                </div>
            </div>
        </form>
    </div>
</div>
<script src="<%=path%>/static/js/jquery-js/jquery.min.js"></script>
<script type="text/javascript" src="<%=path%>/static/js/vue.min.js"></script>
<script type="text/javascript" src="<%=path%>/static/js/axios.min.js"></script>
<script type="text/javascript" src="<%=path%>/static/layui/layui.js"></script>
<script type="text/javascript" src="<%=path%>/static/js/qs.js"></script>

<script>


    var vue = new Vue({
        el:"#apptxCheck",
        data:{
            txCheckData:[],
            txCheckVO:{
               txid:'',
                uid:'',
                money:'',
                status:'',
                excuse:''
            },
            seen:true
        },
        created () {
        },
        methods:{
            agreeCheck () {
                vue.txCheckVO.txid=vue.txCheckData.txid;
                vue.txCheckVO.money=vue.txCheckData.money;
                vue.txCheckVO.uid=vue.txCheckData.uid;
                axios.post('/txCheck/data/json/check', Qs.stringify(this.txCheckVO))
                    .then((response)=>{
                        layer.msg(response.data.message);
                        window.location.reload();
                    },(error)=>{
                        layer.msg("请求失败");
                    });
            }
        }
    });
    layui.use(['form','laydate', 'laypage', 'layer', 'table', 'element'], function () {
        var laydate = layui.laydate //日期
            , laypage = layui.laypage //分页
            ,from = layui.form
            ,layer = layui.layer //弹层
            , table = layui.table //表格
            , element = layui.element; //元素操作

        //执行一个 table 实例
        table.render({
            elem: '#user'
            , height: 465
            , url: '<%=path%>/LogTx/data/json/listAll' //数据接口接口地址。默认会自动传递两个参数：?page=1&limit=30（该参数可通过 request 自定义）page 代表当前页码、limit 代表每页数据量
            , page: true//开启分页
            , limit: 10
            , response: {
                statusName: 'status'
                , statusCode: 0
                , countName: 'total'
                , dataName: 'rows'
            }
            //后台Pager响应对象 不要动
            , cols: [[//表头
                 {field: 'bankcard', title: '卡号', width: 193}
                , {field: 'banktype', title: '所属银行', width: 140}
                , {field: 'money', title: '金额', width: 120}
                , {field: 'status', title: '状态', width: 120,templet:'<div>{{statusFormat(d.status)}}</div>'}
                , {field: 'createdTime', title: '创建时间', width: 240,sort:true}
                , {fixed: 'right', title: '操作', width: 155, align: 'center',templet:'<div>{{statusOpt(d.status)}}</div>'}
            ]]
        });

        //监听工具条
        table.on('tool(demo)', function (obj) { //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
            var data = obj.data //获得当前行数据
                , layEvent = obj.event; //获得 lay-event 对应的值
            if (layEvent === 'agree') {
                layer.open({
                    type: 1,
                    title:'对提现进行审核',
                    area: ['700px', '450px'],
                    fixed: false, //不固定
                    maxmin: true,
                    closeBtn: 1,
                    skin: '',
                    content: $("#editWin")
                });
                vue.txCheckData = data;
                vue.txCheckVO.status = 0;
            }else if(layEvent === 'refuse'){
                layer.open({
                    type: 1,
                    title:'对提现进行审核',
                    area: ['700px', '450px'],
                    fixed: false, //不固定
                    maxmin: true,
                    closeBtn: 1,
                    skin: '',
                    content: $("#editWin")
                });
                vue.txCheckData = data;
                vue.txCheckVO.status = 1;
            }
        });

    });

    function statusFormat(value){
        if(value==0){
            return "未受理";
        }else if(value==1){
            return "提现成功";
        }else if(value==2){
            return "提现失败";
        }
    }

    function statusOpt(value){
        if(value==0){
            return "<a class=\"layui-btn layui-btn layui-btn-xs\" lay-event=\"agree\" >同意</a>\n" +
                "        <a class=\"layui-btn layui-btn-danger layui-btn-xs\" lay-event=\"refuse\" >拒绝</a>";
        }else if(value==1){
            return "不可操作";
        }else if(value==2){
            return "不可操作";
        }
    }


</script>
</body>
</html>
