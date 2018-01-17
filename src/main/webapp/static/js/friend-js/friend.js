/**
 * @author ye
 * 权限js文件
 */
//初始化layui,Vue
var nodesList;
$(function () {
    var vue = new Vue({
        el: "#appFriend",
        data: {
            friend: {'fid': '', 'furl': '', 'fpic': ''}
        },
        created() {
        },
        methods: {
            updateFriend:function () {
                axios.post('/friend/data/json/update', Qs.stringify(vue.friend)).then((response) => {
                    layer.msg(response.data.message);
                    vue.friend.fpic = '';
                    vue.friend.furl = '';
                    window.location.reload();
                }, (error) => {
                    layer.alert("请求失败");
                });
            },
            saveFriend: function () {
                axios.post('/friend/data/json/save', Qs.stringify(vue.friend)).then((response) => {
                    layer.msg(response.data.message);
                    vue.friend.fpic = '';
                    vue.friend.furl = '';
                    layer.closeAll();
                    window.location.reload();
                }, (error) => {
                    layer.alert("请求失败");
                });
            },
            showAddWin: function () {
                vue.friend.furl = '';
                vue.friend.fpic = '';
                vue.friend.fid = '';
                layer.open({
                    type: 1,
                    title: '添加合作伙伴',
                    area: ['700px', '450px'],
                    fixed: false, //不固定
                    maxmin: true,
                    closeBtn: 1,
                    skin: '',
                    content: $("#addFriendWin")
                });
            }
        }
    });

    layui.use(['layer', 'laypage', 'upload', 'table', 'element'], function () {
        var layer = layui.layer
            , upload = layui.upload
            , laypage = layui.laypage //分页
            , layer = layui.layer //弹层
            , table = layui.table //表格
            , element = layui.element; //元素操作
        table.render({
            elem: '#friends'
            ,id:'friends'
            , height: 332
            , url: '/friend/data/json/pager/' //数据接口
            , page: true //开启分页
            , limit: 5//每页显示多少个
            , response: {
                statusName: 'status'
                , statusCode: 0
                , msgName: 'message'
                , countName: 'total'
                , dataName: 'rows'
            }
            , cols: [[ //表头
                {field: 'fid', title: 'ID', width: 80, sort: true}
                , {field: 'furl', title: '伙伴网站地址', width: 150}
                , {field: 'fpic', title: '伙伴图标', width: 150}
                , {title: '操作', fixed: 'right', width: 165, align: 'center', toolbar: '#barFriend'}
            ]]
        });
        table.on('tool(friend)', function (obj) {
            //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
            var data = obj.data //获得当前行数据
                , layEvent = obj.event; //获得 lay-event 对应的值
            if (layEvent === 'edit') {
                layer.open({
                    type: 1,
                    title:'编辑合作伙伴',
                    area: ['700px', '450px'],
                    fixed: false, //不固定
                    maxmin: true,
                    closeBtn: 1,
                    skin: '',
                    content: $("#editFriendWin")
                });
                vue.friend = data;
                $("#imgSrc2").attr('src',vue.friend.fpic)
                $("#imgSrc2").attr('style','width: 258px;height: 135px;');
            } else if (layEvent === 'bigPic') {
                layer.open({
                    type: 1,
                    title:'查看大图',
                    area: ['700px', '450px'],
                    fixed: false, //不固定
                    maxmin: true,
                    closeBtn: 1,
                    skin: '',
                    content: $("#bigPicWin")
                });
                vue.friend = data;
                $("#imgSrc3").attr('src',vue.friend.fpic)
                $("#imgSrc3").attr('style','width: 500px;height: 300px;');
            }
        });
        upload.render({
            elem: '#uploadPic'
            , url: '/friend/data/json/upload'
            , exts: 'gif|jpg|jpeg|png|bmp|png' //只允许上传压缩文件
            , before: function (obj) { //obj参数包含的信息
                layer.load(); //上传loading
            }
            , done: function (res) {
                if (res.code == 0) {
                    layer.closeAll('loading'); //关闭loading
                    layer.msg("上传成功");
                    vue.friend.fpic = 'http://localhost:8080/static/uploads/' + res.image;
                    $("#imgSrc").attr('src',vue.friend.fpic)
                    $("#imgSrc").attr('style','width: 258px;height: 135px;');
                }
            }
            , error: function () {
                //请求异常回调
            }
        });
        upload.render({
            elem: '#uploadPic2'
            , url: '/friend/data/json/upload'
            , exts: 'gif|jpg|jpeg|png|bmp|png' //只允许上传压缩文件
            , before: function (obj) { //obj参数包含的信息
                layer.load(); //上传loading
            }
            , done: function (res) {
                if (res.code == 0) {
                    layer.closeAll('loading'); //关闭loading
                    layer.msg("上传成功");
                    vue.friend.fpic = 'http://localhost:8080/static/uploads/' + res.image;
                    $("#imgSrc2").attr('src',vue.friend.fpic)
                    $("#imgSrc2").attr('style','width: 258px;height: 135px;');
                }
            }
            , error: function () {
                //请求异常回调
            }
        });
    });

});
