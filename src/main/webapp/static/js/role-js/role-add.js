/**
 * @author ye
 */
//初始化layui
$(function () {
    layui.use(['layer','form'], function(){
        var layer = layui.layer, form = layui.form;
    });
})

//弹出页面：权限
function showJur() {
    layer.open({
        type: 1,
        title:'权限分配',
        area: ['300px', '200px'],
        fixed: false, //不固定
        maxmin: true,
        closeBtn: 1,
        skin: '',
        content: $("#jurWin")
    });
}

//弹出页面：添加角色
function showAddRole() {
    vue.role.rname = "";
    vue.role.content = ""
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
    vue.roleJurVO.jurString = '';
    //初始化树,角色部门
    initRoleDepTree('roleDepTree');
    //角色权限
    initJurTree('roleJurTree');
}

//弹出页面：添加部门
function showAddDep() {
    vue.role.rname = "";
    vue.role.content = ""
    layer.open({
        type: 1,
        title:'添加部门',
        area: ['700px', '450px'],
        fixed: false, //不固定
        maxmin: true,
        closeBtn: 1,
        skin: '',
        content: $("#addDepWin")
    });
}

//弹出页面：用户角色分配
function showRoleUser() {
    layer.open({
        type: 1,
        title:'角色分配',
        area: ['700px', '450px'],
        fixed: false, //不固定
        maxmin: true,
        closeBtn: 1,
        skin: '',
        content: $("#roleJurWin")
    });
    //初始化用户树
    initRoleUserTree();
}

//弹出页面：编辑角色
function showEditRole() {
    layer.open({
        type: 1,
        title:'编辑角色',
        area: ['700px', '450px'],
        fixed: false, //不固定
        maxmin: true,
        closeBtn: 1,
        skin: '',
        content: $("#editWin")
    });
    vue.jurIds = '';
    //初始化树,角色部门
    initRoleDepTree('updateRoleDepTree');
    //初始化树,角色权限
    editRoleJurTree('editRoleJurTree', vue.role.rid);
    //分配角色权限
    initJurTree('jurTree');
}

/**
 * 部门点击勾选
 * @param event
 * @param treeId
 * @param roleNodes
 */
function depOnCheck(event, treeId, roleNodes) {
    var treeObj = $.fn.zTree.getZTreeObj(treeId);
    var checked = treeObj.getCheckedNodes(true);//获取选中的个数
    if (roleNodes.rid !=  null){
        vue.role.pid = roleNodes.rid
    }else {
        layer.alert("请选择部门");
    }
    console.log(vue.role);
    return roleObj;
}

/**
 * 用户勾选
 * @param event
 * @param treeId
 * @param roleNodes
 */
function userOnCheck(event, treeId, roleNodes) {
    var treeObj = $.fn.zTree.getZTreeObj("roleUserTree");
    var checked = treeObj.getCheckedNodes(true);//获取选中的个数
    return checked;
}

/**
 * 是否可以删除节点回调函数，删除角色的权限
 * @param treeId
 * @param treeNode
 * @returns {boolean}
 */
function jurBeforeRemove(treeId, treeNode) {
    layer.msg('你确定要删除权限：'+'“'+treeNode.content+'”'+' 吗？删除后拥有该角色的用户将失去相关权限！', {
        time: 0 //不自动关闭
        ,btn: ['是的', '取消']
        ,yes: function(index){
            var params = new URLSearchParams();
            params.append('rjid', treeNode.rjid);
            axios.post('/roleJur/data/json/delete',params)
                .then((response)=>{
                    layer.msg(response.data.message);
                    //初始化树,角色权限
                    editRoleJurTree(treeId,vue.role.rid);
                },(error)=>{
                    layer.alert("请求失败");
                });
            return true;
        },btn2: function () {
            layer.msg('已取消');
        }
    });
    return false;
}

/**
 * 是否可以编辑
 * @param treeId
 * @param treeNode
 * @returns {boolean}
 */
function BeforeEditJurName(treeId, treeNode) {
    return false;//设置为true,可编辑
}
/**
 * 鼠标移开，隐藏按钮
 * @param treeId
 * @param treeNode
 */
function removeHoverDomJur(treeId, treeNode) {
    $("#diyBtn_"+treeNode.id).unbind().remove();
    $("#diyBtn_space_" +treeNode.id).unbind().remove();
    // $("#addBtn_"+treeNode.id).unbind().remove();
};
/**
 * 初始化树：用户的权限
 */
function editRoleJurTree(treeId, rid) {
    var roleNodes =[];
    var setting = {
        async:{
            enable:true,
            type:"post",
            url:"/jur/data/json/listJurByRid?rid="+rid
        },
        view: {
            dblClickExpand: false,
            showLine: true,
            selectedMulti: false,
            removeHoverDom: removeHoverDomJur
        },
        edit: {
            enable: true,
            removeTitle:"删除",       // 删除按钮的 Title 辅助信息
        },
        data: {
            key: {
                name : "content"
            },
            simpleData: {
                enable:true,
                pIdKey: "",
                rootPId: "rjid"
            }
        },
        callback: {
            //勾选框状态改变事件
            // onCheck:userOnCheck
            //用于捕获节点被删除之前的事件回调函数，并且根据返回值确定是否允许删除操作
            beforeRemove: jurBeforeRemove,
            beforeEditName: BeforeEditJurName
        },
        check: {
            enable: true,
            chkStyle: "checkbox",
            chkboxType: { "Y" : "s", "N" : "s" },
            chkStyle: "radio",  //单选框
            radioType: "all"   //对所有节点设置单选
        }
    };
    $(document).ready(function () {
        $.fn.zTree.init($("#"+treeId), setting);
    });
}

/**
 * 初始化树：用户
 */
function initRoleUserTree() {
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
                name : "rname"
            },
            simpleData: {
                enable:true,
                pIdKey: "",
                rootPId: "huid"
            }
        },
        callback: {
            //勾选框状态改变事件
            onCheck:userOnCheck
        },
        check: {
            enable: true,
            chkStyle: "checkbox",
            chkboxType: { "Y" : "s", "N" : "s" },
            // chkStyle: "radio",  //单选框
            // radioType: "all"   //对所有节点设置单选
        }
    };
    $(document).ready(function () {
        var tree = $("#roleUserTree");
        axios.get('/admin/data/json/list?page=1&limit=1000', {
        }).then((response)=>{
            roleNodes = response.data.rows;
            tree = $.fn.zTree.init(tree, setting, roleNodes);
        },(error)=>{
            alert(error);
        });
    });
}

/**
 * 初始化树：角色部门
 */
function initRoleDepTree(treeId) {
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
                content:"content"
            },
            simpleData: {
                enable:true,
                pIdKey: "pid",
                rootPId: ""
            }
        },
        callback: {
            //勾选框状态改变事件
            onCheck:depOnCheck,
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
        var tree = $("#"+treeId);
        axios.get('/role/data/json/dep', {
        }).then((response)=>{
            roleNodes = response.data;
            tree = $.fn.zTree.init(tree, setting, roleNodes);
        },(error)=>{
            alert(error);
        });
    });
}

/**
 * 获取选中的权限
 * @param event
 * @param treeId
 * @param treeNode
 */
var nodesList;
function nodeJurOnCheck(event, treeId, treeNode) {
    nodesList="";
    var treeObj = $.fn.zTree.getZTreeObj(treeId);
    var nodes = treeObj.getCheckedNodes(true);//获取选中的个数
    for (var i =0; i <nodes.length; i++){
        if(nodesList==null){
            nodesList+=nodes[i].jid+',';
        }else{
            nodesList+=nodes[i].jid+",";
        }
    }
    vue.roleJurVO.jurString = nodesList;
    vue.jurIds = nodesList;
    return nodesList;
};

/**
 * 初始化树：角色权限
 */
function initJurTree(treeId) {
    var setting = {
        async:{
            enable:true,
            type:"get",
            url:"/jur/data/json/all"
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
                name:"content",
                content:"content"
            },
            simpleData: {
                enable:true,
                idKey: "jid",
                rootPId: ""
            }
        },
        callback: {
            onCheck:nodeJurOnCheck
        },
        check: {
            enable: true,
            chkStyle: "checkbox",
            chkboxType: { "Y" : "ps", "N" : "ps" },
        }
    };
    $(document).ready(function(){
        $.fn.zTree.init($("#"+treeId), setting);
    });
}