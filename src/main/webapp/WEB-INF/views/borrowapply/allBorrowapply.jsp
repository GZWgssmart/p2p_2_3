<%--
Created by IntelliJ IDEA.
User: Animo
Date: 2017-12-21
Time: 10:05
To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/static/layui/css/layui.css" media="all">
</head>
<body>
<div id="app">
<table class="layui-hide" id="test" lay-filter="demo"></table>

    <div id="liyou" style="display: none">
        <form class="layui-form" action="">
            <div class="layui-form-item">
                <label class="layui-form-label">状态</label>
                <div class="layui-input-block">
                    <input type="radio" name="status" value="0" title="同意" checked>
                    <input type="radio" name="status"  value="1" title="拒绝" >
                </div>
            </div>
            <div class="layui-form-item layui-form-text">
                <label class="layui-form-label">理由</label>
                <div class="layui-input-block">
                    <textarea v-model="shborrow.excuse" placeholder="请输理由" class="layui-textarea"></textarea>
                </div>
            </div>
        </form>
    </div>

    <div id="huankuanview" style="display: none">
        <table class="layui-hide" id="hkjh" lay-filter="demo"></table>
    </div>

    <div id="touziliebiao" style="display: none">
        <table class="layui-hide" id="tzlb" lay-filter="tzlb"></table>
    </div>

    <div id="yonghushouyi" style="display: none">
        <table class="layui-hide" id="yhsy" lay-filter="yhsy"></table>
    </div>
</div>
<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="hkjh">还款计划</a>
    <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="tzlb">投资列表</a>
    <a class="layui-btn layui-btn-xs" lay-event="sh">审核</a>
</script>


</body>
<script src="/static/layui/layui.js"></script>
<script src="/static/js/vue.min.js"></script>
<script src="/static/js/axios.min.js"></script>
<script src="/static/js/qs.js"></script>
<script src="/static/js/jquery.min.js"></script>
<script src="/static/js/common.js"></script>
<script type="text/html" id="tzlbDemo">
    <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">用户收益</a>
</script>
<script>


    var vue = new Vue({
       el:'#app' ,
        data:{
            shborrow:{
                excuse:'',
                baid:'',
                isok:''
            }
        }
    });

    layui.use([ 'laypage', 'layer', 'table', 'element'], function(){
        var laypage = layui.laypage //分页
        layer = layui.layer //弹层
            ,table = layui.table //表格
            ,element = layui.element; //元素操作
        //执行一个 table 实例
        table.render({
            elem: '#test'
            ,id:'borrowapply'
            ,url: '/borrowapply/data/json/pager' //数据接口
            ,page: true //开启分页
            ,limit:10//每页显示多少个
            //后台Pager响应对象 不要动
            ,response: {
                statusName: 'status'
                ,statusCode: 0
                ,msgName: 'message'
                ,countName: 'total'
                ,dataName: 'rows'
            }
            //后台Pager响应对象 不要动
            //表头
            ,cols: [[
                {field: 'rname', title: '真实姓名', width:150}
                ,{field: 'cpname', title: '借款名称', width:150}
                ,{field: 'bzname', title: '标种名称', width:150}
                ,{field: 'money', title: '申请金额', width:150}
                ,{field: 'term', title: '借款期限', width:150,templet:'<div>{{term(d.term)}}</div>'}
                ,{field: 'nprofit', title: '年利率', width:150,templet:'<div>{{nprofit(d.nprofit)}}</div>'}
                ,{field: 'way', title: '收益方式', width:150,templet:'<div>{{sway(d.way)}}</div>'}
                ,{field: 'deadline', title: '截止时间', width:150}
                ,{field: 'ckstatus', title: '审核状态', width:150,templet:'<div>{{borrowapplyType(d.ckstatus)}}</div>'}
                ,{fixed: 'right', width: 230, align:'center', toolbar: '#barDemo'}
            ]]
            //表头
        });

        //监听工具条
        table.on('tool(demo)', function(obj){ //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
            var data = obj.data //获得当前行数据
                ,layEvent = obj.event; //获得 lay-event 对应的值
            if(layEvent === 'hkjh'){
                if(data.ckstatus!=4){
                    return layer.msg('未投满');
                }
                layer.open({
                    type: 1,
                    title:'还款计划',
                    offset:['100px'],
                    area: ['700px', '450px'],
                    fixed: false, //不固定
                    maxmin: true,
                    skin: '',
                    content: $("#huankuanview")
                });
                table.render({
                    elem: '#hkjh'
                    , height: 500
                    , url: '/hkb/data/json/pager'
                    , where: {'baid':data.baid}
                    , page: true
                    , limit: 10
                    , response: {
                        statusName: 'status'
                        , statusCode: 0
                        , msgName: 'message'
                        , countName: 'total'
                        , dataName: 'rows'
                    }
                    ,cols: [[
                        {field:'rname', title:'真实姓名', width:90}
                        ,{field:'rnum', title:'已还期数', width:90}
                        ,{field:'tnum', title:'总期数', width:90}
                        ,{field:'ytime', title:'应还时间', width:120}
                        ,{field:'rtime', title:'实还时间', width:90}
                        ,{field:'ybx', title:'应还本息', width:90}
                        ,{field:'rbx', title:'已还本息', width:60}
                        ,{field:'ybj', title:'应还本金', width:60}
                        ,{field:'rbj', title:'已还本金', width:60}
                        ,{field:'ylx', title:'应还利息', width:60}
                        ,{field:'rlx', title:'已还利息', width:60}
                        ,{field:'yfc', title:'应还罚息', width:60}
                        ,{field:'rfc', title:'已还罚息', width:60}
                        ,{field:'yucount', title:'逾期次数', width:60}
                        ,{field:'status', title:'还款状态', width:60,templet: '<div>{{hkbStatus(d.status)}}</div>'}
                    ]]
                    //表头
                });
            } else if(layEvent === 'tzlb'){
                layer.open({
                    type: 1,
                    title:'投资列表',
                    area: ['700px', '390px'],
                    fixed: false, //不固定
                    maxmin: true,
                    skin: '',
                    content: $("#touziliebiao")
                });
                table.render({
                    elem: '#tzlb'
                    , url: '/tzb/data/json/tzpager'
                    , where: {'baid':data.baid}
                    , page: true
                    , limit: 10
                    , response: {
                        statusName: 'status'
                        , statusCode: 0
                        , msgName: 'message'
                        , countName: 'total'
                        , dataName: 'rows'
                    }
                    ,cols: [[
                        {field:'rname', title:'真实姓名', width:180}
                        ,{field:'money', title:'投资金额', width:170}
                        ,{field:'tztime', title:'投资时间', width:180}
                        ,{fixed: 'right', width: 165, align:'center', toolbar: '#tzlbDemo'}
                    ]]
                    //表头
                });
                table.on('tool(tzlb)', function(obj){
                    var data = obj.data,
                        layEvent = obj.event;
                    if(layEvent === 'detail'){
                        axios.get('/borrowapply/data/json/isSkb?baid=' + data.baid).then((response) => {
                            if (response.data.code == 1) {
                                return alert(response.data.message);
                            }
                            layer.open({
                                type: 1,
                                title: '用户收益',
                                area: ['700px', '450px'],
                                fixed: false, //不固定
                                maxmin: true,
                                closeBtn: 1,
                                content: $("#yonghushouyi")
                            });
                            table.render({
                                elem: '#yhsy'
                                , height: 500
                                , url: '/skb/data/json/list' //数据接口
                                , where: {'uid': data.uid, 'baid': data.baid}
                                , page: true //开启分页
                                , limit: 10//每页显示多少个
                                //后台Pager响应对象 不要动
                                , response: {
                                    statusName: 'status'
                                    , statusCode: 0
                                    , msgName: 'message'
                                    , countName: 'total'
                                    , dataName: 'rows'
                                }
                                , cols: [[
                                    {field: 'ylx', title: '应收利息', width: 100}
                                    , {field: 'rlx', title: '已收利息', width: 100}
                                    , {field: 'ybj', title: '应收本金', width: 150}
                                    , {field: 'rbj', title: '已收本金', width: 120}
                                    , {field: 'ybx', title: '应收本息', width: 100, sort: true}
                                    , {field: 'rbx', title: '已收本息', width: 110}
                                    , {field: 'sktime', title: '收款时间', width: 180}
                                ]]
                                //表头
                            });
                        });
                    }
                });
            } else if(layEvent === 'sh'){
                if(data.ckstatus==0 || data.ckstatus==1){
                    layer.open({
                        type: 1,
                        title: '审核理由',
                        shadeClose: true,
                        shade: 0.8,
                        area: ['440px', '70%'],
                        btn:'确定',
                        content: $("#liyou"),
                        yes:function(index){
                            layer.close(index);
                            vue.shborrow.baid=data.baid;
                            vue.shborrow.isok = status;
                            if(vue.shborrow.excuse==''){
                                layer.msg("请填写理由");
                                return;
                            }
                            vue.shborrow.isok=$('input:radio[name="status"]:checked').val();
                            axios.post('/shborrow/data/json/save', Qs.stringify(vue.shborrow)).then((response)=>{
                                layer.msg(response.data.message);
                                vue.shborrow.excuse='';
                                table.reload("borrowapply");
                            },(error)=>{

                            });
                        }
                    });
                }else{
                   layer.msg('已审核');
                }
            }
        });
    });

    function term(value) {
        return value+'个月';
    }

    function nprofit(value) {
        return value+"%";
    }


</script>
</html>
