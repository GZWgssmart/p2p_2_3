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
                <a class="news-back fr" href="/back/not/pager">返回列表</a>
                <p class="news-time fr" id="crea"></p>
            </div>
            <div class="news-contents-bottom" id="content">

            </div>
        </div>
    </div>
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

        },created(){

        }
    });

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