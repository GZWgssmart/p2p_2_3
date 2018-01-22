<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%
    String path = request.getContextPath();
%>
<html>
<head>
    <title>所有角色</title>
    <!--引入css文件-->
    <%@include file="role-head.jsp" %>
</head>
<body>
<div id="app">

    <div class="layui-row">
        <div class="layui-col-xs6">
            <div>
                <shiro:hasPermission name="role:add">
                    <button class="layui-btn" @click="showAddRole">添加角色</button>
                </shiro:hasPermission>
                <shiro:hasPermission name="role:add">
                    <button class="layui-btn" @click="showAddRoleDep">添加部门</button>
                </shiro:hasPermission>
                <shiro:hasPermission name="roleJur:saveRoleJur">
                    <button class="layui-btn" @click="showRoleJur">角色分配</button>
                </shiro:hasPermission>
            </div>
            <!--角色zTree的显示容器-->
            <div>
                <ul id="roleTree" class="ztree" style="width:auto; overflow:auto;"></ul>
            </div>
        </div>
        <div class="layui-col-xs6">
            <!--详情-->
            <div style="width: 90%;">
                <div style="text-align: center;"><h3>角色详情</h3></div>
                <form class="layui-form">
                    <div class="layui-form-item">
                        <label class="layui-form-label">角色名称：</label>
                        <label class="layui-form-label" v-model="roleDel"
                               style="color: #00a0e9">{{roleDel.rname}}</label>
                    </div>

                    <div class="layui-form-item">
                        <label class="layui-form-label">角色描述：</label>
                        <label class="layui-form-label" v-model="roleDel"
                               style="color: #00a0e9">{{roleDel.content}}</label>
                    </div>

                    <div class="layui-form-item">
                        <label class="layui-form-label">所属部门：</label>
                        <label class="layui-form-label" v-model="roleDel" style="color: #00a0e9">{{roleDel.dep}}</label>
                    </div>

                    <div class="layui-form-item">
                        <label class="layui-form-label">权限配置：</label>
                        <!--权限树的显示容器-->
                        <ul id="roleDelJurTree" disabled="true" class="ztree"
                            style="width:auto; height: 100px; overflow:auto;"></ul>
                    </div>
                </form>
                <div>
                    <shiro:hasPermission name="role:update">
                        <button class="layui-btn" @click="showEditRole">修改详情</button>
                    </shiro:hasPermission>
                </div>
            </div>
        </div>
    </div>


    <!--添加角色窗口-->
    <div id="addWin" style="display: none">
        <form class="layui-form">
            <div class="layui-form-item">
                <label class="layui-form-label">角色名称</label>
                <div class="layui-input-block">
                    <input type="text" v-model="role.rname" lay-verify="required" placeholder="请输入角色名称"
                           autocomplete="off" class="layui-input">
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">角色描述</label>
                <div class="layui-input-block">
                    <input type="text" v-model="role.content" lay-verify="required" placeholder="请输入角色描述"
                           autocomplete="off" class="layui-input">
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">所属部门</label>
                <!--角色部门的显示容器-->
                <ul id="roleDepTree" class="ztree" style="width:auto; height: 100px; overflow:auto;"></ul>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">权限配置</label>
                <!--权限树的显示容器-->
                <ul id="roleJurTree" class="ztree" style="width:auto; height: 100px; overflow:auto;"></ul>
            </div>

            <div class="layui-form-item">
                <div class="layui-input-block">
                    <button class="layui-btn" lay-submit lay-filter="save" @click="save">保存</button>
                    <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                </div>
            </div>

        </form>
    </div>


    <!--添加部门窗口-->
    <div id="addDepWin" style="display: none">
        <form class="layui-form">

            <div class="layui-form-item">
                <label class="layui-form-label">部门名称</label>
                <div class="layui-input-block">
                    <input type="text" v-model="role.rname" lay-verify="required" placeholder="请输入角色名称"
                           autocomplete="off" class="layui-input">
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">部门描述</label>
                <div class="layui-input-block">
                    <input type="text" v-model="role.content" required lay-verify="required" placeholder="请输入部门描述"
                           autocomplete="off" class="layui-input">
                </div>
            </div>

            <div class="layui-form-item">
                <div class="layui-input-block">
                    <button class="layui-btn" lay-submit lay-filter="saveDep" @click="saveDep">保存</button>
                    <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                </div>
            </div>

        </form>
    </div>

    <!--用户角色分配窗口-->
    <div id="roleJurWin" style="display: none">
        <form class="layui-form">

            <div class="layui-form-item">
                <div class="layui-input-block">
                    <input type="hidden" v-model="roleUserVO.roleString" required lay-verify="required"
                           placeholder="请输入角色名称"
                           autocomplete="off" class="layui-input">
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">请勾选用户</label>
                <!--角色树的显示容器-->
                <ul id="roleUserTree" class="ztree" style="width:auto; height: 100px; overflow:auto;"></ul>
            </div>

            <div class="layui-form-item">
                <div class="layui-input-block">
                    <button class="layui-btn" lay-submit lay-filter="saveRoleUser" @click="saveRoleUser">保存</button>
                    <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                </div>
            </div>

        </form>
    </div>

    <!--编辑角色窗口-->
    <div id="editWin" style="display: none">
        <form class="layui-form">
            <div class="layui-form-item">
                <label class="layui-form-label">角色名称</label>
                <div class="layui-input-block">
                    <input type="text" v-model="role.rname" lay-verify="required" placeholder="请输入角色名称"
                           autocomplete="off" class="layui-input">
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">角色描述</label>
                <div class="layui-input-block">
                    <input type="text" v-model="role.content" lay-verify="required" placeholder="请输入角色描述"
                           autocomplete="off" class="layui-input">
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">当前所属部门</label>
                <div class="layui-input-block">
                    <input type="text" disabled v-model="roleDel.dep" lay-verify="required" placeholder=""
                           autocomplete="off" class="layui-input">
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">更改部门</label>
                <div class="layui-input-block">
                    <!--角色部门的显示容器-->
                    <ul id="updateRoleDepTree" class="ztree" style="width:auto; height: 100px; overflow:auto;"></ul>
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">权限配置</label>
                <a class="layui-btn layui-btn-xs" style="margin-left: 5%;" @click="showJur">添加权限</a>
                <!--权限树的显示容器-->
                <ul id="editRoleJurTree" class="ztree" style="width:150px; height: 100px; overflow:auto;"></ul>
            </div>

            <div class="layui-form-item">
                <div class="layui-input-block">
                    <button class="layui-btn" lay-submit lay-filter="updateRole" @click="updateRole">保存</button>
                    <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                </div>
            </div>

        </form>
    </div>

    <!--权限分配-->
    <div id="jurWin" style="display: none">
        <div class="layui-form-item">
            <label class="layui-form-label">请勾选需要的权限</label>
            <%--<button class="layui-btn layui-btn-normal layui-btn-xs" lay-filter="formDemo" @click="saveJurIds">确定</button>--%>
            <!--权限树的显示容器-->
            <ul id="jurTree" class="ztree" style="width:auto; height: auto; overflow:auto;"></ul>
        </div>
    </div>
</div>
</body>
<!--引入js文件-->
<%@include file="role-foot.jsp" %>
<script type="text/javascript">
    var vue = new Vue({
        el: "#app",
        data: {
            role: {
                rid: '',
                rname: '',
                content: '',
                pid: ''
            },
            roleDel: {
                rid: '',
                rname: '',
                content: '',
                dep: '',
                jur: ''
            },
            roleJurVO: {
                rid: '',
                rname: '',
                content: '',
                pid: '',
                jurString: ''
            },
            roleUserVO: {
                roleString: '',
                userString: ''
            },
            jurIds: '',
            isok:''
        },
        created() {
            //初始化树
            initTreeRole();
        },
        methods: {
            save: function () {
                this.roleJurVO.pid = this.role.pid;
                this.roleJurVO.content = this.role.content;
                this.roleJurVO.rname = this.role.rname;
                if (this.role.pid.length != 0) {
                    form.on('submit(save)', function(data){
                        axios.post('/role/data/json/save', Qs.stringify(vue.roleJurVO)).then((response) => {
                            layer.msg(response.data.message);
                        }, (error) => {
                            layer.alert("请求失败");
                        });
                    });
                } else {
                    layer.alert("请选择部门");
                }
            },
            showAddRole: function () {
                showAddRole();
            },
            showAddRoleDep: function () {
                showAddDep();
            },
            saveDep: function () {
                this.role.rid = 0;
                form.on('submit(saveDep)', function(data){
                    axios.post('/role/data/json/save', Qs.stringify(vue.role)).then((response) => {
                        layer.msg(response.data.message);
                    }, (error) => {
                        layer.alert("请求失败");
                    });
                });
            },
            showRoleJur: function () {
                var nodesRole = nodeOnCheck();
                var roleString = '';
                if (nodesRole.length > 0) {
                    for (var i = 0; i < nodesRole.length; i++) {
                        if (nodesRole[i].pid != '') {
                            roleString += nodesRole[i].rid + ',';
                        }
                    }
                    this.roleUserVO.roleString = roleString;
                    showRoleUser();
                } else {
                    layer.alert('请选择一个或多个角色');
                }
            },
            saveRoleUser: function () {
                var userString = '';
                var nodesUser = userOnCheck();
                if (nodesUser.length > 0) {
                    for (var i = 0; i < nodesUser.length; i++) {
                        userString += nodesUser[i].huid + ',';
                    }
                    this.roleUserVO.userString = userString;
                    //验证通过
                    form.on('submit(saveRoleUser)', function(data){
                        axios.post('/roleUser/data/json/saveRoleUser', Qs.stringify(vue.roleUserVO)).then((response) => {
                            layer.msg("添加成功");
                        }, (error) => {
                            layer.alert("请求失败");
                        });
                    });
                } else {
                    layer.alert('请选择一个或多个用户');
                }
            },
            showEditRole: function () {
                if (this.role.rid == '') {
                    layer.alert("请点击某个角色");
                } else {
                    showEditRole();
                }
            },
            updateRole: function () {
                vue.roleJurVO.rid = this.role.rid;
                vue.roleJurVO.pid = this.role.pid;
                vue.roleJurVO.content = this.role.content;
                vue.roleJurVO.rname = this.role.rname;
                vue.roleJurVO.jurString = this.jurIds;
                //监听提交，一致通过验证
                form.on('submit(updateRole)', function (data) {
                    axios.post('/role/data/json/update', Qs.stringify(vue.roleJurVO))
                        .then((response) => {
                            layer.msg(response.data.message);
                        }, (error) => {
                            layer.alert("请求失败");
                        });
                });
            },
            showJur: function () {
                showJur();
            },
            saveJurIds: function () {
//                layer.msg(1);
            }
        }
    });

</script>
</html>
