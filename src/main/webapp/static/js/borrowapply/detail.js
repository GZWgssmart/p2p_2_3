//标的详情
function getDetail(obj){
    if($(obj).hasClass('active')){
        return;
    };
    $('.em-line').animate({'left':'40px'},500);
    $('.sub-a-box').hide();
    $(obj).addClass('active').siblings().removeClass('active');
    $('#project').show();
}
//获取相关文件
function getFile(obj){
    if($(obj).hasClass('active')){
        return;
    };
    $('.em-line').animate({'left':'160px'},500);
    $('.sub-a-box').hide();
    $(obj).addClass('active').siblings().removeClass('active');
    $('#files').show();
}
//大图预览
function showBigImg(flag,index){
    var list = [];
    if(flag==0){
        list = fileList;
        var path = list[index-1].imgPath
    }else{
        list = imgList;
        var path = list[index-1].imagePath
    };
    var name = list[index-1].name;
    var overlay = $('<div class="overlay-img"></div>').appendTo($('body'));
    var imgBox = $('<img class="bigImg" src="'+path+'" />').appendTo($('body'));
    imgBox.load(function(){

        imgW = imgBox[0].offsetWidth;
        imgH = imgBox[0].offsetHeight;

        var clientHeight = window.innerHeight || document.documentElement.clientHeight || document.body.clientHeight;   //height
        var oHeight = imgH>clientHeight?clientHeight:imgH;
        var oWidth = clientHeight<imgH?(clientHeight/imgH) * imgW:imgW;
        imgBox.css({
            'height':oHeight+'px',
            'margin-left':-oWidth/2+'px',
            'margin-top':-oHeight/2+'px'
        });
    });
    overlay.bind('click',function(){
        overlay.remove();
        imgBox.remove();
    })
}
//还款计划
function getPlan(obj){
    if($(obj).hasClass('active')){
        return;
    };
    $('.em-line').animate({'left':'280px'},500);
    $('.sub-a-box').hide();
    $(obj).addClass('active').siblings().removeClass('active');
    $('#plan').show();
}
//投资记录
function getInvest(obj){
    if($(obj).hasClass('active')){
        return;
    };
    if($('.plan').is(':visible')){
        $('.em-line').animate({'left':'400px'},500);
    }else{
        $('.em-line').animate({'left':'280px'},500);
    }
    $('.sub-a-box').hide();
    $(obj).addClass('active').siblings().removeClass('active');
    $('#invest').show();
};

function dangger(obj){
    if($(obj).hasClass('active')){
        return;
    };
    if($('.plan').is(':visible')){
        $('.em-line').animate({'left':'520px'},500);
    }else{
        $('.em-line').animate({'left':'400px'},500);
    }

    $('.sub-a-box').hide();
    $(obj).addClass('active').siblings().removeClass('active');
    $('#tips').show();
}

function getinfo(baid,bdid) {
    return axios.get('/borrowapply/data/json/infoplus/'+baid+'/'+bdid);
}