<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">

    <title>普金资本平台</title>
    <link rel="stylesheet" href="/static/dynajs/xxplxq/css/public.css">
    <link rel="stylesheet" href="/static/dynajs/xxplxq/css/about.css">
</head>
<link rel="icon" href="resources/front/v01/src/images/logo_title.jpg" type="image/x-icon"/>
<body>
<%@include file="../common/top.jsp" %>
<input id="id" type="hidden" value="${requestScope.id}">
<div id="app">
    <div class="news cl">
        <div class="news-contents" style="display: block;">
            <h3 id="news-title">
                <div id="title"></div>
            </h3>
            <div class="news-contents-top">
                <a class="links news-links fl" href="javascript:;" title="原文链接" style="display: none;">

                </a>
                <a class="links news-share fl bds_more bdsharebuttonbox" href="javascript:;" data-cmd="more">

                </a>
                <a class="links news-weixin fl" href="javascript:;">
                    分享到微信邀请好友
                </a>
                <div class="weChart" style="display: none;">
                    <img id="weChartImg" src="">
                    <div class="shareMsg">
                        <p>打开微信“扫一扫”，点击右上角“发送给朋友”或“分享到朋友圈”</p>
                        <p class="weChartTips">（好友通过您分享的链接成功注册，您就成了他的理财师）</p>
                    </div>

                    <span class="topTag"></span>
                </div>
                <a class="news-back fr" href="/back/font/information#gsdt">返回列表</a>
                <p class="news-time fr" id="crea"></p>
            </div>
            <div class="news-contents-bottom" id="content">

            </div>
        </div>
    </div>
</div>


<div class="mod-sidebar">
    <ul>
        <li><a target="_blank" href="" class="sidebar-qq"></a></li>
        <li><a href="javascript:;" class="sidebar-wx"></a></li>
        <li><a href="" class="sidebar-cl"></a></li>
        <li><a href="javascript:;" class="wenquan" title="填写即送5元代金券"></a></li>
        <li><a href="javascript:;" class="sidebar-top"></a></li>
    </ul>
    `
</div>
<div class="index-concat">
    <div class="wrap cl">
        <div class="index-concat-left">

        </div>
        <div class="index-concat-phone">
            <p>财富热线</p>
            <h3>400-606-2079</h3>
        </div>
        <div class="index-concat-channel">
            <p class="about_cel_text">
                <a target="_blank" href="" class="about_wb"></a>
                <a href="javascript:void(0);" class="about_wx line_02">
						<span class="line_l_h">
							<span class="line_l_sj"></span>
							<span class="line_l_text">关注普金资本公众号</span>
							<span class="line_l_pic"></span>
						</span>
                </a>
                <a target="_blank" href="" class="about_qq"></a>
                <a href="javascript:void(0);" class="about_wx about_rr">
						<span class="line_l_j">
							<span class="line_l_sj"></span>
							<span class="line_l_texts">400-606-2079</span>
						</span>
                </a>
            </p>
            <p class="about_cel_no">admin@pujinziben.com</p>
        </div>
        <div class="index-concat-link cl">
            <a href="javascript:;" class="title">友情链接</a>
            <a target="_blank" href="">网贷天眼</a>
            <a target="_blank" href="">网贷天下</a>
            <a target="_blank" href="">中国平安银行</a>
            <a target="_blank" href="">中国建设银行</a>
            <a target="_blank" href="">网贷东方</a>
            <a target="_blank" href="">第一网贷</a></div>
    </div>
</div>
<div class="footer">
    <div class="wrap">
        <p class="text">
            版权所有 © 普金资本运营（赣州）有限公司 All rights reserved <br>
            备案确认书：<a href="" target="_blank" class="beian">赣ICP备16004010号</a>
            <a href="" target="_blank"></a>&nbsp;&nbsp;&nbsp;&nbsp;
            <a target="_blank" href="" style="display:inline-block;text-decoration:none;height:20px;line-height:20px;"
               class="beian">
                赣公网安备 36070202000195号</a>

        </p>

    </div>
</div>
<script src="https://cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>
<script src="/static/dynajs/xxplxq/js/json2.js"></script>
<script src="/static/js/vue.min.js/"></script>
<script src="/static/js/axios.min.js/"></script>
<script src="/static/layui/layui.js"></script>
<script src="/static/layui/lay/modules/element.js"></script>
<script src="/static/js/axios.min.js"></script>



<script>
    $(function () {
        var id = $("#id").val();
        $.post("/dyna/data/json/byiddync",
            {id: id}
            , function (data) {
                $("#title").append(data.data.title),
                    $("#pic").append(data.data.pic),
                    $("#crea").append(data.data.createdTime),
                    $("#content").append(data.data.content)
            }, "json"
        );
    });
    $(function () {
        var id = $("#id").val();
        $.post("/media/data/json/byiddync",
            {id: id}
            , function (data) {
                $("#title").append(data.data.title),
                    $("#pic").append(data.data.pic),
                    $("#crea").append(data.data.createdTime),
                    $("#content").append(data.data.content)
            }, "json"
        );
    });
    $(function () {
        var id = $("#id").val();
        $.post("/notice/data/json/byiddync",
            {id: id}
            , function (data) {
                $("#title").append(data.data.title),

                    $("#crea").append(data.data.createdTime),
                    $("#content").append(data.data.content)
            }, "json"
        );
    });

    var list = new Vue({
        el: "#app",
        data: {
            title:"",
            list: [],
            code: "",
        },created(){
            tofindone();
            messageT();
            messageF();
        }
    });
    this.title="asadasad";
    function tofindone (id) {
        var params = new URLSearchParams();
        params.append('id', id);

        axios.post('dyna/data/json/byiddync', params).then((response) => {
            this.code = response.data.data.content;
            $("#code").append(this.code)
        }, (error) => {

        });
    }
    function messageT(msg) {
        this.messagevalid = true;
        this.message = msg;
    }
    function messageF(msg) {
        this.messagevalid = false;
    }
</script>



</body>
</html>