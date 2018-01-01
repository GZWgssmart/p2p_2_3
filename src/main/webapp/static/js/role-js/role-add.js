/**
 * @author ye
 */
//初始化layui
$(function () {
    layui.use(['layer'], function(){
        var layer = layui.layer;
    });
})

//弹出页面
function showAddRole() {
    layer.open({
        type: 1,
        title:'添加角色',
        area: ['700px', '450px'],
        fixed: false, //不固定
        maxmin: true,
        closeBtn: 1,
        skin: '',
        content: $("#addWin")
    });
    //初始化树
    initRoleDepTree();
}


function depOnCheck(event, treeId, roleNodes) {
    var treeObj = $.fn.zTree.getZTreeObj("roleDepTree");
    var checked = treeObj.getCheckedNodes(true);//获取选中的个数
    if (roleNodes.rid !=  null){
        vue.role.pid = roleNodes.rid
    }else {
        layer.msg("请选择部门");
    }
    return roleObj;
}

/**
 * 初始化树
 */
function initRoleDepTree() {
    var roleNodes =[];
    var setting = {
        view: {
            dblClickExpand: false,
            showLine: true,
            selectedMulti: false,
        },
        edit: {
            enable: false,
        },
        data: {
            key: {
                name : "rname",
                content:"con"
            },
            simpleData: {
                enable:true,
                pIdKey: "pid",
                rootPId: ""
            }
        },
        callback: {
            //点击节点触发事件
            // onClick: zTreeOnClick,
            //勾选框状态改变事件
            onCheck:depOnCheck,
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
            chkboxType: { "Y" : "s", "N" : "s" },
            chkStyle: "radio",  //单选框
            radioType: "all"   //对所有节点设置单选
        }
    };
    $(document).ready(function(){
        var tree = $("#roleDepTree");
        axios.get(' /role/data/json/dep', {
        }).then((response)=>{
            roleNodes = response.data;
            tree = $.fn.zTree.init(tree, setting, roleNodes);
        },(error)=>{
            alert(error);
        });
    });
}

