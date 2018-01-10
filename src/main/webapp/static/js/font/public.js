/* public js
 * Copyright 2016, wushulin
 * Date   2016/11/12
 * auther shulin.wu@pjzb.com
 */
window.__uri = function(str){
	return str;
}
var utils = window.utils = {};
utils.time = null;
utils.Dialog = function(flag){
	if(flag){
		if($('.overlay').is(':visible'))
			return;
		var dialog = $('<div class="overlay"></div>').click(function(){
			//$(this).addClass('fadeOut').fadeOut();
		});
		dialog.appendTo($('body')).delay(100).fadeIn().css('filter','alpha(opacity=70)');
	}else{
		$('.overlay').fadeOut().remove();
	}
}

/*toast提示框
 * @param msg 提示语
 * @param time 提示语显示时间
 * @auth wsl
 */
utils.toast = function(msg,time){
	if($('.toastMessage').is(':visible')){
		return;
	}
	var toast = $('<div class="toastMessage"><p>'+msg+'</p></div>');
	delay = 3000;
	toast.appendTo($('body')).fadeIn(500);
	if(time)
		delay = time;
	setTimeout(function(){
		toast.fadeOut();
		toast.remove();
	},delay)
};
/*Loading
 * @auth wsl
 */ 
utils.Loading = function(m){
	if($('.loading').is(':visible')){
		return;
	}
	var toast = $('<div class="loading"></div>');
	toast.appendTo($('body'));
};
/*页面格式化，顶部跟底部
 * @auth wsl
 */ 
utils.initPage = function(){
	//底部初始化
	$.ajax({
	    url: 'footer.html',
	    type: "get",
	    dataType: "html",
	    success: function (data) {
	       $('#ajaxFooter').empty().html(data);
	       $('#ht').click(function(){
	    	   if(!utils.Storage.getItem('uid')){
	    		   utils.alert('您还未登录，请先登录！',function(){
	    			   window.location.href="login.html";
	    		   })
	    	   }else{
	    		   window.location.href="account.html#hetong";
	    	   }
	       });
	       $('.sidebar-top').click(function(){
	    	   $('body').scrollTop(0);
	       });
	       $('.sidebar-wx').click(function(){
	    	   utils.Dialog(true);
	    	   $('.wechart-box').addClass('show');
	    	   $('.wechart-box .close').click(function(){
	    		   utils.Dialog();
	    		   $('.wechart-box').removeClass('show');
	    	   })
	       });
	       //问券调查
	       $('.wenquan').click(function(){
	    	   if(!utils.Storage.getItem('uid')){
	    		   utils.alert('您还未登录，请先登录！',function(){
	    			   window.location.href=utils.getBasePath()+"login.html";
	    		   })
	    	   }else{
		    	   if(utils.Storage.getItem('surveyCount') && utils.Storage.getItem('surveyCount')>0){
	    	   	 	utils.alert('您已提交过问卷，谢谢！');
	    	   	 	return;
		    	   }
	    		   window.location.href=utils.getBasePath()+"question.html";
	    	   }
	       })
    	   //友情链接
    	   $.ajax({
    		    url:'front/queryLinksType2.do',
    		    type: "post",
    		    dataType: "json",
    		    success: function (data) {
    		    	if(data.error == '0'){
    		    		var oBox = $('.index-concat-link');
    		    		oBox.empty();
    		    		var links = data.pageBean.page;
    		    		$('<a href="javascript:;" class="title">友情链接</a>').appendTo(oBox);
    		    		for(var i=0;i<links.length;i++){
    		    			$('<a target="_blank" href="'+links[i].companyURL+'">'+links[i].companyName+'</a>').appendTo(oBox);
    		    		}
    		    	}
    		    }
    		});

//	       //客服QQ
//    	   BizQQWPA.addCustom({aty: '0', a: '0', nameAccount: 4006062079, selector: 'BizQQWPA'});
//    	   BizQQWPA.visitor({
//    			nameAccount: '4006062079'
//    		});
	    }
	});
	//top初始化
	$.ajax({
	    url:'top.html',
	    type: "get",
	    dataType: "html",
	    success: function (data) {
	       $('#top').empty().html(data);
	       $('#qrCodeDiv').hide();
	       $('#app').hover(
				  function(){
				   	$('#qrCodeDiv').show();
				  },function(){
				   	$('#qrCodeDiv').hide();
				  }
	       );
	       utils.initLoginData();
	       $('#qrCodeDiv').hover(
			   	function(){
			   		$('#qrCodeDiv').show();
			   	},function(){
			   		$('#qrCodeDiv').hide();
			   	}
		   	);
	    }
	});
	
	$('.nav-bar li').hover(function(){
		if($(this).has('.sub-nav').length>0){
			var oHeight = $(this).children('.sub-nav').height();
			$(this).children('.sub-nav').addClass('show');
		}
	},function(){
		$(this).children('.sub-nav').removeClass('show');
	})
};
//初始化登录状态
utils.initLoginData = function(){
	if(utils.Storage.getItem('uid')){
		$('#userName a').text(utils.Storage.getItem('username')).attr('href','account.html').addClass('user');
		$('#top .top-list li:last').addClass('no');
		$('#top .top-list li:first a').text('退出').attr({'class':'','href':'javascript:;'}).click(function(){
			utils.Storage.clear();
			window.location.href='index.html';
//	    	   $.ajax({
//	    		    url:'front/logout.do',
//	    		    type: "post",
//	    		    dataType: "json",
//	    		    success: function (data) {
//	    		    	if(data.error == '0'){
//	    					utils.Storage.clear();
//	    					window.location.href='index.html';
//	    		    	}
//	    		    }
//	    		});
		});
	}else{
		$('.nav .icon-acc a').attr('href',utils.getBasePath()+'login.html');
		$('#top .pay').remove();
	}
};

if(window.top!=window.self){
	window.top.location = window.self.location;
};
var isWuHeng = isLocalStorageSupported();
var AmtRegExp =/^(([1-9]\d{0,9})|0)(\.\d{1,2})?$/,
mobilePhone = /^(13[0-9]|14[7-9]|15[0-9]|18[0-9]|17[0-9])[0-9]{8}$/,
Email = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/,
idCard = /^[1-9]\d{5}[1-9]\d{3}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{3}([0-9]|X)$/;
utils.Storage = {
		setItem:function(key,val){
			if(isWuHeng){
				window.localStorage.setItem(key,val);
			}else{
				setCookie(key,val,{maxAge:300000});
			}
		},
		getItem:function(key){
			if(isWuHeng){
				return window.localStorage.getItem(key);
			}else{
				var name = getCookie(key);
				return name;
			}
		},
		clear:function(){
			if(isWuHeng){
				window.localStorage.clear();
			}else{
				clearCookie();
			}
		}
};
function isLocalStorageSupported() {
    var testKey = 'testWu',
        storage = window.sessionStorage;
    try {
        storage.setItem(testKey, 'testValue');
        storage.removeItem(testKey);
        return true;
    } catch (error) {
        return false;
    }
};
function getCookiesObj(){
   var cookies = {};
     if(document.cookie){
         var objs = document.cookie.split('; ');
         for(var i in objs){
             var index = objs[i].indexOf('='),
                 name = objs[i].substr(0, index),
                 value = objs[i].substr(index + 1, objs[i].length);    
             cookies[name] = value;
         }
     }
     return cookies;
};
function setCookie(name, value,opts){
     if(name && value){
         var cookie = encodeURIComponent(name) + '=' + encodeURIComponent(value);
         if(opts){
             if(opts.maxAge){
                 cookie += '; max-age=' + opts.maxAge; 
             }
         }
         document.cookie = cookie;
     }else{
         return '';
     }
};
//获取cookie
function getCookie(name){
    return decodeURIComponent(getCookiesObj()[name]) || null;
};
//清除所有cookie
function clearCookie(){
    var cookies = getCookiesObj();
    for(var key in cookies){
        document.cookie = key + '=; max-age=0';
    }
};
/*重新封装ajax
 * @param $.ajax上送参数
 * @auth wsl
 */
utils.ajax = function(opt){
	var _this = this;
//	var DateTime = new Date().getTime();
//	if(utils.Storage.getItem('username') && (DateTime - utils.Storage.getItem('time'))>1800000){
//		utils.Storage.clear();
//		utils.alert('您的登录已经超时，请重新登录！',function(){
//			window.location.href="login.html";
//		});
//	}else{
		//不对返回数据做缓存
		opt.type = 'POST';
		//备份opt中error和success方法
		var fn = {
			error:function(XMLHttpRequest, textStatus, errorThrown){},
			success:function(data, textStatus){}
		}
		//重写jquery ajax方法
		if(opt.success){
			fn.success = opt.success;
		}
		if(opt.error){
			fn.success = opt.error;
		}
		opt.success = function(result, textStatus){
			if(result.error == '9999'){
				utils.Storage.clear();
				utils.alert('您还未登录，请先登录',function(){
					window.location.href=utils.getBasePath()+"login.html";
				});
			}else if(result.error == '8888'){
				utils.Storage.clear();
				window.location.href="front/closeWeb.do";
			}else{
				fn.success(result, textStatus);
			}
		}
		var _data = opt.data;
		var _opt = $.extend({
			error:function(XMLHttpRequest, textStatus, errorThrown){
				//Alert("通讯失败,请检查网络连接状况！");
			},
			beforeSend:function(){
				//ajax发送之前
			},
			complete:function(){
				//ajax完成之后
			},
			data:_data,
		},opt);
		return $.ajax(_opt);
	//}
};
/*给表单添加状态
 * @auth wsl
 */
utils.initInput = function(){
	$('input').focus(function(){
		if($(this).siblings('label.icon')){
			$(this).parent('.from').addClass('focus');
		}
	}).blur(function(){
		if($(this).siblings('label.icon')){
			$(this).parent('.from').removeClass('focus');
		}
	})
}
/*金额格式校验
 * @param m 输入的金额
 * @auth wsl
 */ 
utils.isMoney = function(m){
	if(!AmtRegExp.test(m)){
		return true;
	}else{
		return false;
	}
};
/*手机校验
 * @param m 输入的手机号
 * @auth wsl
 */ 
utils.isPhone = function(m){
	if(!mobilePhone.test(m)){
		return true;
	}else{
		return false;
	}
};
/*邮箱校验
 * @param m 输入的邮箱号
 * @auth wsl
 */ 
utils.isEmail = function(m){
	if(Email.test(m)){
		return true;
	}else{
		return false;
	}
}
/*身份证校验
 * @param c 输入的身份证号
 * @auth wsl
 */ 
utils.isIdCard = function(c){
	if(idCard.test(c)){
		return true;
	}else{
		return false;
	}
}
/*金额逗号添加
 * @param value 输入的金额
 * @auth wsl
 */ 
utils.formatCurrency = function(value) {
	value = parseFloat(value).toFixed(2);
	var sb = '',ls = value.substring(value.indexOf('.'));
	for (var i=0, len=value.length-3; i<len; i++) {
		sb += value.charAt(i);
		if ((i+1) % 3 == len % 3 && (i+1) != len) {
			sb += ',';
		}
	}
	return sb+ls;
};
/*金额格式化
 * @param amt 输入的金额
 * @auth wsl
 */ 
utils.formatAmt = function(amt){
	return amt.toFixed(2);
}
/*银行卡加密显示
 * @param bank 输入银行卡账号
 * @auth wsl
 */ 
utils.encodeBank = function(bank){
	var bank = bank+'';
	return bank.substring(0,4)+' ******** '+bank.substring(bank.length-4,bank.length);
}
/*alert弹出框
 * @param text 弹出提示
 * @param fn 回调函数
 * @auth wsl
 */ 
utils.alert = function(text,fn){
    new Dialog(text,true,fn);
}
/*confirm确认框
 * @param text 弹出提示
 * @param fn 回调函数
 * @auth wsl
 */ 
utils.confirm = function(text,fn){
    new Dialog(text,false,fn);
}
/*获取URL后的传递参数
 * @param key 参数的传递字段
 * @auth wsl
 */ 
utils.getUrlParam=function(key){
    var href = window.location.href;
    var param = href.substr(href.indexOf('?')+1).split('&'),obj={};
    for(var i=0;i<param.length;i++){
        var arr = param[i].split('=');
        obj[arr[0]] = arr[1];
    }
    return obj[key];
};
function Dialog(text,flag,fn){
    if(flag){
        this.Dom = ['<div class="ui-dialog">',
            '<div class="ui-peek"></div>',
            '<div class="ui-content">',
                '<div class="dialog-text">',
                    '<p>{text}</p>',
                '</div>',
                '<div class="dialog-botton">',
                    '<button class="dialog-true" type="button">确定</button>',
                '</div>',
            '</div>',
        '</div>'].join("");
    }else{
        this.Dom = ['<div class="ui-dialog">',
            '<div class="ui-peek"></div>',
            '<div class="ui-content">',
                '<div class="dialog-text">',
                    '<p>{text}</p>',
                '</div>',
                '<div class="dialog-botton">',
                    '<a class="dialog-false" href="javascript:void(0);">取消</a>',
                    '<button class="dialog-true" type="button">确定</button>',
                '</div>',
            '</div>',
        '</div>'].join("");
    }
    if(fn)this.fn = fn;
    this.text = text;
    this.init();
}
Dialog.prototype.init = function(){
    this.initDom();
    this.initEvent();
    this.showDom();
};
Dialog.prototype.initDom = function(){
    var node = document.createElement('div');
    node.innerHTML = this.Dom.replace('{text}',this.text);
    this.dom = node.childNodes[0];
};
Dialog.prototype.initEvent = function(){
    var _this = this;
    if(document.addEventListener){
        this.dom.addEventListener('click',function(e){
            try{
                if(e.target.tagName == 'A'){
                    _this.hideDom();
                }else if(e.target.tagName == 'BUTTON'){
                    _this.hideDom(true);
                }
            }catch(a){
                if(e.srcElement.nodeName == 'A'){
                    _this.hideDom();
                }else if(e.srcElement.nodeName == 'BUTTON'){
                    _this.hideDom(true);
                }
            }
        }, false)
    }else{
        this.dom.attachEvent('onclick', function(e){
            try{
                if(e.target.tagName == 'A'){
                    _this.hideDom();
                }else if(e.target.tagName == 'BUTTON'){
                    _this.hideDom(true);
                }
            }catch(a){
                if(e.srcElement.nodeName == 'A'){
                    _this.hideDom();
                }else if(e.srcElement.nodeName == 'BUTTON'){
                    _this.hideDom(true);
                }
            }
        })
    }
};
Dialog.prototype.showDom = function(){
	var _this = this;
    document.body.appendChild(this.dom);
    setTimeout(function(){
    	_this.dom.setAttribute('class','ui-dialog transition');
    },100)
}
Dialog.prototype.hideDom = function(flag){
    if(flag){
        if(this.fn){
            this.fn.call(this,true);
            document.body.removeChild(this.dom);
        }else{
            document.body.removeChild(this.dom);
        }
    }else{
        document.body.removeChild(this.dom);
    }
};
/*发送短信验证码
 * @param obj获取验证码按钮$对象
 * @param phone 获取验证码手机号
 * @param name 获取验证码类型
 * @auth wsl
 */ 
utils.getSmsCode = function(obj,phone,name){
	if(obj.hasClass('disabled')){return;};
	if(!phone || phone == ''){
		utils.toast('请填写手机号');
		return;
	};
	obj.addClass('disabled'); 
	var param={
			cellPhone:phone,
			smsType:name
	}; 
	utils.ajax({
        url:'front/sendSMS.do',
        data:JSON.stringify(param),
        dataType:'json',
        success: function(data){
        	if(data.error =='0'){
        		var i = 60;
        		utils.time = setInterval(function(){
        			i--;
        			obj.text(i+'s');
        			if(i == 0){
        				obj.removeClass('disabled').text('获取验证码');
        				clearInterval(utils.time);
        			}
        		},1000);
        		obj.data('recivePhone',data.recivePhone);
        		obj.data('randomCode',data.randomCode);
        	}else{
        		utils.alert(data.msg);
        		obj.removeClass('disabled');
        		obj.data('error',data.msg);
        	}
        }
    });
};
/*前台数据分页
 * @param url 请求的url
 * @param param 上送参数
 * @param listelm 数据显示列表
 * @param elm 分页显示列表
 * @param listData 分页数据参数[]
 * @param fn 分页回调方法
 * @auth wsl
 */ 
function Page(url,param,listelm,elm,listData,fn){
	if(url == ''){
		utils.alert('url error');
	};
	this.minNumber = 10;
	this.Data;
	this.AllData;
	this.url = url;
	this.initPageNum = 1;//当前页
	this.pageTotalNum = 0;//总页数
	this.param = param;
	this.elm = elm;
	this.pageLoading = true;
	this.listelm = listelm;
	if(fn){this.fn = fn;}
	if(listData){this.listData = listData;};
	this.listelm.empty();
	this.elm.empty();
	this.initAjax();
}
//获取后台请求数据
Page.prototype.initAjax = function(num){
	var _this = this;
	if(num){
		_this.param.curPage = num;
	}else{
		_this.param.curPage = 1;
	};
	_this.listelm.empty();
	_this.listelm.addClass('list-loading');
	if(!_this.pageLoading)return;
	_this.pageLoading = false;
	utils.ajax({
        url:_this.url,
        data:JSON.stringify(_this.param),
        dataType:'json',
        success: function(data){
        	_this.listelm.removeClass('list-loading');
        	if(data.error == 0){
        		_this.Data = data['pageBean'].page;
        		_this.AllData = data;
        		_this.pageTotalNum = data['pageBean'].totalPageNum;
        		_this.initPageNum = _this.param.curPage;
        		if(_this.Data.length>0){
        			_this.initPage(_this.param.curPage);
        		}else{
        			var oLi = $('<li class="none">没有符合条件的内容！</li>');
        			var oHeight = _this.listelm.height();
        			if(oHeight>0){
        				oLi.css({'line-height':oHeight+'px'})
        			}else{
        				oLi.css({'line-height':'60px'});
        			}
        			oLi.appendTo(_this.listelm);
        			_this.elm.empty();
        			if(_this.fn){
        				_this.fn.call(_this,_this.AllData);
        			}
        		}
        	}else{
        		utils.alert(data.msg);
        	}
        }
    });
};
//初始化页面DOM数据
Page.prototype.initPage = function(num){
	var _this = this;
	this.elm.empty();
	//初始化数据
	if(this.listData){
		utils.initListData(this.listData,this.Data,this.listelm);
	};
	//pre
	var pre = $('<li><button type="button" class="pre">上一页</button></li>');
	pre.bind('click',function(){
		_this.Previou();
	});
	pre.appendTo(_this.elm);
	//生成页面列表
	if(_this.pageTotalNum>7){
		//first
		$('<li><button type="button" data-num="1">1</button></li>')
		.find('button').bind('click',function(){
			var index = $(this).data('num');
			if(index == _this.initPageNum)return;
			_this.toIndex(index);
		})
		.end()
		.appendTo(_this.elm);
		//center
		var x = 0;
		if(num>3 && (num+2)<_this.pageTotalNum){
			x=num-2;
		}else if(num+5>=_this.pageTotalNum){
			x=_this.pageTotalNum-5;
		}else{
			x=2;
		}
		//隐藏在开始之后
		if((num-2)>1){
			$('<li><span>...</span></li>').appendTo(_this.elm);
		};
		for(var i =x;i<=(x+4);i++){
			$('<li><button type="button" data-num="'+i+'">'+i+'</button></li>')
			.find('button').bind('click',function(){
				var index = $(this).data('num');
				if(index == _this.initPageNum)return;
				_this.toIndex(index);
			})
			.end()
			.appendTo(_this.elm);
		};
		//隐藏在结束之前
		if((x+2)<_this.pageTotalNum && (x+5)<_this.pageTotalNum){
			$('<li><span>...</span></li>').appendTo(_this.elm);
		};
		//last
		$('<li><button type="button" data-num="'+_this.pageTotalNum+'">'+_this.pageTotalNum+'</button></li>')
		.find('button').bind('click',function(){
			var index = $(this).data('num');
			if(index == _this.initPageNum)return;
			_this.toIndex(index);
		})
		.end()
		.appendTo(_this.elm);
	}else{
		for(var i =1;i<=_this.pageTotalNum;i++){
			var li = $('<li><button type="button" data-num="'+i+'">'+i+'</button></li>');
			li.find('button').bind('click',function(){
				var index = $(this).data('num');
				if(index == _this.initPageNum)return;
				_this.toIndex(index);
			});
			li.appendTo(_this.elm);
		};
	}
	//next
	var next = $('<li><button type="button" class="next">下一页</button></li>');
	next.bind('click',function(){
		_this.Next();
	});
	next.appendTo(_this.elm);
	_this.elm.find('li').eq(_this.initPageNum).addClass('active');
	//设置居中
	var liSize = _this.elm.find('li').size() - 2;
	liSize = liSize * 40 +180;
	_this.elm.css({'width':liSize+'px','margin':'30px auto 0'});
	$('[data-num="'+num+'"]').parent('li').addClass('active').siblings('li').removeClass('active');
	if(this.fn){
		this.fn.call(this,_this.AllData);
	}
	_this.pageLoading = true;
};
Page.prototype.Next = function(){
	if((Number(this.initPageNum)+1)>this.pageTotalNum){
		utils.toast('当前已经是最后一页了哦');
		return;
	}
	this.toIndex(Number(this.initPageNum)+1);
};
Page.prototype.Previou = function(){
	if((this.initPageNum-1)<1){
		utils.toast('当前已经是第一页了哦');
		return;
	}
	this.toIndex(Number(this.initPageNum)-1);
};
Page.prototype.toIndex = function(num){
	if(this.pageLoading==false)return;
	this.initAjax(num);
};
/*生成数据表格
 * @param list 分页数据参数[]
 * @param data 返回的单条数据
 * @param listelm 数据显示列表
 * @auth wsl
 */ 
utils.initListData = function(list,data,listelm){
	if(data.length>0){
		for(var i=0;i<data.length;i++){
			if((i+1)%2 == 1){
				var oLi = $('<li class="interval"></li>');
			}else{
				var oLi = $('<li></li>');
			}
			for(var j=0;j<list.length;j++){
				var oP = $('<div class="children'+j+'"></div>');
				var oValue = data[i][list[j]['key']];
				var oCallback = list[j]['resolve'].call(this,oValue,data[i],i);
				oP.html(oCallback);
				oP.appendTo(oLi);
			};
			oLi.appendTo(listelm); 
		}
	}
};
/*获取图形验证码
 * @param el 获取图形验证码的elm
 * @param type 获取验证码类型
 * @auth wsl
 */ 
utils.getImgCode = function(el,type){
	var timenow = new Date();
    var src = "imageCode.do?pageId="+type+"&d="+timenow;
    el.attr('src',src);
}
/*新手指引
 * 
 * 
 */
function newPointer(){
	//预先加载
	preloadImages(['src/images/new-step0.jpg','src/images/new-step1.jpg','src/images/new-step2.jpg','src/images/new-step3.jpg','src/images/new-step4.jpg','src/images/new-step5.jpg']);
	
	var oWidth = document.documentElement.offsetWidth;
	var i = 0;
	var oDiv = 
		$('<div class="new-peson-step"><a class="close" href="javascript:;"></a><a class="step" href="javascript:;"></a></div>')
		.appendTo($('body'));
	$('.step').click(function(){
		i++;
		if(i>5){
			oDiv.remove();
		}
		oDiv.attr('class','new-peson-step new-peson-step'+i);
	});
	//close
	$('.new-peson-step .close').click(function(){
		oDiv.remove();
	})
};
//图片加载
function preloadImages(arr){
	for(var i = 0; i < arr.length; i++) {
		$("<img />").attr('src', arr[i]);
		}
};
utils.getBasePath = function(){
	return "https://www.pujinziben.com/";
}

