/**
 * @author ye
 * 权限js文件
 */
//初始化layui,Vue
var nodesList;
$(function () {
    var vue = new Vue({
        el: "#appTicket",
        data: {
            ticket: {}
        },
        created() {
        },
        methods: {
            updateTicket: function () {
                vue.ticket.type = $('input:radio[name="type"]:checked').val();
                vue.ticket.isvip = $('input:radio[name="isvip"]:checked').val();
                vue.ticket.tktime = $('#tktime').val();
                form.on('submit(updateTicket)', function (data) {
                    axios.post('/ticket/data/json/updateTicket', Qs.stringify(vue.ticket))
                        .then((response) => {
                            layer.msg(response.data.message);
                          window.location.reload();
                        }, (error) => {
                            layer.alert("请求失败");
                        });
                });
            }
            ,saveTicket:function () {
                vue.ticket.type = $('input:radio[name="type"]:checked').val();
                vue.ticket.isvip = $('input:radio[name="isvip"]:checked').val();
                vue.ticket.tktime = $('#tktime').val();
                form.on('submit(saveTicket)', function (data) {
                    axios.post('/ticket/data/json/saveTicket', Qs.stringify(vue.ticket))
                        .then((response) => {
                           window.location.href="/back/ticket/pager"
                        }, (error) => {
                            layer.alert("请求失败");
                        });
                });
            }
        }
    });

    layui.use(['layer', 'laypage', 'table', 'element', 'laydate'], function () {
        var layer = layui.layer
            , laypage = layui.laypage //分页
            , layer = layui.layer //弹层
            , table = layui.table //表格
            , laydate = layui.laydate
            , element = layui.element; //元素操作
        table.render({
            elem: '#ticketID'
            , id: 'ticketId'
            , height: 450
            , url: '/ticket/data/json/pagerTicket' //数据接口
            , page: true //开启分页
            , limit: 10//每页显示多少个
            , response: {
                statusName: 'status'
                , statusCode: 0
                , msgName: 'message'
                , countName: 'total'
                , dataName: 'rows'
            }
            , cols: [[ //表头
                {field: 'name', title: '券名称', width: 170}
                , {field: 'type', title: '类型', width: 150, templet: '<div>{{type(d.type)}}</div>'}
                , {field: 'tkmoney', title: '价值（元）', width: 150}
                , {field: 'tnum', title: '数量（张）', width: 150}
                , {field: 'isvip', title: '是否VIP专享', width: 150, templet: '<div>{{isvip(d.isvip)}}</div>'}
                , {field: 'tktime', title: '有效时间', width: 200}
                , {title: '操作', fixed: 'right', width: 165, align: 'center', toolbar: '#barTicket'}
            ]]
        });
        laydate.render({
            elem: '#tktime' //指定元素
            , type: 'datetime'
        });
        table.on('tool(ticket-filter)', function (obj) {
            //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
            var data = obj.data //获得当前行数据
                , layEvent = obj.event; //获得 lay-event 对应的值
            vue.ticket = data;
            if (layEvent === 'edit') {
                layer.open({
                    type: 1,
                    title: '编辑券信息',
                    area: ['700px', '450px'],
                    fixed: false, //不固定
                    maxmin: true,
                    closeBtn: 1,
                    skin: '',
                    content: $("#editTicketWin")
                });
            }else if (layEvent == 'del'){
                layer.msg('您确定要删除“'+vue.ticket.name+'”吗？10s后自动取消', {
                    time: 10000, //10s后自动关闭
                    btn: ['是的', '取消'],
                    yes:function(){
                        axios.post('/ticket/data/json/deleteTicket', Qs.stringify(vue.ticket))
                            .then((response) => {
                                layer.msg(response.data.message);
                                window.location.reload();
                            }, (error) => {
                                layer.alert("请求失败");
                            });
                    },
                    btn2: function () {
                        layer.msg('已取消');
                    }
                });
            }
        });
    });
});

function isvip(value) {
    if (value == 0) {
        return '<img src="/static/uploads/user/hui.png"/>';
    } else if (value == 1) {
        return '<img src="/static/uploads/user/liang.png"/>';
    }
}

function type(value) {
    if (value == 1) {
        return '现金卷';
    } else if (value == 0) {
        return '代金券';
    }
}
