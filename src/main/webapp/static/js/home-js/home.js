/**
 * @author ye
 * 权限js文件
 */
//初始化layui,Vue
$(function () {
    var vue = new Vue({
        el: "#apphome",
        data: {
            home: {'hid': '', 'url1': '', 'pic1': '', 'url2': '', 'pic2': '', 'url3': '', 'pic3': '','status':''}

            },
        created() {
        },
        methods: {

            toupd: function () {
                var id = $("#hid").val();
                var params = new URLSearchParams();
                params.append('id', id);

                  axios.post('/home/data/json/updhid?id='+id , params).then((response) => {

                 }, (error) => {
                 alert(error);
                 });

            },
        updateHome:function () {
            // vue.home.status = $('input:radio[name="status"]:checked').val();
                axios.post('/home/data/json/update', Qs.stringify(vue.home)).then((response) => {
                    layer.msg(response.data.message);
                    window.location.reload();
                }, (error) => {
                    layer.alert("请求失败");
                });
            },
            saveHome: function () {

                form.on('submit(saveHome)', function(data){
                    axios.post('/home/data/json/save', Qs.stringify(vue.home)).then((response) => {
                        layer.msg(response.data.message);
                        vue.home.pic1 = '';
                        vue.home.url1 = '';
                        vue.home.pic2 = '';
                        vue.home.url2 = '';
                        vue.home.pic3 = '';
                        vue.home.url3 = '';
                        layer.closeAll();
                        window.location.href="/back/home/list";
                    }, (error) => {
                        layer.alert("请求失败");
                    });
                });


            },
            showAddWin: function () {
                vue.home.url1 = '';
                vue.home.pic1 = '';
                vue.home.pic2 = '';
                vue.home.url2 = '';
                vue.home.pic3 = '';
                vue.home.url3 = '';
                vue.home.hid = '';
                layer.open({
                    type: 1,
                    title: '添加首页轮播图',
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
            elem: '#home'
            ,id:'home'
            , height: 450
            , url: '/home/data/json/pager/' //数据接口
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
                 {field: 'url1', title: '轮播图一地址', width: 132}
                , {field: 'pic1', title: '轮播图一图片', width: 134,templet:'<div>{{img(d.pic1)}}</div>'}
                , {field: 'url2', title: '轮播图二地址', width: 132}
                , {field: 'pic2', title: '轮播图二图片', width: 134,templet:'<div>{{img(d.pic2)}}</div>'}
                , {field: 'url3', title: '轮播图三地址', width: 132}
                , {field: 'pic3', title: '轮播图三图片', width: 134,templet:'<div>{{img(d.pic3)}}</div>'}
                , {title: '操作', fixed: 'right', width: 325, align: 'center', toolbar: '#barFriend'}
            ]]
        });
        table.on('tool(home)', function (obj) {
            //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
            var data = obj.data //获得当前行数据
                , layEvent = obj.event; //获得 lay-event 对应的值
            vue.home = data;
            if (layEvent === 'edit') {
                layer.open({
                    type: 1,
                    title:'编辑',
                    area: ['700px', '450px'],
                    fixed: false, //不固定
                    maxmin: true,
                    closeBtn: 1,
                    skin: '',
                    content: $("#editFriendWin")
                });
                console.log(vue.home);
                $("#hid").val(data.hid);
                $("#imgSrc").attr('src',vue.home.pic1);
                $("#imgSrc").attr('style','width: 258px;height: 135px;');
                $("#imgSrc2").attr('src',vue.home.pic2);
                $("#imgSrc2").attr('style','width: 258px;height: 135px;');
                $("#imgSrc3").attr('src',vue.home.pic3);
                $("#imgSrc3").attr('style','width: 258px;height: 135px;');
            }else if (layEvent === 'bigPic') {
                layer.open({
                    type: 1,
                    title:'查看轮播图一',
                    area: ['700px', '450px'],
                    fixed: false, //不固定
                    maxmin: true,
                    closeBtn: 1,
                    skin: '',
                    content: $("#bigPicWin")
                });
                $("#imgSrc7").attr('src',vue.home.pic1)
                $("#imgSrc7").attr('style','width: 500px;height: 300px;');
            }else  if (layEvent === 'bigPic2') {
                layer.open({
                    type: 1,
                    title:'查看轮播图二',
                    area: ['700px', '450px'],
                    fixed: false, //不固定
                    maxmin: true,
                    closeBtn: 1,
                    skin: '',
                    content: $("#bigPicWin2")
                });
                 $("#imgSrc4").attr('src',vue.home.pic2)
                $("#imgSrc4").attr('style','width: 500px;height: 300px;');
            }else if (layEvent === 'bigPic3') {
                layer.open({
                    type: 1,
                    title:'查看轮播图二',
                    area: ['700px', '450px'],
                    fixed: false, //不固定
                    maxmin: true,
                    closeBtn: 1,
                    skin: '',
                    content: $("#bigPicWin3")
                });
                $("#imgSrc5").attr('src',vue.home.pic3)
                $("#imgSrc5").attr('style','width: 500px;height: 300px;');
            }else if(layEvent === 'upd'){
                layer.msg('是否激活当前首页图片10s后自动取消', {
                    time: 10000, //10s后自动关闭
                    btn: ['是的', '取消'],
                    yes:function(){
                        var id = vue.home.hid;
                        var params = new URLSearchParams();
                        params.append('id', id);
                        axios.post('/home/data/json/updhid?id='+id , params).then((response) => {
                            window.location.reload();
                        }, (error) => {
                            alert(error);
                        });
                    },
                    btn2: function () {
                        layer.msg('已取消');
                    }
                });
            }
        });
        upload.render({
            elem: '#uploadPic'
            , url: '/home/data/json/upload'
            , exts: 'gif|jpg|jpeg|png|bmp|png' //只允许上传压缩文件
            , before: function (obj) { //obj参数包含的信息
                layer.load(); //上传loading
            }
            , done: function (res) {
                if (res.code == 0) {
                    layer.closeAll('loading'); //关闭loading
                    layer.msg("上传成功");
                    vue.home.pic1 = 'http://localhost:8080/static/uploads/' + res.image;
                    $("#imgSrc").attr('src',vue.home.pic1)
                    $("#imgSrc").attr('style','width: 258px;height: 135px;');

                }
            }
            , error: function () {
                //请求异常回调
            }
        });
        upload.render({
            elem: '#uploadPic2'
            , url: '/home/data/json/upload'
            , exts: 'gif|jpg|jpeg|png|bmp|png' //只允许上传压缩文件
            , before: function (obj) { //obj参数包含的信息
                layer.load(); //上传loading
            }
            , done: function (res) {
                if (res.code == 0) {
                    layer.closeAll('loading'); //关闭loading
                    layer.msg("上传成功");
                    vue.home.pic2 = 'http://localhost:8080/static/uploads/' + res.image;
                    $("#imgSrc2").attr('src',vue.home.pic2)
                    $("#imgSrc2").attr('style','width: 258px;height: 135px;');

                }
            }
            , error: function () {
                //请求异常回调
            }
        });
        upload.render({
            elem: '#uploadPic3'
            , url: '/home/data/json/upload'
            , exts: 'gif|jpg|jpeg|png|bmp|png' //只允许上传压缩文件
            , before: function (obj) { //obj参数包含的信息
                layer.load(); //上传loading
            }
            , done: function (res) {
                if (res.code == 0) {
                    layer.closeAll('loading'); //关闭loading
                    layer.msg("上传成功");
                    vue.home.pic3 = 'http://localhost:8080/static/uploads/' + res.image;
                    $("#imgSrc3").attr('src',vue.home.pic3)
                    $("#imgSrc3").attr('style','width: 258px;height: 135px;');

                }
            }
            , error: function () {
                //请求异常回调
            }
        });

    });

});

function img(value) {
    return '<img src='+value+'/>'
}
