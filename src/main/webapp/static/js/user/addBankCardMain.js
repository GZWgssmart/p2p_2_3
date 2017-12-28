$(function(){

  /********************
   *  开户页 reginfo
   ********************/

  // 切换touchend/click  pc时用click,手机时用touchend
  var clickTouch = ('ontouchstart' in document.documentElement) ? 'touchend' : 'click';

  //click to touch
  try{ FastClick.attach(document.body); }catch(e){}

  //调整帐号前缀所占用的长度
  $( window ).resize(function() {
    resetPrefixInput();
  });
  function resetPrefixInput(){
    $(".form-text-prefix").show();
    $(".form-text-prefix").next().width($('.form-unit-full').width()-$(".form-text-prefix").width()-5)
  }
  resetPrefixInput();


  function checkPhoneByAjax(){
      var $form = $('#quickPayBindingForm');
      //最后点提交按钮时, 跳过ajax查询
      checkAllInput($form,undefined,true);
      var checkNum = $form.find(".error.active").length;

      if(checkNum===0){
        //$(form).find(".btn-primary").removeClass('btn-primary').addClass('btn-disabled');
      }else{
        return;
      }
      var sendData = $form.serialize();
      $.ajax({
        url: phoneCheckUrl,
        type:"post",
        data: sendData,
        dataType: 'json',
        success:function(re){
          if(re.result==='success'){
            if(re.desc){
              if($("#modal-3").is(':visible')===false){
                modalShow('modal-3');
              }
              refreshQR(re.desc, re.uuid,re.faceVerifyCheckValue,$form);
            }else{
              $form.removeClass('checkAjaxForm').submit();
            }
          }else if(re.result==='error'){
            if(re.code==='236'){
              window.location.href = failPage;
            }else{
              alert(re.desc);
            }
          }
        }
      });
    }

  window.checkPhoneByAjax = checkPhoneByAjax;

  // 表单提交
  $('.serverActive').addClass("active");
  $(document).on('submit','form.validate-form',function(e){
    e.preventDefault();
    formSubmit(this);
  })
  $(document).on('click','form.validate-form .form-btns .btn-primary',function(e){
      formSubmit($(this).closest("form"));
  })
  function formSubmit(form){
    if($("#isPbcMoneyLimit").val()==='Y'){
      try {
        TCA.config(config);
        if(!$("#signStr").val()){
          alert("数字证书助手安装成功后需重启浏览器后继续交易。");
          return;
        }
      } catch (e) {
        if (e instanceof TCACErr) {
          if (confirm('请点击确定下载数字证书助手，待下载并安装完成后重启浏览器继续进行交易。')) {
            window.location.href = "http://vnetcdn-download.chinapnr.com/itrusweb/statics/download/天诚安信数字证书助手-3.2.0.2-20160706.exe";
          }
        }
        return;
      }
    }
    if(checkingNum>0){
      alert("正在校验请稍后重新点击确定按钮");
      return;
    }

    //最后点提交按钮时, 跳过ajax查询
    checkAllInput(form,undefined,true);
    var checkNum = $(form).find(".error.active").length;

    if(checkNum===0){
      $(form).find(".btn-primary").removeClass('btn-primary').addClass('btn-disabled');
      var usrId = $("input[name=usrId]");
      if(usrId.length>0){
        $(form).find("input[name=loginId]").val(usrPrefix+$(form).find("input[name=usrId]").val());
      }
      form.submit();
    }else{
      //alert("失败："+checkNum);
    }
  }

  //后台验证出错显示
  //$(".dalayActive").addClass("active");

  //检查所有form里的字段是否合法，页面刚打开时，require字段需要忽略
  checkAllInput($(".validate-form"),true);

  $(document).on('focus','input.form-unit',function(e){
    var form  = $(this).closest(".form");
    var group = $(this).closest('.form-group');
    //当input得到焦点时，先去除原有打开的标签，然后显示 tip 
    $(group).find(".active").removeClass("active");
    $(group).find(".tip").addClass("active");

    //焦点至一组相当项的第一个input时，第二个的提示将隐藏（ie6层的BUG）
    if($(this).attr("equal")!==undefined){
      var equal       = $(form).find("input[name="+$(this).attr("equal")+"]"); 
      var thisTip     = $(group).find(".equal");
      var equalGroup  = $(equal).closest('.form-group');
      var equalTip    = $(equalGroup).find(".active");
      var equalOkay   = $(equalGroup).find(".okay");

      if(thisTip.length === 0){
        equalTip.removeClass("active");
      }
    }
  })
  // 失焦时检查
  $(document).on('blur','input.form-unit',function(e){
    //先关闭所有打开的标签，取消出错红框
    $(this).removeClass("form-unit-error");
    $(this).closest('.form-group').find(".active").removeClass("active");

    setSingleInputAfterCheck(this)
  })
  //如果checkbox是必填
  $(document).on('click','input[type=checkbox]',function(e){
    if ($(this).attr('required')==="required" && $(this).attr('checked')!=="checked"){
      $(this).addClass("form-unit-error");
      $(this).closest('.form-group').find(".required").addClass("active");
    }else{
      $(this).removeClass("form-unit-error");
      $(this).closest('.form-group').find(".active").removeClass("active");
    }
  })

  $(document).on('change','select',function(e){
    if ($(this).attr('required')==="required" && $(this).val()==="plasechoose"){
      $(this).addClass("form-unit-error");
      $(this).closest('.form-group').find(".required").addClass("active");
    }else{
      $(this).removeClass("form-unit-error");
      $(this).closest('.form-group').find(".active").removeClass("active");
    }
  })

  //检查所有不是hidden的input
  function checkAllInput(form,skipRequire,skipAjax){
    $(form).find("input, textarea, select").each(function () {
      if ($(this).closest('.form-group').length===0 || $(this).closest('.form-group').is(':hidden')) return;
      setSingleInputAfterCheck(this, skipRequire, skipAjax);
    })
    //$(".form-unit-error").first().focus();
    if(!skipRequire){
      goToError();
    }
  }

  window.checkAllInput = checkAllInput;

  function setSingleInputAfterCheck(input,skipRequire,skipAjax){

    if($(input).closest('.form-group').find(".active").length>0) return;

    var checkReturn = checkSingleInput(input,skipRequire,skipAjax);
    if (checkReturn==="skip") return;
    if (checkReturn!==undefined){
      markTip(checkReturn,input);
    }else{
      $(input).closest('.form-group').find(".okay").addClass("active"); 
    }
  }

  var checkingNum = 0;
  function getSingleCheckByAjax(url,data,input,inputExt){
    //url = url.substr(1);
    checkingNum++;
    $.ajax({
      url: url,
      type: 'post',
      dataType: 'json',
      data: data
    })
    .done(function(resp) {
      if(resp.error){
        var err = ["errorInfo",resp.error];
        markTip(err,input);
      }else{
        if(!$(input).is(":focus")){
          markTip("okay",input);
        }
        if(!$(inputExt).is(":focus")){
          markTip("okay",inputExt);
        }
        if(resp.isNeedPicCode){
          if(resp.isNeedPicCode==="Y"){
            if(!$(".form-group-imgCode").is(":visible")){
              $(".form-group-imgCode").find(".active").removeClass("active");
              $(".form-group-imgCode").find(".form-unit-error").removeClass("form-unit-error");
              $(".form-group-imgCode").slideDown();
            }
          }else{
            $(".form-group-imgCode").find(".active").removeClass("active");
            $(".form-group-imgCode").find(".form-unit-error").removeClass("form-unit-error");
            $(".form-group-imgCode").slideUp();
          }
        }
      }
    }).always(function(resp) {
      //alert(resp);
      $(input).closest('.form-group').find(".checking").removeClass("active");
      checkingNum--;
    })
  }

  function checkSingleInput(input,skipRequire,skipAjax){

    var re = $(input).val();
    var form = $(input).closest(".form");
    var group = $(input).closest(".form-group");

    // 省份城市，所在银行 特殊情况
    if(group.find("input:hidden").length > 0){
      if(skipRequire){
        return "skip";
      }
      var temp=0;

      group.find("input").each(function(){
        if($(this).attr("required") && this.value===''){
          temp++;
        }
      })

      if(temp===0){
        group.find(".form-tips.okay").addClass('active');
      }else{
        group.find(".form-tips.required").addClass('active');
        group.find(".form-unit").addClass('form-unit-error');
      }
      return "skip";
    }

    //

    //不包括任何条件则跳过
    if ( $(input).attr("required")===undefined &&
         $(input).attr("match")===undefined &&
         $(input).attr("equal")===undefined &&
         $(input).attr("diff")===undefined
    ) return "skip";
    //确认必填项
    if($(input).attr("required")==="required" && 
      (re ==="" || ($(input).attr('type')==="checkbox" && $(input).attr('checked')!=="checked") || (input.tagName==="SELECT" && re === "plasechoose"))
    ){
      if(skipRequire){
        return "skip";
      }
      return "required";
    }

    //确认match条件
    // mobile:   1开头的11位数字;
    // email:    x@x.x
    // usrId:    帐号长度6-25位
    // userPw:   密码长度6-16位
    // transPwd: 8-16位，包含数字/字母/符号的2种组合
    // smsCode:  6位数字
    // captcha:  4位数字或字母
    // bankCard: 10-32位数字
    var match = $(input).attr("match");
    var name  = $(input).attr("name");

    if(match!==undefined){
      if (re==="") return "skip";
      var matchs=[];
      matchs["usrMp"]  = new RegExp(/^1[0-9]{10}$/);
      matchs["cardMp"]  = new RegExp(/^1[0-9]{10}$/);
      matchs["email"]   = new RegExp(/^([a-zA-Z0-9_\.\-]+)(@{1})([a-zA-Z0-9_\.\-]+)(\.[a-zA-Z0-9]{1,3})$/);
      matchs["usrId"]  = new RegExp(/^[0-9a-zA-Z_.@-]{6,25}$/);
      matchs["userPw"]  = new RegExp(/^.{6,16}$/);
      matchs["transPwd"]  = new RegExp(/^(?![A-Z]+$)(?![a-z]+$)(?!\d+$)(?![\W_]+$)\S{8,16}$/);
      matchs["smsCode"]  = new RegExp(/^0?\d{6}$/);
      matchs["captcha"]  = new RegExp(/^.{4}$/);
      matchs["bankCard"]  = new RegExp(/^[0-9]{10,32}$/);

      //判断密码强度
      if (match==="userPw"){
        setPwdStr(input);
      }

      if (!re.match(matchs[match]) || (match==="certId" && name==="certId" && !getIdCardInfo(re).isTrue)) { 
        return "match";
      }

      var merCustId = $("#merCustId").val();
      if(!skipAjax){
        if (match==="usrId"){
          getSingleCheckByAjax(checkLoginIdURL,{
            loginId: $("#usrPrefix").val()+re,
            merCustId: merCustId
          },input)
          return "checking";
        }else if (match==="certId"){
          var usrName = $("input[name=usrName]").val(),
              certId  = $("input[name=certId]").val()
          $("input[name=certId]").closest(".form-group").removeClass("active");
          $("input[name=usrName]").closest(".form-group").removeClass("active");
          if(usrName!=="" && certId!==""){
            getSingleCheckByAjax(checkCertIdURL,{
              usrName: usrName,
              certId: certId,
              merCustId: merCustId,
              certType: $("#certType").val()
            },$("input[name=certId]"),$("input[name=usrName]"))
            markTip("checking",$("input[name=certId]"))
            return "skip";
          }else{
            if(usrName===""){
              markTip("required",$("input[name=usrName]"))
            }
            return "skip";
          }
        }else if (match==="usrMp"){
          getSingleCheckByAjax(checkUsrMpURL,{
            usrMp: re,
            merCustId: merCustId
          },input)
          return "checking";
        }
      }
    }
    //必须相同
    if($(input).attr("equal")!==undefined){
      //需要与其相同的input
      var equal     = $(form).find("input[name="+$(input).attr("equal")+"]"); 

      //如果是密码框取 pname(post name) JIRA: PTPBC-1524 
      if(equal.length===0 && $(input).attr("type")==="password"){
        equal       = $(form).find("input[pname="+$(input).attr("equal")+"]");
      }

      var reEqual   = $(equal).val();
      var thisTip   = $(input).closest('.form-group').find(".equal");
      var equalTip  = $(form).find(equal).closest('.form-group').find(".equal");
      var thisOkay  = $(input).closest('.form-group').find(".okay");
      var equalOkay = $(equal).closest('.form-group').find(".okay");

      //如果两个任意一个为空，则忽略;
      if(reEqual!=="" && re!=="" ){
        if(re!==reEqual){
          if(thisTip.length === 0){
            equalOkay.removeClass("active");
            markTip("equal",equal);
          }else{
            thisOkay.removeClass("active");
            return "equal";
          }
        }else{
          if(thisTip.length === 0){
            equalTip.removeClass("active");
            equal.removeClass("form-unit-error");
            equalOkay.addClass("active");
          }
        }
      }else{
        if(thisTip.length === 1){
          //当第一项为空,第二项输入任何都不打勾
          return "skip";
        }
      }
    }

    //必须不同
    if($(input).attr("diff")!==undefined){
      var diff = $(form).find("input[name="+$(input).attr("diff")+"]");
      var reDiff = $(diff).val();
      var thisTip = $(input).closest('.form-group').find(".diff");
      var diffTip = $(form).find(diff).closest('.form-group').find(".diff");
      var thisOkay = $(input).closest('.form-group').find(".okay");
      var diffOkay = $(diff).closest('.form-group').find(".okay");

      //如果两个任意一个为空，则忽略;
      if(reDiff!=="" && re!==""){
        if(re===reDiff){
          if(thisTip.length === 0){
            diffOkay.removeClass("active");
            markTip("diff",diff);
          }else{
            thisOkay.removeClass("active");
            return "diff";
          }
        }else{
          if(thisTip.length === 0){
            $(diffTip).removeClass("active");
            $(diff).removeClass("form-unit-error");
            diffOkay.addClass("active");
          }
        }
      }
    }
  }

  //标记错误
  function markTip(type,input){
    if($(input).closest('.form-group').find('.serverActive.active').length>0) return;
    var tip;
    if(typeof type==="object"){
      tip = type[0];
      $(input).closest('.form-group').find("."+tip+" p").text(type[1]);
    }else{
      tip = type;
    }
    if(tip!=='checking' && tip!=='okay'){
      $(input).addClass("form-unit-error");
    }else{
      $(input).removeClass("form-unit-error");
    }
    //先清除原有的
    $(input).closest('.form-group').find(".form-tips").removeClass("active");
    $(input).closest('.form-group').find("."+tip).addClass("active");
  }
  function goToError(){
    //移动至出错提示标签位置
    var focusInput = $(".errFocus .form-unit-error").first();
    if(focusInput.length>0 ){
      $('html,body').animate({scrollTop: $(focusInput).offset().top-50},'medium', function(){
        //$(focusInput).focus();
      });
    }
  }

  // 密码安全等级
  $(document).on('keyup','.form-unit-pwdStr',function(e){
    setPwdStr(this);
  })
  function setPwdStr(input){
    var re = $(input).val();
    var w = pwdStrength(re);
    var g = $(input).closest(".form-group");
    var pwi = $(g).find(".pw-secure i");
    var pwb = $(g).find(".pw-secure b");
    pwb.css("background-color","#e4e7ea");
    if (w===0){
      $(pwi).removeClass().addClass("pw-secure-none");
      $(g).find(".pw-secure-text").text('无').css("color","#666");

    }else if (w===1){
      $(pwi).removeClass().addClass("pw-secure-low");
      $(g).find(".pw-secure-text").text('低').css("color","#dc7018");
      $(pwb).last().css("background-color","#dc7018");
    }else if (w===2){
      $(pwi).removeClass().addClass("pw-secure-med");
      $(g).find(".pw-secure-text").text('中').css("color","#ff9c00");
      $(pwb).parent().find("b:gt(1)").css("background-color","#ff9c00");
    }else if (w===3){
      $(pwi).removeClass().addClass("pw-secure-high");
      $(g).find(".pw-secure-text").text('高').css("color","#009900");
      $(pwb).css("background-color","#009900");
    }
  }
  function pwdStrength(str){
    var characters     = 0;
    var capitalletters = 0;
    var loweletters    = 0;
    var number         = 0;
    //var special = 0;

    var upperCase = new RegExp('[A-Z]');
    var lowerCase = new RegExp('[a-z]');
    var numbers   = new RegExp('[0-9]');
    //var specialchars = new RegExp('([!,%,&,@,#,$,^,*,?,_,~])');

    if (str.match(upperCase)) { capitalletters = 1} else { capitalletters = 0; };
    if (str.match(lowerCase)) { loweletters = 1}    else { loweletters = 0; };
    if (str.match(numbers))   { number = 1}         else { number = 0; };
    //if (str.match(specialchars)) { special = 1}  else { special = 0; };

    var weight = 0;
    if (str.length>=6){
      weight = capitalletters + loweletters + number;// + special;
    }
    return weight;
  }

  //检验身份证
  //http://leeyee.github.io/blog/2013/07/31/javascript-idcard-validate/
  function getIdCardInfo(cardNo) {

    var info = {
        isTrue : false,
        year : null,
        month : null,
        day : null,
        isMale : false,
        isFemale : false
    };

    //跳过身份证验证
    info.isTrue = true;
    return info;
    //跳过身份证验证

    if (!cardNo && 15 != cardNo.length && 18 != cardNo.length) {
        info.isTrue = false;
        return info;
    }
    if (15 == cardNo.length) {
        var year = cardNo.substring(6, 8);
        var month = cardNo.substring(8, 10);
        var day = cardNo.substring(10, 12);
        var p = cardNo.substring(14, 15); //性别位
        var birthday = new Date(year, parseFloat(month) - 1,
                parseFloat(day));
        // 对于老身份证中的年龄则不需考虑千年虫问题而使用getYear()方法
        if (birthday.getYear() != parseFloat(year)
                || birthday.getMonth() != parseFloat(month) - 1
                || birthday.getDate() != parseFloat(day)) {
            info.isTrue = false;
        } else {
            info.isTrue = true;
            info.year = birthday.getFullYear();
            info.month = birthday.getMonth() + 1;
            info.day = birthday.getDate();
            if (p % 2 == 0) {
                info.isFemale = true;
                info.isMale = false;
            } else {
                info.isFemale = false;
                info.isMale = true
            }
        }
        return info;
    }
    if (18 == cardNo.length) {
        var year = cardNo.substring(6, 10);
        var month = cardNo.substring(10, 12);
        var day = cardNo.substring(12, 14);
        var p = cardNo.substring(14, 17)
        var birthday = new Date(year, parseFloat(month) - 1,
                parseFloat(day));
        // 这里用getFullYear()获取年份，避免千年虫问题
        if (birthday.getFullYear() != parseFloat(year)
                || birthday.getMonth() != parseFloat(month) - 1
                || birthday.getDate() != parseFloat(day)) {
            info.isTrue = false;
            return info;
        }
        var Wi = [ 7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8, 4, 2, 1 ];// 加权因子
        var Y = [ 1, 0, 10, 9, 8, 7, 6, 5, 4, 3, 2 ];// 身份证验证位值.10代表X
        // 验证校验位
        var sum = 0; // 声明加权求和变量
        var _cardNo = cardNo.split("");
        if (_cardNo[17].toLowerCase() == 'x') {
            _cardNo[17] = 10;// 将最后位为x的验证码替换为10方便后续操作
        }
        for ( var i = 0; i < 17; i++) {
            sum += Wi[i] * _cardNo[i];// 加权求和
        }
        var i = sum % 11;// 得到验证码所位置
        if (_cardNo[17] != Y[i]) {
            return info.isTrue = false;
        }
        info.isTrue = true;
        info.year = birthday.getFullYear();
        info.month = birthday.getMonth() + 1;
        info.day = birthday.getDate();
        if (p % 2 == 0) {
            info.isFemale = true;
            info.isMale = false;
        } else {
            info.isFemale = false;
            info.isMale = true
        }
        return info;
    }
    return info;
  }

  //手机短信验证
  var sendInt;
  var sendedSms = false;
  $(document).on('click', "#sms-submit-btn.btn-secondary" ,function(){
    var self = $(this);
    var form = $(this).closest("form");
    var inputUsrMp   = $("input[name=usrMp]");
    var inputCardMp  = $("input[name=cardMp]");
    var inputCaptcha = $("input[name=captcha]");
    var inputBankId  = $("input[name=bankId]");
    var inputCardId  = $("input[name=cardId]");

    var inputUsrMpGroup   = $(inputUsrMp).closest('.form-group');
    var inputCardMpGroup  = $(inputCardMp).closest('.form-group');
    var inputCaptchaGroup = $(inputCaptcha).closest('.form-group');
    var inputBankIdGroup  = $(inputBankId).closest('.form-group');
    var inputCardIdGroup  = $(inputCardId).closest('.form-group');

    //
    if(self.data('url').indexOf("ajax/cardSigning") > 0){
      setSingleInputAfterCheck(inputBankId);
      setSingleInputAfterCheck(inputCardId);
    }

    // 查看手机号是否合法
    setSingleInputAfterCheck(inputUsrMp);
    setSingleInputAfterCheck(inputCardMp);
    if(inputCaptcha.is(":visible")) setSingleInputAfterCheck(inputCaptcha);

    if(inputUsrMpGroup.find(".error.active:visible").length   ===0 &&
       inputCardMpGroup.find(".error.active:visible").length  ===0 &&
       inputCaptchaGroup.find(".error.active:visible").length ===0 &&
       inputBankIdGroup.find(".error.active:visible").length  ===0 &&
       inputCardIdGroup.find(".error.active:visible").length  ===0 ){

      self.addClass("btn-disabled").removeClass("btn-secondary");

      try{
        var checkUsrMpURL = window.checkUsrMpURL;
      }catch(e){
        var checkUsrMpURL = undefined;
      }

      if(self.data('url').indexOf("ajax/sendQPSmsCode") > 0 || self.data('parameter')){
        checkSmsCode(self.data('url'), self.data('parameter'));
      }else{
        if(checkUsrMpURL){
          if (inputCaptcha.is(":visible") && sendedSms){
            sendedSms = false;
            var err = ["errorInfo","图片已过期，请重新输入"];
            markTip(err,inputCaptcha);
            resetImgCode();
            self.removeClass("btn-disabled").addClass("btn-secondary");
            return;
          }
          $.ajax({
            url: checkUsrMpURL,
            type: 'post',
            dataType: 'json',
            data: {
              'usrMp'    : inputUsrMp.val(),
              'merCustId': $("#merCustId").val()
            }
          })
          .done(function(re) {
            if(re.error){
              var err = ["errorInfo",re.error];
              markTip(err,inputUsrMp);
            }else{
              if(re.isNeedPicCode==="Y"){
                if(!$(".form-group-imgCode").is(":visible")){
                  $(".form-group-imgCode").find(".active").removeClass("active");
                  $(".form-group-imgCode").find(".form-unit-error").removeClass("form-unit-error");
                  $(".form-group-imgCode").slideDown();
                  self.removeClass("btn-disabled").addClass("btn-secondary");
                }else{
                  checkSmsCode();
                }
              }else{
                $(".form-group-imgCode").find(".active").removeClass("active");
                $(".form-group-imgCode").find(".form-unit-error").removeClass("form-unit-error");
                $(".form-group-imgCode").slideUp();
                checkSmsCode();
              }
            }
          })
        }
        if(inputCardMp.length===1){
          checkSmsCode(self.data('url'));
        }
      }
    }
  });

  var codeImgCount = [];
  var sendInt = [];
  //var imgSessionId;
  function checkSmsCode(url, parameter){
    var btn = $('#sms-submit-btn');
    if(parameter){
      var dataArr = parameter;
    }else{
      if(url && url.indexOf("ajax/sendQPSmsCode") > 0){
        var dataArr = btn.closest('form').serialize();
      }else{
        var usrMpData;
        if($("input[name=usrMp]").attr('type')==='hidden'){
          usrMpData = $("input[name=cardMp]").val() || $("input[name=divUsrMp]").val();
        }else{
          usrMpData = $("input[name=usrMp]").val() || $("input[name=cardMp]").val() || $("input[name=divUsrMp]").val();
        }
        var dataArr = {
          'usrMp' : usrMpData,
          'divUsrMp':$("input[name=divUsrMp]").val(),
          'encrptMP':$("input[name=encryptUsrMp]").val()
        }
      }
    }

    if($("input[name=captcha]").length === 1){
      dataArr['imageUniqueId'] = $("input[name=imageUniqueId]").val();
      dataArr['verifyCode'] = $("input[name=captcha]").val();
    }
    if(url && url.indexOf("ajax/cardSigning") > 0){
      dataArr['bankId'] = $("input[name=bankId]").val();
      dataArr['cardId'] = $("input[name=cardId]").val();
      dataArr['custId'] = $("input[name=usrCustId]").val();
      dataArr['merCustId'] = $("input[name=merCustId]").val();
    }

    $.ajax({
      url: btn.data('url'),
      type: 'post',
      dataType: 'json',
      data: dataArr
    })
    .done(function(re) {
      if (re.result==="success"){
        //resetModal();
        //modalHide('modal-1');
        btn.addClass("btn-disabled").removeClass("btn-secondary");
        alert("短信验证码已发送至您的手机，请注意查收！");
        btnColddown(btn);
        sendedSms = true;
        if( re.insertDate ){
          $("#insertDate").val(re.insertDate);
        }
        if( re.pnrpayTraceNo ){
          $("#pnrpayTraceNo").val(re.pnrpayTraceNo);
        }
        if( re.orderId ){
          $("#orderId").val(re.orderId);
        }
        if( re.smsSender ){
          $("#smsSender").val(re.smsSender);
        }
        if( re.smsMd5Str ){
          $("#smsMd5Str").val(re.smsMd5Str);
        }
      }else if (re.result==="smsVerifyCodeError"){
        var err = ["errorInfo", re.desc];
        markTip(err,$("input[name=captcha]"));
        resetImgCode();
        btn.removeClass('btn-disabled').addClass('btn-secondary');
      }else{
        if(re.result==="needVerifyCode"){
          $(".form-group-imgCode").find(".active").removeClass("active");
          $(".form-group-imgCode").find(".form-unit-error").removeClass("form-unit-error");
          $(".form-group-imgCode").slideDown();
          //imgSessionId = re.sessionId;
          //$("#imageUniqueId").val(re.sessionId);
          //resetModal();
          //modalShow('modal-1');
          resetImgCode();
        }else{
          alert(re.desc);
          resetImgCode();
        }
        btn.removeClass('btn-disabled').addClass('btn-secondary');
      }
      $("#modal-1").find(".btn-disabled").removeClass('btn-disabled').addClass('btn-primary');
    })
  }

  function btnColddown(btn){
    var action = btn.closest("form").attr('action');
    codeImgCount[action] = 60;
    btn.find("span").text("重新发送("+codeImgCount[action]+")");
    sendInt[action] = setInterval(function(){
      codeImgCount[action]--;
      btn.find("span").text('重新发送('+codeImgCount[action]+')');
      if(codeImgCount[action]<=0){
        btn.removeClass('btn-disabled').addClass('btn-secondary');
        btn.find("span").text('发送验证码');
        clearInterval(sendInt[action]);
      }
    },1000);
  }

  function resetModal(){
    var input = $("input[name=captcha]");
    input.val('').removeClass("form-unit-error");
    input.closest('.form-group').find(".active").removeClass("active");
    input.closest('.form-group').find('img').hide();
  }

  $(document).on('click', ".btn-captcha" ,function(){
    sendedSms = false;
    resetImgCode();
  })

  /***** 只有cashConfirm3.ftl 文件在用？ 弹出框短信已不用
  $(document).on('submit','.modal form',function(e){
    e.preventDefault();
    smsImgCodeSubmit(this);
  })
  $(document).on('click','.modal form .btn-primary',function(e){
    smsImgCodeSubmit($(this).closest("form"));
  })
  function smsImgCodeSubmit(form){
    if(checkingNum>0){
      alert("正在校验请稍后重新点击确定按钮");
      return;
    }

     //最后点提交按钮时, 跳过ajax查询
    checkAllInput(form,undefined,true);
    var checkNum = $(form).find(".error.active").length;

    if(checkNum>0){
      goToError();
      return;
    }
    if(checkNum===0){
      $(form).find(".btn-primary").removeClass('btn-primary').addClass('btn-disabled');
      checkSmsCode(true);
    }else{
      //alert("失败："+checkNum);
    }
  }
  *****/

  // 页脚说明
  $(document).on(clickTouch,'.secure-tips',function(e){
    var con = $(this).find(".content");
    con.toggle();
    $(this).find("i").css('-webkit-transform','scaleY('+(con.is(":visible")?'-1':'1')+')')
    $('html,body').animate({scrollTop: $(this).offset().top+150},'medium', function(){
        //$(focusInput).focus();
    });
  })


  /********************
   *  充值页 chargeChannel
   ********************/

  setCharge(0);

  function setCharge(type){
    $(".recharge-type").removeClass("recharge-type-on");
    $(".recharge-type").eq(type).addClass("recharge-type-on");

    $(".recharge-type-div:visible").css("height","0");//.hide();
    $(".recharge-type-div").eq(type).css("height","auto");//.show();
  }

  $(document).on('click','.recharge-type',function(e){
    var idx = $(this).index();
    setCharge(idx);
  })

  $(document).on('click','.recharge-type-div .bank-list a',function(e){
    $(this).closest('.recharge-type-div').find(".on").removeClass('on');
    $(this).addClass("on");
  })

  /********************
   *  绑卡页 quickPayConfirm
   ********************/

  //返回时填地区
  console.log($(".tips-list-prov a").length);
  if ($('input[name=provId]').val() && $(".tips-list-prov a").length>=1){
    $(".tips-list-prov a").each(function(){
      if($('input[name=provId]').val()===$(this).attr("rel")){
        $(this).addClass('on');
        $(".form-group-prov-city .form-unit-info span").text('');
        $(".form-group-prov-city .form-unit-info b").text($(this).find("span").text());
      }
    });
    $.ajax({
      url: queryAreaByProvUrl,
      type: 'post',
      dataType: 'json',
      data: {
        provId:$('input[name=provId]').val()
      }
    })
    .done(function(resp) {
      var re="";
      for (var i in resp){
        re += '<a href="javascript:void(0)" rel="'+resp[i].areaId+'"';
        if(resp[i].areaId===$('input[name=areaId]').val()){
          re += ' class="on"';
          if(resp.length===1) return;
          $(".form-group-prov-city .form-unit-info b").text($(".tips-list-prov .on").text()+ " " +resp[i].areaName);
        }
        re += '><span>'+resp[i].areaName+'</span></a>';
      }
      $(".tips-list-city").html(re);
    })
  }
  //返回时填银行
  if ($('.showBankId').val()){
    $(".tips-list-bank a").each(function(){
      if($('input[name=bankId]').val()===$(this).attr("rel")){
        $(this).addClass('on');
        var formGroup = $('input[name=bankId]').closest('.form-group');
        $(formGroup).find(".form-unit-info span").text('');
        $(formGroup).find(".form-unit-info b").text($(this).find("span").text()).addClass('form-unit-icon').css('background-image','url('+staticsRoot+'/common/images/bank/sml/'+$(this).attr('rel')+'.png)');
        $(formGroup).find(".okay").addClass('active');
      }
    })
    if($(".tips-list-bank a").length>0){
      showBankInfo($(".tips-list-bank .on"));
    }
    $("#link-check").text("查看限额");
  }

  if ($('.showGateBankId').val()){
    showBankInfo();
  }
  function showBankInfo(bank){
    var lvl = bank ? $(bank).data('elementlvl') : $("input[name=elementLevel]").val();
    var needsign = bank ? $(bank).data('needsign') : $("input[name=needSign]").val();

    var formGroup = $('input[name=bankId]').closest('.form-group');
    $(formGroup).find(".form-unit-info b").addClass('form-unit-icon').css('background-image','url('+staticsRoot+'/common/images/bank/sml/'+$('input[name=bankId]').val()+'.png)');

    //银行预留手机
    checkBankPhone(lvl);

    //无卡支付业务
    if(needsign===true || needsign==='true'){
      $("#link-needSign").show();
    }
  }

  //银行卡显示放大
  $(document).on('focus','input[name=cardId]',function(e){
      checkCardId(this,'focus');
  })
  $(document).on('blur','input[name=cardId]',function(e){
    checkCardId(this,'blur');
  })
  $(document).on('keyup','input[name=cardId]',function(e){
    checkCardId(this,'keyup');
  })

  if($('input[name=cardId]').length>=1){
    checkCardId($('input[name=cardId]'),'blur');
  }

  function checkCardId(input, action){
    var $t = $(input).parent().find('.tips-card-zoom');
    var v = $(input).val();
    //放大显示
    v!=="" ? $t.show() : $t.hide();
    $t.text(v.replace(/(\d{4})(?=\d)/g,"$1 "));

    try{
        var trytry = checkCardBankUrl;
    }catch(e){
        checkCardBankUrl = false;
    }

    if(checkCardBankUrl){
      if(v.length<10){
        $('.form-group-card').slideUp('fast');
      }else{
        if( action==='blur' ||  (action==='keyup' && $(input).data('value') !== v.substring(0,10)) ){
          $.ajax({
            url: checkCardBankUrl,
            type: 'post',
            dataType: 'json',
            data: {
              cardId: v,
              merCustId:$("input[name=merCustId]").val(),
              gateBusiId:$("input[name=gateBusiId]").val()
            },
            success:function(re){
              if(re.error){
                var err = ["errorInfo",re.error];
                markTip(err,input);
              }else{
                $('.form-group-card').slideDown('fast');
                if(re.bankId){
                  $('.form-group-card input[name=bankId]').val(re.bankId);
                  $('.form-group-card .form-unit-info b').text(re.bankName).addClass('form-unit-icon').css('background-image','url('+staticsRoot+'/common/images/bank/sml/'+re.bankId+'.png)');
                }
              }
            }
          })
        }
        //记录输入卡号的前十位, 避免频繁异步读取
        $(input).data('value', v.substring(0,10));
      }
    }
  }

  $(document).on('click','.tip-card-city',function(e){
    e.stopPropagation();
  })
  var openSelect = null;
  $(document).on('click','.form-unit-action',function(e){
    e.stopPropagation();

    if(openSelect !== null && ( $(openSelect)[0] === $(this).closest('.form-group').find('.form-tips.tip')[0])){
      closeSelect();
    }else{
      closeSelect();
      $(this).addClass('form-unit-active');
      openSelect = $(this).closest('.form-group').find('.form-tips.tip').addClass("active");
    }

    var tw;
    if($(window).width()<=963){
      tw = $(this).outerWidth();
    }else{
      tw = 540;
    }

    $(openSelect).find(".form-tips-content").outerWidth(tw);
  })

  //省份/城市/银行 列表公用操作
  $(document).on('click','.tips-list-bank a, .tips-list-prov a, .tips-list-city a',function(e){
    e.stopPropagation();
    $(this).addClass('on').siblings().removeClass('on');
  })

  //银行列表选择
  $(document).on('click','.tips-list-bank a',function(e){
    var root = $(this).closest('.tips-content-long');
    root.closest('.form-group').find(".form-unit span").text('');
    root.closest('.form-group').find(".form-unit b").text($(this).text()).addClass('form-unit-icon').css('background-image','url('+staticsRoot+'/common/images/bank/sml/'+$(this).attr('rel')+'.png)');

    $("input[name=bankId]").val($(this).attr('rel'));
    $("#link-needSign").hide();
    if($(this).data('needsign')===true){
      $("#link-needSign").show();
    }
    checkBankPhone($(this).data('elementlvl'));
    $("#link-check").text("查看限额");
    /*$(this).closest(".form-group").addClass("link-check-top");*/
    closeSelect();
  })

  function checkBankPhone(elvl){
    if(!$("#elementLevel").val() || parseInt($("#elementLevel").val()) !== parseInt(elvl)){
      $("#elementLevel").val(elvl)
    }

    if(parseInt(elvl)===4){
      $(".form-group-cardMp, .form-group-smsCode").show();
      $(".form-group-cardMp input[name=cardMp], .form-group-smsCode input[name=smsCode]").attr("required","required")
      .closest(".form-group").find(".active").not('.serverActive').removeClass("active");
    }else{
      removeBankPhone();
    }
  }
  function removeBankPhone(){
    $(".form-group-cardMp, .form-group-smsCode").hide();
    $(".form-group-cardMp input[name=cardMp], .form-group-smsCode input[name=smsCode]").removeAttr("required").val("")
        .closest(".form-group").find(".active").not('.serverActive').removeClass("active");
  }

  //省份列表选择
  $(document).on('click','.tips-list-prov a',function(e){
    var root = $(this).closest('.tips-content-long');
    var provId = $(this).attr('rel');
    var self = $(this);
    //清空城市列表
    $(".tips-list-city").html('');
    //处理选择结果
    $("input[name=provId]").val(provId);
    $("input[name=areaId]").val('');
    $.ajax({
      url: queryAreaByProvUrl,
      type: 'post',
      dataType: 'json',
      data: {
        provId:provId
      }
    })
    .done(function(resp) {
      var re="";
      for (var i in resp){
        re += '<a href="javascript:;" rel="'+resp[i].areaId+'"><span>'+resp[i].areaName+'</span></a>';
      }
      //显示选择结果
      root.closest('.form-group').find(".form-unit span").text("");
      root.closest('.form-group').find(".form-unit b").text($(self).text());
      if(i==='0'){
        $("input[name=areaId]").val(resp[i].areaId);
        closeSelect();
      }else{
        $(".tips-list-city").html(re);
        //省份列表隐藏, 城市列表显示
        $(self).parent().hide();
        $(self).parent().next().show();
        //切换省份/城市 标签页
        root.find(".tips-prov-city .on").removeClass("on");
        root.find(".tips-prov-city a:last-child").addClass("on");
      }
    })
  })

  //城市列表选择
  $(document).on('click','.tips-list-city a',function(e){
    var root = $(this).closest('.tips-content-long');
    var provTxt = root.find('.tips-list-prov .on').text();
    root.closest('.form-group').find(".form-unit b").text(provTxt+" "+$(this).text());
    $("input[name=areaId]").val($(this).attr('rel'));
    closeSelect();
  })

  //省份/城市 切换标签动作
  $(document).on('click','.tips-prov-city a',function(e){
    e.stopPropagation();
    var idx = $(this).index();
    var root = $(this).closest('.tips-content-long');
    //如果城市列表为空, 无法点击城市标签进去切换
    if( idx===0 || root.find(".tips-list").eq(1).html()!=="" ){
      $(this).addClass('on').siblings().removeClass('on');

      root.find(".tips-list").hide();
      root.find(".tips-list").eq(idx).show();
    }
  })

  /** 关闭已开启的浮层 **/
  $(document).on('click','html',function(e){
    closeSelect();
  })
  function closeSelect(){
    if(openSelect !== null) {
      var sRoot = $(openSelect).closest('.form-group');
      $(sRoot).find(".form-tips").removeClass('active');
      $(sRoot).find(".form-unit").removeClass('form-unit-active').removeClass('form-unit-error');
      var temp=0;
      $(sRoot).find("input:hidden").each(function(){
        if($(this).attr("required") && this.value===''){
          temp++;
        }
      })
      if(temp===0){
        $(sRoot).find(".form-tips.okay").addClass('active');
      }else{
        $(sRoot).find(".form-tips.required").addClass('active');
        $(sRoot).find(".form-unit").addClass('form-unit-error');
      }

      openSelect = null;
    }
  }

  var paramDataType      = 'jsonp',
      paramJsonp         = 'callback',
      paramJsonpCallback = 'success_jsonpCallback';
      paramJsonpLink     = 'Json'
  try{
    console.log(rootServer);
  }catch(e){
    rootServer          = '';
    paramDataType       = 'json';
    paramJsonp          = '';
    paramJsonpCallback  = '';
    paramJsonpLink      = '';
  }

  $('.limit-pop-link').each(function(){
    var $self = $(this);
    $.ajax({
      url: rootServer+'/muser/ajax/queryUsrAvailablelimitAmt'+paramJsonpLink,//'http://192.168.25.142/muser/ajax/queryUsrAvailablelimitAmt',//,
      type:"post",
      data: {
        'UsrCustId': $('#UsrCustId').val() || $('#usrCustId').val() || $('#custId').val(),
        'MerCustId': $('#MerCustId').val() || $('#merCustId').val()
      },
      dataType: paramDataType,
      jsonp:paramJsonp,
      jsonpCallback:paramJsonpCallback,
      success:function(re){
        if(parseInt(re.totalAvailableAmt) >= 0 && parseInt(re.totalLimitAmt) >= 0){
          var tmp='\
            <style>\
              .limit-pop-link{position:relative;cursor:default;display:inline-block;padding:8px;padding-left:20px;margin-left:20px;background-position:0 3px;background-repeat:no-repeat;background-position:0 9px;background-image:url("data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAwAAAAMCAMAAABhq6zVAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyJpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuMy1jMDExIDY2LjE0NTY2MSwgMjAxMi8wMi8wNi0xNDo1NjoyNyAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENTNiAoV2luZG93cykiIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6MEI2NDc4QzhCMTY1MTFFNjkzMzM4RTRBQzhCNDYxMUEiIHhtcE1NOkRvY3VtZW50SUQ9InhtcC5kaWQ6MEI2NDc4QzlCMTY1MTFFNjkzMzM4RTRBQzhCNDYxMUEiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDowQjY0NzhDNkIxNjUxMUU2OTMzMzhFNEFDOEI0NjExQSIgc3RSZWY6ZG9jdW1lbnRJRD0ieG1wLmRpZDowQjY0NzhDN0IxNjUxMUU2OTMzMzhFNEFDOEI0NjExQSIvPiA8L3JkZjpEZXNjcmlwdGlvbj4gPC9yZGY6UkRGPiA8L3g6eG1wbWV0YT4gPD94cGFja2V0IGVuZD0iciI/PtmDS00AAAAGUExURf///4zN9Q5ungoAAAAcSURBVHjaYmBEAgyYHAYGXBwilRHJweYCgAADAChfAIO7JLp8AAAAAElFTkSuQmCC")}\
              .limit-pop-frame{background-color: #f3f8ff; border:1px solid #7ac;position: absolute; width: 450px; padding: 20px 30px; z-index:200; top:32px; display:none}\
              .limit-pop-frame h3{font-size: 16px; line-height: 16px;color: #000;margin-bottom: 7px}\
              .limit-pop-frame p{margin:auto;font-size: 14px!important;color: #666!important; margin-bottom:10px;}\
              .limit-pop-link .limit-pop-frame p b{color: #000;font-size: 24px; vertical-align: initial;}\
              .limit-pop-link .limit-pop-frame p span{color: #000;}\
              .limit-pop-link .limit-pop-frame p i{color: #c00;font-style: normal;}\
              .limit-pop-list {max-height: 130px;overflow: auto; margin-top: 5px;}\
              .limit-pop-list span{width: 215px; float: left; line-height: 25px; color: #000;}\
              .limit-pop-bottom{padding-top: 25px; border-top: 1px dashed #ccc;margin-top: 20px;}\
              .limit-pop-arrow{background-image: url("data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAkAAAAGCAYAAAARx7TFAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyJpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuMy1jMDExIDY2LjE0NTY2MSwgMjAxMi8wMi8wNi0xNDo1NjoyNyAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENTNiAoV2luZG93cykiIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6NjkwMDQ5QUNCMjFFMTFFNjhFNkZENkM2QTlCODgwNzQiIHhtcE1NOkRvY3VtZW50SUQ9InhtcC5kaWQ6NjkwMDQ5QURCMjFFMTFFNjhFNkZENkM2QTlCODgwNzQiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDo2OTAwNDlBQUIyMUUxMUU2OEU2RkQ2QzZBOUI4ODA3NCIgc3RSZWY6ZG9jdW1lbnRJRD0ieG1wLmRpZDo2OTAwNDlBQkIyMUUxMUU2OEU2RkQ2QzZBOUI4ODA3NCIvPiA8L3JkZjpEZXNjcmlwdGlvbj4gPC9yZGY6UkRGPiA8L3g6eG1wbWV0YT4gPD94cGFja2V0IGVuZD0iciI/Pu2hy2sAAABaSURBVHjaYvj//z8DMq5bfPI/uhgTAxKoX3Lqv4GyGJhGFmdCV+BqpMCAoRBmxbpj9/9//vEfjkF8mNXM/1W84CYgA2VJAYZvP38zrDh4q4EFmwIYgIkDBBgAFNtRhstiUf4AAAAASUVORK5CYII=");width: 9px; height: 6px; display: inline-block; position: absolute;top:-6px;left:16px;z-index: 2;}\
            </style>\
            <span>额度说明</span>\
            <div class="limit-pop-frame">\
              <div class="limit-pop-arrow"></div>\
              <h3>额度说明：</h3>\
              <p>年剩余额度（元）: <b></b></p>\
              <p>额度：<span></span>元/年，银行卡付款方式不受该额度限制</span></p>\
              <div class="limit-pop-bottom">\
                <h3>您在以下 <span></span> 个平台开通了汇付服务</h3>\
                <p>根据相关规定，您在汇付数据开设的账户项下所有专户<i>共享一个额度</i></p>\
                <div class="limit-pop-list">\
                </div>\
              </div>\
            </div>\
          ';
          $self.html(tmp);
          $('.limit-pop-link .limit-pop-frame p b').text(re.totalAvailableAmt);
          $('.limit-pop-link .limit-pop-frame p span').text(re.totalLimitAmt);
          var tmp='';
          for(var i in re.custMerStNmList){
            tmp+='<span>'+re.custMerStNmList[i]+'</span>'
          }
          $('.limit-pop-list').html(tmp);
          $('.limit-pop-bottom h3 span').text(re.custMerStNmList.length);
        }
      }
    })
  })
  $('.limit-pop-link').mouseenter(function(){
    $(this).find('.limit-pop-frame').show();
  })
  $('.limit-pop-link').mouseleave(function(){
    $(this).find('.limit-pop-frame').hide();
  })

  //选择支付方式
  $(document).on('click','.pay-type-btns > a',function(e){
    var $nextdd = $(this).closest('dd').next();
    $nextdd.find('.form-unit-error').removeClass('form-unit-error');
    $nextdd.find('.form-group .active').removeClass('active');
    if($(this).index()===1){
      $nextdd.hide();
      $(".form-content .form-btns").css('padding-left',0)
    }else if($(this).index()===0){
      $nextdd.show();
      $(".form-content .form-btns").css('padding-left','140px')
    }
    $(this).closest('form').attr('action',$(this).data('action'));
  })

  if($('.recharge-type').length===3){
    $('.recharge-type').css('width','228px');
  }
  $('.recharge-type').css('visibility','visible');
})

/********************
 *  弹出框
 ********************/
var isIE6 = !!window.ActiveXObject && !window.XMLHttpRequest;
function modalShow(modal) {
  if ($('#' + modal + ':visible')[0]) return;
  if (!$('.modal-backdrop')[0] && $('#' + modal)[0]) {
      $('body').append("<div class='modal-backdrop'></div>");
      modalLayout();
  }
  $('#' + modal).show();
  try {
      afterModalShow($('#' + modal));
  } catch (e) {
  }
  modalCenter(modal);
}

$(document).on('click', '.modal .btn-close', function () {
    modalHide($(this).closest('.modal'))
});

function modalHide(modal) {
    $('.modal').hide();
    $('.modal-backdrop').remove();
    try { afterModalHide(modal); } catch (e) { }
}

//遮罩满屏
function modalLayout() {
  var bodyheight = window.innerHeight ? window.innerHeight:$(window).height();
  $('.modal-backdrop').css({
      'width': $('body').width(),
      'height': bodyheight
  });
}

//窗体居中

function modalCenter() {
  $('.modal:visible').each(function () {
    if ($(this).data("height") === undefined) {
      $(this).data("height", $(this).height());
      $(this).data("dbHeight", $(this).find('.modal-bd').height());
    }
    var h = $(this).data("height");
    var dbh = $(this).data("dbHeight");
    var maxh = $(window).height() - 50;
    var db = $(this).find('.modal-bd');

    if (h > maxh) {
      $(db).css('height', maxh - (h - dbh));
    } else {
      $(db).css('height', "auto");
    }

    var t = isIE6 ? ($(window).height() / 2) + $(window).scrollTop() + "px" : ($(window).height() / 2) + "px";
    //$(this).css({'top': t, 'margin-top': -$(this).height() / 2});
    $(this).css({'top': '5%'});
  });

}

//改变窗体重新调整位置
window.onresize = function () {
  modalLayout();
  modalCenter();
}

window.onscroll = function () {
  modalLayout();
  modalCenter();
}

document.onkeyup = function (event) {
  var evt = window.event || event;
  var code = evt.keyCode ? evt.keyCode : evt.which;
  if (code == 27) {
      modalHide();
  }
}

function queryPayQuota(){
  $.ajax({
    url: payQuotaUrl,
    type: 'post',
    dataType: 'json',
    data: {
      bankId: $("input[name=bankId]").val(),
      merCustId:$("input[name=merCustId]").val(),
      gateBusiId: "QP"
    }
  })
  .done(function(resp) {
    if(resp){
      if(resp.error!=="notsupport"){
        $('#singleTransQuota').html(resp.singleTransQuota);
        $('#cardDailyTransQuota').html(resp.cardDailyTransQuota);
        $('#usrDailyTransQuota').html(resp.usrDailyTransQuota);
        modalShow('modal-1');
      }
    }else{
      alert('请选择所属银行')
    }
  })
  $('#singleTransQuota').html("&nbsp;");
  $('#cardDailyTransQuota').html("&nbsp;");
  $('#usrDailyTransQuota').html("&nbsp;");
}

function resetImgCode(){
  var imgCodeUrl = $('.btn-captcha img').data('address');
  if(imgCodeUrl && imgCodeUrl!==''){
    var s = Date.parse(new Date())+parseInt(100+Math.random()*900);
    $("input[name=imageUniqueId]").val(s);
    $("input[name=captcha]").val('');
    //$(".btn-captcha img").attr('src', imgCodeUrl+"?sessionID="+s).show();
    var imgCode = $(".btn-captcha img")[0];
    imgCode.src = imgCodeUrl+"?sessionID="+s;
  }
}