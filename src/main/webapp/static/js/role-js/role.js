/**
 * @author叶小鹏
 * 角色页面的js
 */

var roleObj = {"rid":"", "pid":"", "rname":"", "nodeNum":"", "content":""};

function editRole() {
    // var node = roleObj.nodeNum;
    // if (node == 0 || node >1){
    //     alert("请选择一个角色！");
    // }else {
    //
    // }
    // console.log(roleObj);
}

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
        //发送请求
        var params = new URLSearchParams();
        params.append('rid', treeId.rid);
        params.append('pid', treeId.pid);
        params.append('rname', treeNode);
        params.append('content', treeId.content);
        axios.post(' /role/data/json/update', params)
            .then((response)=>{
            // alert(response.data.message);
            //     layui.use(['layer'], function(){
            //         var layer = layui.layer;
            //         layer.msg(response.data.message);
            //     });
                layer.msg(response.data.message);
        },(error)=>{
                layer.msg("请求失败");
        });
    }else {
        //修改失败
        layer.msg("修改失败");
        window.location.reload();
    }
}
/**
 * 添加节点按钮
 * @param treeId
 * @param treeNode
 */
function addHoverDom(treeId, treeNode) {
    // var aObj = $("#" + treeNode.tId + "_a");
    // if ($("#diyBtn_"+treeNode.id).length>0) return;
    // var editStr = "<span id='diyBtn_space_" +treeNode.id+ "' > </span>"
    //     + "<button type='button' class='diyBtn1' id='diyBtn_" + treeNode.id
    //     + "' title='"+treeNode.name+"' onfocus='this.blur();'></button>";
    // aObj.append(editStr);
    var btn = $("#diyBtn_"+treeNode.id);
    if (btn) btn.bind("click", function(){alert("diy Button for " + treeNode.name);});
};
function removeHoverDom(treeId, treeNode) {
    $("#diyBtn_"+treeNode.id).unbind().remove();
    $("#diyBtn_space_" +treeNode.id).unbind().remove();
};
/**
 * 是否可以编辑
 * @param treeId
 * @param treeNode
 * @returns {boolean}
 */
function zTreeBeforeEditName(treeId, treeNode) {
    return true;//设置为true,可编辑
    // return confirm("确认要重命名部门 -- " + treeNode.rname + " 吗？");
}

/**
 * 是否可以删除节点回调函数
 * @param treeId
 * @param treeNode
 * @returns {boolean}
 */
function zTreeBeforeRemove(treeId, treeNode) {
    var isDel = confirm("确认要删除 -- " + treeNode.rname + " 吗？");
    if (isDel){
        var params = new URLSearchParams();
        params.append('rid', treeNode.rid);
        axios.post(' /role/data/json/delete',params)
            .then((response)=>{
                alert(response.data.message);
            },(error)=>{
                alert("请求失败");
            });
        return isDel;
    }else {
        isDel = false;
        return isDel;
    }
}
/**
 * 显示选中的个数
 */
function getNodes(checked) {
    new Vue({
        el:'#nodeTip',
        data:{
            checked:checked,
        }
    })
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
    // console.log(checked[0].content);
    // var Unchecked = treeObj.getCheckedNodes(false);//获取未选中的个数
    // getNodes(checked.length);
    // alert(roleNodes.con);
    // var roleObj = {"rid":roleNodes.rid, "pid":roleNodes.pid, "rname":roleNodes.rname, "nodeNum":checked.length};
    if (checked.length > 0){
        roleObj.rid = checked[0].rid;
        roleObj.pid = checked[0].pid;
        roleObj.rname = checked[0].rname;
        roleObj.content = checked[0].content;
        roleObj.nodeNum = checked.length;
    }else {
        roleObj = {"rid":"", "pid":"", "rname":"", "nodeNum":"", "content":""};
    }
    return roleObj;
}


/**
 * 初始化树，动态加载数据
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
            chkboxType: { "Y" : "s", "N" : "s" },
            chkStyle: "radio",  //单选框
            radioType: "all"   //对所有节点设置单选
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
