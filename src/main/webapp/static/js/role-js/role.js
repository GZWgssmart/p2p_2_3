/**
 * 角色页面的js
 */
var contextPath = "";


/**
 *获取所有role
 */
function getRoles() {
    return axios.get(contextPath+"/role/data/json/all");
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
 * 点击tree,回调函数
 * @param zNodes
 */
function zTreeOnClick(event, treeId, roleNodes) {
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
    // var Unchecked = treeObj.getCheckedNodes(false);
    getNodes(checked.length);
}


/**
 * 初始化树，动态加载数据
 */
function initTreeRole() {
    var setting = {
        view: {
            dblClickExpand: false,
            showLine: true,
            selectedMulti: false
        },
        data: {
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
            onCheck:nodeOnCheck
        },
        check: {
            enable: true,
            chkStyle: "checkbox",
            chkboxType: { "Y" : "s", "N" : "s" }
        }
    };

    var roleNodes =[
        {id:1, pId:0, name:"角色", open:true}
    ];


    $(document).ready(function(){
        var tree = $("#roleTree");
        tree = $.fn.zTree.init(tree, setting, roleNodes);
    });
}
