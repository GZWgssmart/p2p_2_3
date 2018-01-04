$(function(){
	//页面初始化
	utils.initPage();
	var proTypeId = utils.getUrlParam('id');
	var flag = utils.getUrlParam('flag');
	var url = '';
	$('.news-contents').hide();
	$('.weChart').mouseleave(function(){
		$(this).hide();
	})
	$('.news-weixin').hover(function(){
		$('.weChart').show();
	})
	if(utils.Storage.getItem('uid')){
		$('.loginTag').remove();
		var src = location.href.replace('news.html','news_mobile.html');
		$('#weChartImg').attr('src','http://qr.topscan.com/api.php?text='+src+'%26useCode='+utils.Storage.getItem('uid'));
	}
	//公告
	if(flag && flag=='1'){
		url = 'front/frontNewsDetails.do';
	}else{
	//新闻
		url = 'front/frontMediaReportDetails.do';
	}
	
	var param={id:proTypeId,pageType:'PC'}; 
	utils.ajax({
        url:url,
        data:JSON.stringify(param),
        dataType:'json',
        success: function(data){
        	if(data.error == '0'){
        		var title = '';
        		if(flag && flag=='1'){
        			title = data.paramMap.title;
        			$('#news-title').text(data.paramMap.title);
        			$('.news-contents-bottom').html(data.paramMap.content);
        			$('.news-time').text(data.paramMap.publishTime);
    				$('.news-back').attr('href','about.html#ptgg');
	        	}else{
	        		title = data.map.title;
	        		$('#news-title').text(data.map.title);
        			$('.news-contents-bottom').html(data.map.content);
        			$('.news-time').text(data.map.publishTime);
        			if(data.map.newsType == '2'){
        				$('.news-back').attr('href','about.html#gsdt?type=1');
        				$('.news-links').attr('href',data.map.url);
        			}else{
        				$('.news-links').hide();
        				$('.news-back').attr('href','about.html#gsdt');
        			}
        			
	        	}
        		$('.news-contents').show();
        		window._bd_share_config={"common":{"bdSnsKey":{},"bdText":""+title+"","bdMini":"2","bdMiniList":["mshare","qzone","tsina","renren","tqq","tieba","bdhome","douban","sqq","ibaidu","isohu","h163","copy","print"],"bdPic":"","bdStyle":"0","bdSize":"16"},"share":{}};with(document)0[(getElementsByTagName('head')[0]||body).appendChild(createElement('script')).src='http://bdimg.share.baidu.com/static/api/js/share.js?v=89860593.js?cdnversion='+~(-new Date()/36e5)];
        	}else{
        		utils.alert(data.msg,function(){
        			window.location.href='index.html';
        		});
        	}
        }
    })
//	window._bd_share_config={"common":{"bdSnsKey":{},"bdText":"普金资本第二期新员工入职培训圆满结束","bdMini":"2","bdMiniList":false,"bdPic":"","bdStyle":"0","bdSize":"16"},"share":{}};
//	with(document)0[(getElementsByTagName('head')[0]||body).appendChild(createElement('script')).src='http://bdimg.share.baidu.com/static/api/js/share.js?v=89860593.js?cdnversion='+~(-new Date()/36e5)];
	
});
