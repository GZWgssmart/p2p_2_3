/**
 * @author ye
 * 权限js文件
 */
//初始化layui,Vue
var nodesObj = {"rjid":"", "rid":"", "jid":""};
var nodesList = [];
$(function () {
    var vue = new Vue({
        el:"#appJur",
        data:{
            jur:[]
        },
        created () {
        },
        methods:{
            update:function () {
                axios.post('/jur/data/json/updateJur', Qs.stringify(this.jur))
                    .then((response)=>{
                        layer.msg(response.data.message);
                        window.location.reload();
                        // layer.closeAll();
                    },(error)=>{
                        layer.alert("请求失败");
                    });
            },
            saveRoleJur:function () {
                // for (var x = 0; x < nodeOnCheck().length; x++){
                //     nodeOnCheck()[x].jid = this.jur.jid;
                // }
                console.log(nodeOnCheck());
                // axios.post('/roleJur/data/json/saveRoleJur',Qs.stringify(nodeOnCheck()))
                //     .then((response)=>{
                //         layer.msg(response.data.message);
                //         layer.closeAll();
                //     },(error)=>{
                //         layer.alert("请求失败");
                //     });
            }
        }
    });

    layui.use(['layer', 'laypage', 'table', 'element'], function(){
        var layer = layui.layer
            ,laypage = layui.laypage //分页
            ,layer = layui.layer //弹层
            ,table = layui.table //表格
            ,element = layui.element; //元素操作
        table.render({
            elem: '#jurs'
            ,height: 332
            ,url: '/jur/data/json/pager/' //数据接口
            ,page: true //开启分页
            ,limit:5//每页显示多少个
            ,response: {
                statusName: 'status'
                ,statusCode: 0
                ,msgName: 'message'
                ,countName: 'total'
                ,dataName: 'rows'
            }
            ,cols: [[ //表头
                {field: 'jid', title: 'ID', width:80, sort: true, fixed: 'left'}
                ,{field: 'jurl', title: '权限url', width:150}
                ,{field: 'content', title: '描述', width:150}
                ,{title:'操作', fixed: 'right', width: 165, align:'center', toolbar: '#barJur'}
            ]]
        });
        table.on('tool(jur)', function(obj){
            //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
            var data = obj.data //获得当前行数据
                ,layEvent = obj.event; //获得 lay-event 对应的值
            if(layEvent === 'edit'){
                layer.open({
                    type: 1,
                    title:'编辑权限',
                    area: ['700px', '450px'],
                    fixed: false, //不固定
                    maxmin: true,
                    closeBtn: 1,
                    skin: '',
                    content: $("#editWin")
                });
                vue.jur = data;
            }else if (layEvent === 'distr'){
                layer.open({
                    type: 1,
                    title:'权限分配',
                    area: ['700px', '450px'],
                    fixed: false, //不固定
                    maxmin: true,
                    closeBtn: 1,
                    skin: '',
                    content: $("#distrWin")
                });
                vue.jur = data;
                //初始化树
                initDisTreeRole();
            }
        });
    });

    /**
     * 初始化树，动态加载数据
     */
    function initDisTreeRole() {
        var roleNodes =[];
        var setting = {
            view: {
                dblClickExpand: false,
                showLine: true,
                selectedMulti: false
            },
            edit: {
                enable: true
            },
            data: {
                key: {
                    name : "rname",
                    content:"con"
                },
                simpleData: {
                    enable:true,
                    idKey: "rid",
                    pIdKey: "pid",
                    rootPId: ""
                }
            },
            callback: {
                //点击节点触发事件
                // onClick: zTreeOnClick,
                //勾选框状态改变事件
                onCheck:nodeOnCheck
                //节点名称修改回调函数
                // beforeRename: zTreeOnRename,
                // 用于捕获节点编辑按钮的 click 事件，并且根据返回值确定是否允许进入名称编辑状态
                // beforeEditName: zTreeBeforeEditName,
                //用于捕获节点被删除之前的事件回调函数，并且根据返回值确定是否允许删除操作
                // beforeRemove: zTreeBeforeRemove
            },
            check: {
                enable: true,
                chkStyle: "checkbox",
                chkboxType: { "Y" : "ps", "N" : "ps" },
            }
        };
        // roleNodes = [{"rid":1,"pid":0,"rname":"角色","content":"aa"},{"rid":2,"pid":1,"rname":"角色0","content":"aa"}]
        $(document).ready(function(){
            var tree = $("#roleTree");
            axios.get(' /role/data/json/all', {
            }).then((response)=>{
                roleNodes = response.data
                tree = $.fn.zTree.init(tree, setting, roleNodes);
            },(error)=>{
                alert(error);
            });
        });
    }
});

/**
 * 获取选中的角色
 * @param event
 * @param treeId
 * @param treeNode
 */
function nodeOnCheck(event, treeId, treeNode) {
    var treeObj = $.fn.zTree.getZTreeObj("roleTree");
    var nodes = treeObj.getCheckedNodes(true);//获取选中的个数
    for (var i = 0; i < nodes.length; i++){
        if (!nodes[i].pid == ""){
            nodesObj.rid = nodes[i].rid;
            nodesList.push(nodesObj);
        }
    }
    return nodesList;
};

