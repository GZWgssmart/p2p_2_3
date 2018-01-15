<%--
  Created by IntelliJ IDEA.
  User: CHEN JX
  Date: 2018/1/10
  Time: 20:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div class="about-left">
    <div class="about-left-nav">
        <div id="animateDiv" class="animateDiv">
            <ul id="animateUl" class="sub-nav">
                <li class="xxpl" class="active"><a href="javaScript:void(0);" onClick="animate1()" class="icon-about about-xxpl">信息披露</a></li>
            </ul>
        </div>
        <ul class="sub-nav">
            <li><div class="hr"></div></li>
            <li id="gd"><a href="#gdbj" class="icon-about about-gudong" onclick="gdbj();">股东背景</a></li>
            <li><a href="#gsjj" class="icon-about about-jianjie" onclick="gsjj();">公司简介</a></li>
            <li><a href="#ptzz" class="icon-about about-zizhi"  onclick="ptzi();">平台资质</a></li>
            <!-- <li><a href="#gltd" class="icon-about about-guanli">管理团队</a></li> -->
            <li><a href="#gwtd" class="icon-about about-guwen" onclick="gwtd();" >顾问团队</a></li>
            <li><a href="#gsdt" class="icon-about about-dongtai" onclick="gsdt();">公司动态</a></li>
            <li><a href="#ptgg" class="icon-about about-gonggao" onclick="ptgg();" >平台公告</a></li>
            <li><a href="#zxns" class="icon-about about-zhaopin" onclick="znxs();" >招贤纳士</a></li>
            <li><a href="#lxwm" class="icon-about about-lianxi" onclick="lxwm();" >联系我们</a></li>
        </ul>
    </div>
</div>
</body>
<script>
    var isClick = false;
    function animate1() {

        isClick = !isClick;
        if (isClick) {
            $("#animateDiv").animate({height:"175px"},500);
            $("#animateUl").empty();
            $("#animateUl").html(
                '<li class="xxpl"><a href="javaScript:void(0);" onClick="animate1()" class="icon-about about-xxpl">信息披露</a></li>'
                +'<li class="cyjg"><a href="#cyjg" onclick="cyjg();" class="icon-about about-cyjg">从业机构信息</a></li>'
                +'<li class="ptyy"><a href="#ptyy" onclick="ptyy();" class="icon-about about-ptyy">平台运营信息</a></li>'
                +'<li class="jkxm"><a href="#jkxm" onclick="jkxm();"class="icon-about about-jkxm">借款项目信息</a></li>');
            $('.cyjg').show();
            $('.ptyy').show();
            $('.jkxm').show();
        }
        else {
            $("#animateDiv").animate({height:"45px"},500);
            setTimeout(function() {
                $('.cyjg').hide();
                $('.ptyy').hide();
                $('.jkxm').hide();
            },500)
            location.hash="gdbj";
        }
    }
    function gdbj() {
        $(".about-right").load("/back/font/gdbj");
    }
    function gsjj() {
        $(".about-right").load("/back/font/gsjj");
    }
    function ptzi() {
        $(".about-right").load("/back/font/ptzi");
    }
    function gwtd() {
        $(".about-right").load("/back/font/gwtd");
    }
    function gsdt() {

        $(".about-right").load("/back/font/gsdt");
    }
    function ptgg() {
        $(".about-right").load("/back/font/ptgg");
    }
    function znxs() {
        $(".about-right").load("/back/font/znxs");
    }
    function lxwm() {
        $(".about-right").load("/back/font/lxwm");
    }
    function cyjg() {
        $(".about-right").load("/back/font/cyjg");
    }
    function ptyy() {
        $(".about-right").load("/back/font/ptyy");
    }
    function jkxm() {
        $(".about-right").load("/back/font/jkxm");
    }

    function hashChange(){
        var hash = location.hash;
        if(hash.indexOf('?')>0){
            hash = hash.substring(1,hash.indexOf('?'));
        }else{
            hash = hash.replace('#','');
        }
        $('.sub-nav li').removeClass('active');
        $('a[href="#'+hash+'"]').parent('li').addClass('active');
    }
</script>
</html>
