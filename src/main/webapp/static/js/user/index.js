$(function(){
	//页面初始化
	utils.initPage();
	
	var bannerSize = $('.banner-box a').size();
	$('.nivo-controlNav').css('margin-left',-bannerSize*28/2+'px');
	$('.news-main>div').hide();
	utils.ajax({
        url:'front/index.do',
        data:{"info":"{'type':'1'}"},
        dataType:'json',
        success: function(data){
        	if(data.error == '0'){
        		//累计投资金额
//        		$('#investAmount').text(utils.formatCurrency(data.totalInvestAmountMap.investAmount));
        		//累计赚取收益
//        		$('#hasInterest').text(utils.formatCurrency(data.totalInvestAmountMap.hasInterest));
        		//累计投资人数
//        		$('#userTotal').text(data.totalUserMap.userTotal);
        		var options = {
        				useEasing : true, 
        				useGrouping : true, 
        				separator : ',', 
        				decimal : '.', 
        				prefix : '', 
        				suffix : '' 
  				};
				var count1 = new CountUp("investAmount", 0, data.totalInvestAmountMap.investAmount, 2, 2.5, options);
				//var count2 = new CountUp("hasInterest", 0, data.totalInvestAmountMap.hasInterest, 2, 2.5, options);
				var count3 = new CountUp("userTotal", 0, data.totalUserMap.userTotal, 0, 2.5, options);
				count1.start();
				//count2.start();
				count3.start();
        		//理财体验标
				/*if (data.isLiCaiInvest == 1) {
        			$("#ty-btn").attr("disabled",true);
        			$("#ty-btn").css("background-color", "#b0b0b0");
        		}*/
                //banner 
                var banner = data.bannerList;
                if(banner && banner.length>0){
                    var bannerBox = $('.banner-box');
                    bannerBox.empty();
                    for(var i = 0;i<banner.length;i++){
                        var link = banner[i].link!=null?banner[i].link:'javascript:void(0);'
                        var a = $('<a href="'+link+'" target="_blank"><img src="'+banner[i].bannerPath+'" ></a>').appendTo(bannerBox);
                    }
                    //banner初始化
                    $('.banner-box').nivoSlider({pauseTime:3000,directionNav:false});
                }
                
				//
                if(data.mapList6 != null){
	        		$('#ty-rate').text(data.mapList6.showRate);
	        		$('#ty-date').text(data.mapList6.deadline+'个月');
	        		
	        		$('#ty-btn').click(function(){
	        			window.location.href="invest.html?id="+data.mapList6.id;
	        		});
                }else{
                	$('.product-n').hide();
                }
        		//理财新手标
        		if (data.isNewInvest == 1) {
        			$("#ty-btn").attr("disabled",true);
        			$("#ty-btn").css("background-color", "#b0b0b0");
        		}
        		//
//        		$('#xs-rate').text(data.mapList5[0].annualRate.toFixed(2));
//        		$('#xs-date').text(data.mapList5[0].deadline+'月');
//        		$('#xs-btn').click(function(){
//        			window.location.href="invest.html?id="+data.mapList5[0].id;
//        		});
        		//恒金保
        		var h = $('#product-h');
        		var hList = data.mapList7;
        		if(hList.length>0){
        			for(var i = 0;i<hList.length;i++){
                        var canZr = hList[i].transferable=='0'?'':'<span>可转让</span>';
            			var hli = $('<li><div class="product-content"><div class="top">'+
    					'<p class="product-title"><a href="invest.html?id='+hList[i].id+'">'+hList[i].borrowTitle+canZr+'</a></p>'+
    					'<p class="p-rate"><span>'+hList[i].showRate+'</span><span class="small">%</span></p>'+
    					'<span class="p-rate-text">预期年化收益率</span>'+
    				'</div><div class="bottom"><div class="line icon icon-progress">'+
    						'<p>募集进度：</p>'+
    						'<p class="progress"><em  style="width:'+hList[i].schedules+'%"></em></p>'+
    						'<p class="progress-text">'+hList[i].schedules+'%</p>'+
    					'</div><p class="icon icon-doll">项目金额：'+hList[i].borrowAmount+'</p>'+
    					'<p class="icon icon-time">投资期限：'+getIsDayBorrow(hList[i])+'</p></div>'+
    				'<div class="submit">'+
    					'<button type="button" class="submit" onclick="toInvest('+hList[i].id+','+hList[i].borrowStatus+')"></button></div></div></li>');
            			var btnText = getStatus(hList[i].borrowStatus);
            			var hId = hList[i].id;
            			hli.find('button').text(btnText);
            			if(hList[i].borrowStatus != '2'){
            				hli.find('button').addClass('disabled');
            			}
            			hli.appendTo(h);
            		}
        		}else{
        			$('#pj_hengjin').remove();
        		}
        		
        		//普金保
        		var p = $('#product-p');
        		var pList = data.mapList4;
        		if(pList.length>0){
        			for(var i = 0;i<pList.length;i++){
                        var canZr = pList[i].transferable=='0'?'':'<span>可转让</span>';
            			var pli = $('<li><div class="product-content"><div class="top">'+
    					'<p class="product-title"><a href="invest.html?id='+pList[i].id+'">'+pList[i].borrowTitle+canZr+'</a></p>'+
    					'<p class="p-rate"><span>'+pList[i].showRate+'</span><span class="small">%</span></p>'+
    					'<span class="p-rate-text">预期年化收益率</span>'+
    				'</div><div class="bottom"><div class="line icon icon-progress">'+
    						'<p>募集进度：</p>'+
    						'<p class="progress"><em style="width:'+pList[i].schedules+'%"></em></p>'+
    						'<p class="progress-text">'+pList[i].schedules+'%</p>'+
    					'</div><p class="icon icon-doll">项目金额：'+pList[i].borrowAmount+'</p>'+
    					'<p class="icon icon-time">投资期限：'+getIsDayBorrow(pList[i])+'</p></div>'+
    				'<div class="submit">'+
    					'<button type="button" class="submit" onclick="toInvest('+pList[i].id+','+pList[i].borrowStatus+')"></button></div></div></li>');
            			var btnText = getStatus(pList[i].borrowStatus);
            			var pId = pList[i].id;
            			pli.find('button').text(btnText);
            			if(pList[i].borrowStatus != '2'){
            				pli.find('button').addClass('disabled');
            			}
            			pli.appendTo(p);
            		}
        		}else{
        			$('#pj_pujin').remove();
        		}
        		//多金宝
        		var d = $('#product-d');
        		var dList = data.mapList3;
        		if(dList.length>0){
        			for(var i = 0;i<dList.length;i++){
                        var canZr = dList[i].transferable=='0'?'':'<span>可转让</span>';
            			var dli = $('<li><div class="product-content"><div class="top">'+
    					'<p class="product-title"><a href="invest.html?id='+dList[i].id+'">'+dList[i].borrowTitle+canZr+'</a></p>'+
    					'<p class="p-rate"><span>'+dList[i].showRate+'</span><span class="small">%</span></p>'+
    					'<span class="p-rate-text">预期年化收益率</span>'+
    				'</div><div class="bottom"><div class="line icon icon-progress">'+
    						'<p>募集进度：</p>'+
    						'<p class="progress"><em style="width:'+dList[i].schedules+'%"></em></p>'+
    						'<p class="progress-text">'+dList[i].schedules+'%</p>'+
    					'</div><p class="icon icon-doll">项目金额：'+dList[i].borrowAmount+'</p>'+
    					'<p class="icon icon-time">投资期限：'+getIsDayBorrow(dList[i])+'</p></div>'+
    				'<div class="submit">'+
    					'<button type="button" class="submit" onclick="toInvest('+dList[i].id+','+dList[i].borrowStatus+')"></button></div></div></li>');
            			var btnText = getStatus(dList[i].borrowStatus);
            			var dId = dList[i].id;
            			dli.find('button').text(btnText);
            			if(dList[i].borrowStatus != '2'){
        					dli.find('button').addClass('disabled');
            			}
            			dli.appendTo(d);
            		}
        		}else{
        			$('#pj_duojin').remove();
        		}
        		
        		//最新公告
        		var newsList = data.newsList;
        		var newsContent = $('#newsContent');
        		var topNewContent = $('#news-list');
        		for(var i = 0;i<4;i++){
        			var newsLi = $('<li><a href="news.html?id='+newsList[i].id+'&flag=1" target="_blank">'+newsList[i].title+'</a><span>'+newsList[i].publishTime.substring(0,10)+'</span></li>');
        			var topNews = $('<li><span>'+newsList[i].announcementType+'&nbsp;&nbsp;|&nbsp;&nbsp;</span><a href="news.html?id='+newsList[i].id+'&flag=1" target="_blank">'+newsList[i].title+'</a></li>');
        			newsLi.appendTo(newsContent);
        			topNews.appendTo(topNewContent);
        		}
        		noticeSlide(topNewContent);
        		//媒体报道
        		var meikuList = data.industryNews;
        		for(var i=0;i<meikuList.length;i++){
        			var mikuLi = 
        				$('<li><a href="news.html?id='+meikuList[i].id+'" target="_blank" class="news-main-content-left">'+
    							'<img src="'+meikuList[i].imgPath+'" alt="'+meikuList[i].title+'" width="210" height="140"></a>'+
    						'<a href="news.html?id='+meikuList[i].id+'" target="_blank" class="list-title">'+meikuList[i].title+'</a>'+
    						'<a href="news.html?id='+meikuList[i].id+'" target="_blank" class="list-main">'+strChina(meikuList[i].content)+'</a></li>')
        			mikuLi.appendTo($('#dynamic .news-main-list'));
        		};
        		//行业新闻
        		var industryNews = data.meikuList;
    			for(var i = 0;i<industryNews.length;i++){
        			var partLi = $('<li><a href="news.html?id='+industryNews[i].id+'" target="_blank">'+industryNews[i].title+'</a><span>'+industryNews[i].publishTime.substring(0,10)+'</span></li>');
        			partLi.appendTo($('#news-part'));
        		}
        		$('.news-main>div').show();
        		//友情链接
        		var linkList = data.linksList;
        		var linkListContent = $('#linkList');
        		for(var i=0;i<linkList.length;i++){
        			var linkLi = $('<li><a target="view_frame" href="'+linkList[i].companyURL+'" title="'+linkList[i].companyName+'"><img src="'+linkList[i].companyImg+'" alt="'+linkList[i].companyName+'"></a></li>');
        			linkLi.appendTo(linkListContent);
        		}
        		//友情链接滚动
        		var oLinklist = linkListContent.find('li').size();
        		var oLinkBox = $('.link-list-box');
        		linkListContent.css('width',oLinklist*292+'px');
        		oLinkBox.css('width',oLinklist*292*2+'px');
        		var linkList2 = $('#linkList2').html(linkListContent.html()).css('width',oLinklist*292+'px');
        		var oLinkTime = window.setInterval(start,100);
        		oLinkBox[0].onmouseover = function(){
        			window.clearInterval(oLinkTime);
        		}
        		oLinkBox[0].onmouseout = function(){
        			oLinkTime = setInterval(start,40);
        		}
        	}else{
        		utils.alert(data.msg);
        	}
        }
    })
});

//是否天标
function getIsDayBorrow(record) {
	if (record.isDayThe == 2) {
		return record.deadline + '天';
	} else {
		return record.deadline + '个月';
	}
}

function start(){
	if ($('#linkList2')[0].offsetWidth - $('.link-list')[0].scrollLeft <= 0){
		$('.link-list')[0].scrollLeft -= $('#linkList')[0].offsetWidth;
	}else{
		$('.link-list')[0].scrollLeft++;
	}
}
function toInvest(id,status){
	if(status!=2){return};
	window.location.href = 'invest.html?id='+id;
}
function getStatus(borrow){
	if(borrow == 1){
		return '初审中';
	}else if(borrow == 2){
		return '立即投标';
	}else if(borrow == 3){
		return '复审中';
	}else if(borrow == 4){
		return '还款中';
	}else if(borrow == 5){
		return '已还完';
	}else{
		return '流标';
	}
};
//公告轮播
function noticeSlide(obj){
	var ul=obj,noTime;
	ul.css({height:obj.find('li').size()*48+'px',top:'0px'});
	//开始轮播
	oTimer=setTimeout(start, 3000);
	var i=1;
	function start() {
		i++;
		if(i>=obj.find('li').size()){
			ul.css('top', '0px');
			i=0;
		};
		ul.stop().animate({
			top:-48*i},
			200, function() {
		});
		oTimer=setTimeout(start, 3000);
	}	  
	ul.hover(function(){
		clearTimeout(oTimer)
	}, function(){
	 	oTimer=setTimeout(start, 3000);
	});
}
//内容裁剪
function strChina(str){
	var oStr = str.replace(/<[^>]+>|\n+\s+|&nbsp;/g,"");
	if(oStr.length>60){
		return oStr.substring(0,60)+'...';
	}else{
		return oStr;
	}
	
}