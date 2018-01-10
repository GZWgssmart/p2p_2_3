/**
 * 
 */
var listNum = 1,tt = '',xx = '',yy = '',
rates = '',timeers = '',deadlines = '',flages = '',oData = [],oPage,oParam,serchText='';
$(function(){
	//页面初始化
	utils.initPage();
	hashChange();
	
	
	$("#claimm-can-Search").click(function () {
		hashChange();
	});
	
});
function hashChange(){
	var hash = location.hash.replace('#','');
	$('a[href="#'+hash+'"]').parent('li').addClass('active');
	$('a[href="#'+hash+'"]').parent('li').siblings('li').removeClass('active');
	if(hash.length == 1){
		tt = hash;
	}
	if(hash.length == 2){
		yy = parseFloat(hash).toString();
	}
	if(hash.length == 3){
		xx = parseFloat(hash).toString();
	};
	serchText = $("#claimm-can-title").val();
	$('.listData').empty();
	$('.paging').empty();
	loadData();
}
function loadData(){
	//页面首次加载
	oParam={
			curPage:listNum,
			tt:tt,
			yy:yy,
			xx:xx,
			rates:rates,
			timeers:timeers,
			deadlines:deadlines,
			flages:flages,
			titles:serchText
	};
	oData = [
	            {
	            	key:'borrowTitle',
	            	resolve:function(val,record){
	            		var btnStatus = record.borrowStatus == '2'?'':'disabled';
	            		var str = '<li><div class="invest-title cl"><p>'+record.borrowWayName+'</p><h3 onclick="toDetail('+record.id+')">'+record.borrowTitle+'</h3></div>'+
						'<div class="invest-content cl"><ul>'+
								'<li class="row1">'+
									'<p class="row-top">预期年化收益率</p>'+
									'<p class="row-bottom color">'+record.showRate+'<span>%</span></p></li>'+
								'<li class="row2">'+
									'<p class="row-top">项目期限</p>'+
									'<p class="row-bottom">'+ getIsDayBorrow(record) +'</p></li>'+
								'<li class="row3">'+
									'<p class="row-top">还款方式</p>'+
									'<p class="row-bottom">'+paymentMode(record.paymentMode)+'</p></li>'+
								'<li class="row4">'+
									'<p class="row-top">可投金额 / 募集总额</p>'+
									'<p class="row-bottom">'+record.investNum+' / '+record.borrowAmount+'</p></li>'+
								'<li class="row5">'+
									'<div class="line">'+
										'<p class="progress fl">'+
											'<em style="width: '+record.schedules+'%;"></em>'+
										'</p>'+
										'<p class="progress-text">'+record.schedules+'%</p>'+
									'</div>'+
									'<p class="row-top">募集进度</p></li>'+
								'<li class="row6">'+
									'<button type="button" class="btn '+btnStatus+'" onclick="toInvest('+record.id+','+record.borrowStatus+')">'+getStatus(record.borrowStatus)+'</button>'+
								'</li></ul></div></li>'
	            		return str;
	            	}
	            }
	            ]
	oPage = new Page('front/financeList.do',oParam,$('.listData'),$('.paging'),oData,function(){
		
	});
}

// 是否天标
function getIsDayBorrow(record) {
	if (record.isDayThe == 2) {
		return record.deadline + '天';
	} else {
		return record.deadline + '个月';
	}
}

//获取标的状态
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
//投标
function toInvest(id,status){
	if(status!=2){return};
	window.location.href = 'invest.html?id='+id;
}
//详情
function toDetail(id){
	window.location.href = 'invest.html?id='+id;
}
//获取还款方式
function paymentMode(val){
	if(val==4){
		return ' 一次性还款';
	}else if(val==1){
		return '等额本息';
	}else{
		return '按月付息，到期还本';
	}
};