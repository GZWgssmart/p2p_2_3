/**
 * @author ye
 * 角色页面的js
 */

var roleObj = {"rid":"", "pid":"", "rname":"", "nodeNum":"", "content":""};

/**
 * 节点名称修改回调函数
 * @param event
 * @param treeId
 * @param treeNode
 * @param isCancel
 */
function zTreeOnRename(event, treeId, treeNode, isCancel) {
    var rname = treeNode;
    if (!rname.length==0){
        //若修改后的名称不为空，则发送请求
        var params = new URLSearchParams();
        params.append('rid', treeId.rid);
        params.append('pid', treeId.pid);
        params.append('rname', treeNode);
        params.append('content', treeId.content);
        axios.post('/role/data/json/update', params)
            .then((response)=>{
                layer.msg(response.data.message);
        },(error)=>{
                layer.msg("请求失败");
        });
    }else {
        //修改失败
        layer.msg("修改失败");
    }
}
/**
 * 添加自定义节点按钮
 * @param treeId
 * @param treeNode
 */
function addHoverDom(treeId, treeNode) {
};

/**
 * 鼠标移开，隐藏按钮
 * @param treeId
 * @param treeNode
 */
function removeHoverDom(treeId, treeNode) {
    $("#diyBtn_"+treeNode.id).unbind().remove();
    $("#diyBtn_space_" +treeNode.id).unbind().remove();
    // $("#addBtn_"+treeNode.id).unbind().remove();
};
/**
 * 是否可以编辑
 * @param treeId
 * @param treeNode
 * @returns {boolean}
 */
function zTreeBeforeEditName(treeId, treeNode) {
    return true;//设置为true,可编辑
}

/**
 * 是否可以删除节点回调函数
 * @param treeId
 * @param treeNode
 * @returns {boolean}
 */
function zTreeBeforeRemove(treeId, treeNode) {
    layer.msg('你确定要删除角色：'+'“'+treeNode.rname+'”'+' 吗？删除后拥有该角色的用户将失去该身份及相关权限！', {
        time: 0 //不自动关闭
        ,btn: ['是的', '取消']
        ,yes: function(index){
                var params = new URLSearchParams();
                params.append('rid', treeNode.rid);
                axios.post(' /role/data/json/delete',params)
                    .then((response)=>{
                        layer.msg(response.data.message);
                        vue.roleDel = '';
                        editRoleJurTree('roleDelJurTree', vue.role.rid);
                        initTreeRole();
                    },(error)=>{
                        layer.msg("请求失败");
                    });
            layer.closeAll();
            return true;
        },btn2: function () {
            layer.msg('已取消');
        }
    });
    return false;
}

/**
 * commbox状态改变回调函数
 * @param event
 * @param treeId
 * @param roleNodes
 */
function nodeOnCheck(event, treeId, roleNodes) {
    var treeObj = $.fn.zTree.getZTreeObj("roleTree");
    var checked = treeObj.getCheckedNodes(true);//获取选中的个数
    return checked;
}

/**
 * 节点触发事件
 * @param event
 * @param treeId    id
 * @param treeNode jsonObj
 */
function zTreeOnClick(event, treeId, treeNode) {
    var treeObj = $.fn.zTree.getZTreeObj(treeId);
    var sNodes = treeObj.getSelectedNodes();
    if (sNodes.length > 0) {
        //获取当前被选中的节点的父节点
        var parentNode = sNodes[0].getParentNode();
    }
    // 获取当前被选中的父节点名称
    if (null != parentNode){
        var parentNodeName=parentNode.rname;
        vue.roleDel.dep = parentNodeName;
        vue.roleDel.rname = treeNode.rname;
        vue.roleDel.content = treeNode.content;
        vue.role.rname = treeNode.rname;
        vue.role.content = treeNode.content;
        vue.role.rid = treeNode.rid;
    }
    //初始化树,角色权限
    editRoleJurTree('roleDelJurTree', vue.role.rid);
};

/**
 * 初始化树，动态加载数据
 * 角色
 */
function initTreeRole() {
    var roleNodes =[];
    var setting = {
        view: {
            dblClickExpand: false,
            showLine: true,
            selectedMulti: false,
            addHoverDom: addHoverDom,
            removeHoverDom: removeHoverDom
        },
        edit: {
            enable: true,
            editNameSelectAll: true,// 节点编辑名称 input 初次显示时,设置 txt 内容是否为全选状态。
            removeTitle:"删除",       // 删除按钮的 Title 辅助信息
            renameTitle:"重命名"       // 编辑名称按钮的 Title 辅助信息。
        },
        data: {
            key: {
                name : "rname",
                content:"content"
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
            onClick: zTreeOnClick,
            //勾选框状态改变事件
            onCheck:nodeOnCheck,
            //节点名称修改回调函数
            beforeRename: zTreeOnRename,
            // 用于捕获节点编辑按钮的 click 事件，并且根据返回值确定是否允许进入名称编辑状态
            beforeEditName: zTreeBeforeEditName,
            //用于捕获节点被删除之前的事件回调函数，并且根据返回值确定是否允许删除操作
            beforeRemove: zTreeBeforeRemove
        },
        check: {
            enable: true,
            chkStyle: "checkbox",
            chkboxType: { "Y" : "ps", "N" : "ps" }
            // chkStyle: "radio",  //单选框
            // radioType: "all"   //对所有节点设置单选
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
