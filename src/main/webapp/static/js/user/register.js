var isPhoneRegist,isUserRegist;
$(function(){
		utils.initInput();
		if(utils.getUrlParam('useCode')){
			$('.from-ext').attr('class','from fadeOutUpBig');
			$('#useCode').val(utils.getUrlParam('useCode')).attr('disabled',true);
		};
		var phone;
		$('.code').one('click',function(){
			$('.from-ext').attr('class','from fadeOutUpBig');
		});
});

/*
function regist(captchaObj){
	var phone = $('#phone').val();
	var username = phone;
	var pwd = $('#pwd').val();
	var msgCode = $('#msgcode').val();
	var useCode = $('#useCode').val();

	if(phone==''){
		showError('请输入手机号',$('#phone'));
		return;
	};
	if(utils.isPhone(phone)){
		showError('请输入正确手机号',$('#phone'));
		return;
	};
	if(pwd==''){
		showError('请输入登录密码',$('#pwd'));
		return;
	};
	if(msgCode==''){
		showError('请输入短信验证码',$('#msgcode'));
		return;
	};
	if(!$('#getMsgCode').data('randomCode')){
		utils.alert('请获取短信验证码！');
		return;
	};
	if(!$('#agree').is(':checked')){
		utils.alert('请勾选服务协议');
		return;
	}
	$('.btn').text('注册中...').addClass('disabled');
	/!**captchaObj.show();
	 captchaObj.onSuccess(function(){
		 var param={
				 name:username,
				 pwd:pwd,
				 cellPhone:phone,
				 code:msgCode,
//				 randomCode:$('#getMsgCode').data('randomCode'),
//				 recivePhone:$('#getMsgCode').data('recivePhone'),
				 refferee:useCode,
				 pageId:'regist'
		 };
			utils.ajax({
		        url:'front/register.do',
		        data:JSON.stringify(param),
		        dataType:'json',
		        success: function(data){
		        	if(data.error =='0'){
		        		utils.alert('注册成功！',function(){
		        			window.location.href=utils.getBasePath()+'login.html';
		        		})
		        	}else{
		        		utils.alert(data.msg);
		        	}
		        	$('.btn').text('注册').removeClass('disabled');
		        }
		    })
	 });*!/
	

}*/