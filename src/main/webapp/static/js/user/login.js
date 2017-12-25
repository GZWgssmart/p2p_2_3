var pullTest = false,jumpHref='account.html';
$(function(){
		utils.initInput();
		var href = utils.getUrlParam('href');
		var ev = utils.getUrlParam('ev');
		var id = utils.getUrlParam('id');
		if(href){
			jumpHref = href+'.html';
		}
		if(id){
			jumpHref = jumpHref + '?id='+id;
		}
		if(ev){
			jumpHref = jumpHref + '&ev='+ev;
		}
		//进度登录条
		var X = $('.pull-box').offset().left;
		var Width = $('.pull-box')[0].offsetWidth;
		var bX = -1;
		$('.pull-btn').bind('mousedown',function(){
			$(document).bind('mousemove',function(e){
				bX = e.pageX-X;
				if(bX<0){
					return;
				}
				if((bX+45)>=Width){
					$(document).unbind('mousemove');
					//验证通过
					$('.pull-default').attr('class','pull-default-true');
					$('.pull-btn').addClass('pull-btn-true');
					$('.pull-bg').html('验证通过').css('width',Width-46+'px');
					pullTest = true;
					return;
				};
				$('.pull-btn').css('left',bX+'px');
				$('.pull-bg').css('width',bX+'px');
			});
		});
		$(document).mouseup(function(){
			$(document).unbind('mousemove');
			if((bX+47)>=Width){
				bX = Width-47;
				$('.pull-btn').css('left',bX+'px');
			}else{
				$('.pull-btn').animate({left:"-1px"});
				$('.pull-bg').animate({width:"0px"})
			}
		})
		/*//登录
		$('.btn').bind('click',function(){
			submit();
		});
		$("#password").bind('keyup', function(event){
			   if (event.keyCode=="13"){
				   submit();  
			   }
		})*/
});