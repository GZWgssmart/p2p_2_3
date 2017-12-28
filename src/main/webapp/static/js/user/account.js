var contextPath = "";
var contentType = "application/x-www-form-urlencoded; charset=utf-8";
var oPage;
function hashChange(){
	var hash = location.hash.replace('#','');
	$('.sub-nav li').removeClass('active');
	$('a[href="#'+hash+'"]').parent('li').addClass('active');
	switch(hash){
		case 'account':
			initAccount();
			break;
		case 'tuijian':
			initTuijian();
			break;
		case 'ipay':
			initIpay();
			break;
		case 'cash':
			initCash();
			break;
		case 'taste':
			initTaste();
			break;
		case 'fund':
			initFundRecord();
			break;
		case 'invest':
			initInvestManage();
			break;
		case 'claimm':
			initClaimManage();
			break;
		case 'claimb':
			initClaimBuy();
			break;
		case 'loan':
			initLoanManage();
			break;
		case 'bank':
			initMyDebitCard();
			break;
		case 'safe':
			initSafe();
			break;	
		case 'msg':
			initMsgCenters();
			break;
		case 'hetong':
			initHeTong();
			break;
		default : initAccount();$('a[href="#account"]').parent('li').addClass('active');
		break;
	};
	$('a[href="#'+hash+'"]').parent('li').addClass('active');
}
