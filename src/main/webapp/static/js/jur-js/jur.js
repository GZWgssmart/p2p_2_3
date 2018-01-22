/**
 * @author ye
 * 权限js文件
 */
//初始化layui,Vue
var nodesList;
$(function () {
    var form;
    var vue = new Vue({
        el:"#appJur",
        data:{
            jur:[],
            filePath:''
        },
        created () {
        },
        methods:{
            update:function () {
                form.on('submit(update)', function(data){
                    axios.post('/jur/data/json/updateJur', Qs.stringify(vue.jur))
                        .then((response)=>{
                            layer.msg(response.data.message);
                            window.location.reload();
                        },(error)=>{
                            layer.alert("请求失败");
                        });
                });
            },
            saveRoleJur:function () {
                if (nodeOnCheck().length == 0){
                    layer.msg('请选择权限');
                }else {
                    var list = this.jur.jid+","+nodeOnCheck();
                    var params = new URLSearchParams();
                    params.append('nodeList', list);
                        axios.post('/roleJur/data/json/saveRoleJur',params).then((response)=>{
                            layer.msg(response.data.message);
                            window.location.reload();
                        },(error)=>{
                            layer.alert("请求失败");
                        });
                }
            },
            getExcelPath:function () {
                vue.jur.jurl = $("input[name='file']").val();
                if (vue.jur.jurl.length<=0){
                    layer.alert("请选择文件");
                    return;
                }
                layer.msg('初始化将清空当前所有信息，用户将失去相关权限，是否继续？10s后自动取消', {
                    time: 10000, //10s后自动关闭
                    btn: ['是的', '取消'],
                    yes:function(){
                        layer.load();
                        axios.post('/jur/data/json/initJur', Qs.stringify(vue.jur)).then((response)=>{
                            layer.msg(response.data.message);
                            layer.closeAll();
                            window.location.reload();
                        },(error)=>{
                            layer.alert("请求失败");
                        });
                    },
                    btn2: function () {
                        layer.msg('已取消');
                    }
                });
            }
        }
    });

    layui.use(['layer', 'laypage', 'table', 'upload','element','form'], function(){
        var layer = layui.layer
            ,laypage = layui.laypage //分页
            ,layer = layui.layer //弹层
            ,table = layui.table //表格
            ,upload = layui.upload
            ,element = layui.element; //元素操作
        form = layui.form;
        table.render({
            elem: '#jurs'
            ,id:'jurTB'
            ,height: 450
            ,url: '/jur/data/json/pager/' //数据接口
            ,page: true //开启分页
            ,limit:10//每页显示多少个
            ,response: {
                statusName: 'status'
                ,statusCode: 0
                ,msgName: 'message'
                ,countName: 'total'
                ,dataName: 'rows'
            }
            ,cols: [[ //表头
                {field: 'jurl', title: '权限url', width:500}
                ,{field: 'content', title: '描述', width:300}
                ,{title:'操作', fixed: 'right', width: 305, align:'center', toolbar: '#barJur'}
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
        upload.render({ //允许上传的文件后缀
            elem: '#uploadExcel'
            ,url: ''
            ,auto: false
            ,accept: 'file' //普通文件
            ,exts: 'xls|xlsx' //只允许上传压缩文件
        });
    });

    /**
     * 初始化树，动态加载数据
     * 角色
     */
    function initDisTreeRole() {
        var roleNodes =[];
        var setting = {
            async:{
                enable:true,
                type:"get",
                url:"/role/data/json/all"
            },
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
        $(document).ready(function(){
            $.fn.zTree.init($("#roleTree"), setting);
        });
    }
});

//弹出页面：初始化权限
function showInitJur() {
    layer.open({
        type: 1,
        title:'初始化权限',
        area: ['500px', '300px'],
        fixed: false, //不固定
        maxmin: true,
        closeBtn: 1,
        skin: '',
        content: $("#jurInitWin")
    });
}

/**
 * 获取选中的角色
 * @param event
 * @param treeId
 * @param treeNode
 */
function nodeOnCheck(event, treeId, treeNode) {
    nodesList="";
    var treeObj = $.fn.zTree.getZTreeObj("roleTree");
    var nodes = treeObj.getCheckedNodes(true);//获取选中的个数
    for (var i =1; i <nodes.length; i++){
            if(nodesList==null){
                nodesList+=nodes[i].rid+',';
            }else{
                nodesList+=nodes[i].rid+",";
            }
    }
    return nodesList;
};

