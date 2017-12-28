<%--
  Created by IntelliJ IDEA.
  User: qm
  Date: 2017/12/28
  Time: 10:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% String path = request.getContextPath();%>
<html>
<head>
    <title>汇付天下</title>
    <link rel="stylesheet" href="<%=path%>/static/css/user/style.css" />
</head>
<body class="w960">
<div class="wrapper">
    <div class="min-width-out">
        <div class="min-width-in">
            <div class="min-width">
                <div class="header">
                    <div class="content">
                        <a href="" target="_blank" class="logo-new" title="汇付天下"></a>
                        <div id="logo-extra"><img id="logo-extra-img"/></div>
                    </div>
                </div>
                <div class="main">
                    <div class="content">
                        <h1 class="page-title">绑定取现银行卡<span> 该银行卡将作为利息发放及本金发放的银行卡</span></h1>
                        <form method="post" action="/muser/bankcard/addCard" autocomplete="off"
                              class="validate-form errFocus" novalidate=""><input type="text" name="prevent_autofill"
                                                                                  id="prevent_autofill" value=""
                                                                                  style="display:none;"><input
                                type="password" id="password_fake" value="" style="display:none;" pname="password_fake">
                            <input type="hidden" name="loginId" id="loginId" value="pjzb_111193">
                            <input type="hidden" name="custId" value="6000060258814895">
                            <input type="hidden" name="merUsrName" value="普金资本运营(赣州)有限公司">
                            <input type="hidden" name="merShortName" value="普金资本">
                            <input type="hidden" name="merCustId" id="merCustId" value="6000060141694317">
                            <input type="hidden" name="shortName" value="">
                            <input id="sendFlag" type="hidden" name="sendFlag" value="true">
                            <input type="hidden" name="version" value="10">
                            <input type="hidden" name="merPriv" value="111193-PC">
                            <input type="hidden" name="cmdId" value="UserBindCard">
                            <input type="hidden" name="bgRetUrl"
                                   value="https://www.pujinziben.com:443/reAddBankInfo.do">
                            <input id="chkValue" type="hidden" name="chkValue"
                                   value="2A36E293AD8EC51E4294035FDF779493D023A425CBF8EF9FD428C007D80FD9A5D9818F85C9B39795D1CBD1633CA1909963134511FEB0DFA977DCDACD01D09D10BA1B6BED5C345F4BCF3DDE14C9086C3B0A71B6D1DF47CD4A8BBEB103900724A49A6E038056BE0C8B8BB79276CB6FD733CB76801CA583586E29D3ED29632C0720">
                            <input type="hidden" name="charset" id="charset" value="UTF-8">
                            <input type="hidden" name="usrRole" id="usrRole" value="01">
                            <input type="hidden" name="maskCertId" id="maskCertId" value="3607311999 **** 0034">
                            <input type="hidden" name="cardName" value="陈广胜">
                            <input type="hidden" name="encryptStr" id="encryptStr"
                                   value="B6DD66F27B39FEAA6260DE1781432188">
                            <input type="hidden" name="qpAuthFlag" value="">
                            <input type="hidden" name="veriCardType" value="">
                            <input type="hidden" name="SourceId" value="00000037">
                            <input type="hidden" name="loginKey" value="">
                            <input type="hidden" name="usrName" value="陈广胜">
                            <div class="form form-border mb30">
                                <!--平台名称-->
                                <div class="form-title form-title-big">
                                    <p class="info mb15"><span>平台名称: 普金资本</span>
                                        <span>公司名称: 普金资本运营(赣州)有限公司</span></p>
                                </div>
                                <div class="form-content">
                                    <!--账户余额开始-->
                                    <dl class="form-list form-list-no-icon">
                                        <dd>
                                            <div class="form-group">
                                                <label class="label">真实姓名:</label>
                                                <span class="form-text">陈广胜</span>
                                            </div>
                                            <div class="form-group">
                                                <label class="label">证件号码:</label>
                                                <span class="form-text">3607311999 **** 0034</span>
                                            </div>
                                        </dd>
                                        <dd>
                                            <div class="form-group form-group-card">
                                                <label class="label">所属银行:</label>
                                                <div class="form-unit form-unit-action">
                                                    <div class="form-unit-info">
                                                        <b></b>
                                                        <span>请选择所属银行</span>
                                                        <i class="form-unit-action-arrow"></i>
                                                    </div>
                                                    <input type="hidden" name="bankId" required="" value=""
                                                           class="showBankId">
                                                </div>
                                                <label class="form-tips tip tip-card-city">
                                                    <div class="form-tips-content">
                                                        <div class="tips-content-short">
                                                        </div>
                                                        <div class="tips-content-long">
                                                            <div class="tips-list tips-list-bank">
                                                                <a href="javascript:;" rel="ICBC" name="中国工商银行">
                                                                    <img src="https://lab.chinapnr.com/statics/common/images/bank/ICBC.png"
                                                                         width="114" height="34">
                                                                    <span>中国工商银行</span>
                                                                </a>
                                                                <a href="javascript:;" rel="ABC" name="中国农业银行">
                                                                    <img src="https://lab.chinapnr.com/statics/common/images/bank/ABC.png"
                                                                         width="114" height="34">
                                                                    <span>中国农业银行</span>
                                                                </a>
                                                                <a href="javascript:;" rel="CMB" name="招商银行">
                                                                    <img src="https://lab.chinapnr.com/statics/common/images/bank/CMB.png"
                                                                         width="114" height="34">
                                                                    <span>招商银行</span>
                                                                </a>
                                                                <a href="javascript:;" rel="CCB" name="中国建设银行">
                                                                    <img src="https://lab.chinapnr.com/statics/common/images/bank/CCB.png"
                                                                         width="114" height="34">
                                                                    <span>中国建设银行</span>
                                                                </a>
                                                                <a href="javascript:;" rel="BJRCB" name="北京农村商业银行">
                                                                    <img src="https://lab.chinapnr.com/statics/common/images/bank/BJRCB.png"
                                                                         width="114" height="34">
                                                                    <span>北京农村商业银行</span>
                                                                </a>
                                                                <a href="javascript:;" rel="BOC" name="中国银行">
                                                                    <img src="https://lab.chinapnr.com/statics/common/images/bank/BOC.png"
                                                                         width="114" height="34">
                                                                    <span>中国银行</span>
                                                                </a>
                                                                <a href="javascript:;" rel="BOCOM" name="交通银行">
                                                                    <img src="https://lab.chinapnr.com/statics/common/images/bank/BOCOM.png"
                                                                         width="114" height="34">
                                                                    <span>交通银行</span>
                                                                </a>
                                                                <a href="javascript:;" rel="CEB" name="中国光大银行">
                                                                    <img src="https://lab.chinapnr.com/statics/common/images/bank/CEB.png"
                                                                         width="114" height="34">
                                                                    <span>中国光大银行</span>
                                                                </a>
                                                                <a href="javascript:;" rel="SDB" name="深圳发展银行">
                                                                    <img src="https://lab.chinapnr.com/statics/common/images/bank/SDB.png"
                                                                         width="114" height="34">
                                                                    <span>深圳发展银行</span>
                                                                </a>
                                                                <a href="javascript:;" rel="SPDB" name="浦东发展银行">
                                                                    <img src="https://lab.chinapnr.com/statics/common/images/bank/SPDB.png"
                                                                         width="114" height="34">
                                                                    <span>浦东发展银行</span>
                                                                </a>
                                                                <a href="javascript:;" rel="BCCB" name="北京银行">
                                                                    <img src="https://lab.chinapnr.com/statics/common/images/bank/BCCB.png"
                                                                         width="114" height="34">
                                                                    <span>北京银行</span>
                                                                </a>
                                                                <a href="javascript:;" rel="BOS" name="上海银行">
                                                                    <img src="https://lab.chinapnr.com/statics/common/images/bank/BOS.png"
                                                                         width="114" height="34">
                                                                    <span>上海银行</span>
                                                                </a>
                                                                <a href="javascript:;" rel="CBHB" name="渤海银行">
                                                                    <img src="https://lab.chinapnr.com/statics/common/images/bank/CBHB.png"
                                                                         width="114" height="34">
                                                                    <span>渤海银行</span>
                                                                </a>
                                                                <a href="javascript:;" rel="CIB" name="兴业银行">
                                                                    <img src="https://lab.chinapnr.com/statics/common/images/bank/CIB.png"
                                                                         width="114" height="34">
                                                                    <span>兴业银行</span>
                                                                </a>
                                                                <a href="javascript:;" rel="CMBC" name="中国民生银行">
                                                                    <img src="https://lab.chinapnr.com/statics/common/images/bank/CMBC.png"
                                                                         width="114" height="34">
                                                                    <span>中国民生银行</span>
                                                                </a>
                                                                <a href="javascript:;" rel="CZB" name="浙商银行">
                                                                    <img src="https://lab.chinapnr.com/statics/common/images/bank/CZB.png"
                                                                         width="114" height="34">
                                                                    <span>浙商银行</span>
                                                                </a>
                                                                <a href="javascript:;" rel="GDB" name="广发银行">
                                                                    <img src="https://lab.chinapnr.com/statics/common/images/bank/GDB.png"
                                                                         width="114" height="34">
                                                                    <span>广发银行</span>
                                                                </a>
                                                                <a href="javascript:;" rel="HXB" name="华夏银行">
                                                                    <img src="https://lab.chinapnr.com/statics/common/images/bank/HXB.png"
                                                                         width="114" height="34">
                                                                    <span>华夏银行</span>
                                                                </a>
                                                                <a href="javascript:;" rel="HZCB" name="杭州银行">
                                                                    <img src="https://lab.chinapnr.com/statics/common/images/bank/HZCB.png"
                                                                         width="114" height="34">
                                                                    <span>杭州银行</span>
                                                                </a>
                                                                <a href="javascript:;" rel="MINTAI" name="浙江民泰商业银行">
                                                                    <img src="https://lab.chinapnr.com/statics/common/images/bank/MINTAI.png"
                                                                         width="114" height="34">
                                                                    <span>浙江民泰商业银行</span>
                                                                </a>
                                                                <a href="javascript:;" rel="NJCB" name="南京银行">
                                                                    <img src="https://lab.chinapnr.com/statics/common/images/bank/NJCB.png"
                                                                         width="114" height="34">
                                                                    <span>南京银行</span>
                                                                </a>
                                                                <a href="javascript:;" rel="PINGAN" name="平安银行">
                                                                    <img src="https://lab.chinapnr.com/statics/common/images/bank/PINGAN.png"
                                                                         width="114" height="34">
                                                                    <span>平安银行</span>
                                                                </a>
                                                                <a href="javascript:;" rel="PSBC" name="中国邮政储蓄银行">
                                                                    <img src="https://lab.chinapnr.com/statics/common/images/bank/PSBC.png"
                                                                         width="114" height="34">
                                                                    <span>中国邮政储蓄银行</span>
                                                                </a>
                                                                <a href="javascript:;" rel="SRCB" name="上海农村商业银行">
                                                                    <img src="https://lab.chinapnr.com/statics/common/images/bank/SRCB.png"
                                                                         width="114" height="34">
                                                                    <span>上海农村商业银行</span>
                                                                </a>
                                                                <a href="javascript:;" rel="ZJTLCB" name="浙江泰隆商业银行">
                                                                    <img src="https://lab.chinapnr.com/statics/common/images/bank/ZJTLCB.png"
                                                                         width="114" height="34">
                                                                    <span>浙江泰隆商业银行</span>
                                                                </a>
                                                                <a href="javascript:;" rel="CITIC" name="中信银行">
                                                                    <img src="https://lab.chinapnr.com/statics/common/images/bank/CITIC.png"
                                                                         width="114" height="34">
                                                                    <span>中信银行</span>
                                                                </a>
                                                                <!-- -->
                                                            </div>
                                                        </div>
                                                    </div>
                                                </label>
                                                <label class="form-tips error required">
                                                    <div class="form-tips-arrow"></div>
                                                    <div class="form-tips-content">
                                                        <p>所属银行不能为空</p>
                                                    </div>
                                                </label>
                                                <label class="form-tips okay">&nbsp;</label>
                                            </div>
                                            <div class="form-group">
                                                <label class="label">银行卡号:</label>
                                                <input type="text" name="cardId" class="form-unit" required=""
                                                       maxlength="32" value="" match="bankCard" autocomplete="off">
                                                <label class="form-tips tip tip-card-id">
                                                    <div class="form-tips-arrow"></div>
                                                    <div class="form-tips-content">
                                                        <div class="tips-content-long">
                                                            <p>请输入您的银行<b>储蓄卡</b>号，并确保此卡用以上身份证开户。</p>
                                                        </div>
                                                        <div class="tips-card-zoom" style="display:none;"></div>
                                                    </div>
                                                </label>
                                                <label class="form-tips error required">
                                                    <div class="form-tips-arrow"></div>
                                                    <div class="form-tips-content">
                                                        <p>银行卡号不能为空</p>
                                                    </div>
                                                </label>
                                                <label class="form-tips error match">
                                                    <div class="form-tips-arrow"></div>
                                                    <div class="form-tips-content">
                                                        <p>银行卡号长度为10-32位数字</p>
                                                    </div>
                                                </label>
                                                <label class="form-tips error errorInfo">
                                                    <div class="form-tips-arrow"></div>
                                                    <div class="form-tips-content">
                                                        <p>银行卡号长度为10-32位数字</p>
                                                    </div>
                                                </label>
                                            </div>
                                            <div class="form-group form-group-prov-city">
                                                <label class="label">银行卡所属地:</label>
                                                <div class="form-unit form-unit-action">
                                                    <div class="form-unit-info">
                                                        <b></b>
                                                        <span>请选择银行卡所属地</span>
                                                        <i class="form-unit-action-arrow"></i>
                                                    </div>
                                                </div>
                                                <input type="hidden" name="provId" required="" value="">
                                                <input type="hidden" name="areaId" required="" value="">
                                                <label class="form-tips tip tip-card-city">
                                                    <div class="form-tips-content">
                                                        <div class="tips-content-short">
                                                            <span class="pw-secure"><b></b><b></b><b></b><b></b><b></b></span>
                                                        </div>
                                                        <div class="tips-content-long">
                                                            <div class="tips-prov-city">
                                                                <a href="javascript:void(0)" class="on"><span>省份</span></a>
                                                                <a href="javascript:void(0)"><span>城市</span></a>
                                                            </div>
                                                            <div class="tips-list tips-list-prov">
                                                                <a href="javascript:;" rel="0011"><span>北京</span></a>
                                                                <a href="javascript:;" rel="0012"><span>天津</span></a>
                                                                <a href="javascript:;" rel="0013"><span>河北</span></a>
                                                                <a href="javascript:;" rel="0014"><span>山西</span></a>
                                                                <a href="javascript:;" rel="0015"><span>内蒙古</span></a>
                                                                <a href="javascript:;" rel="0021"><span>辽宁</span></a>
                                                                <a href="javascript:;" rel="0022"><span>吉林</span></a>
                                                                <a href="javascript:;" rel="0023"><span>黑龙江</span></a>
                                                                <a href="javascript:;" rel="0031"><span>上海</span></a>
                                                                <a href="javascript:;" rel="0032"><span>江苏</span></a>
                                                                <a href="javascript:;" rel="0033"><span>浙江</span></a>
                                                                <a href="javascript:;" rel="0034"><span>安徽</span></a>
                                                                <a href="javascript:;" rel="0035"><span>福建</span></a>
                                                                <a href="javascript:;" rel="0036"><span>江西</span></a>
                                                                <a href="javascript:;" rel="0037"><span>山东</span></a>
                                                                <a href="javascript:;" rel="0041"><span>河南</span></a>
                                                                <a href="javascript:;" rel="0042"><span>湖北</span></a>
                                                                <a href="javascript:;" rel="0043"><span>湖南</span></a>
                                                                <a href="javascript:;" rel="0044"><span>广东</span></a>
                                                                <a href="javascript:;" rel="0045"><span>广西</span></a>
                                                                <a href="javascript:;" rel="0046"><span>海南</span></a>
                                                                <a href="javascript:;" rel="0050"><span>重庆</span></a>
                                                                <a href="javascript:;" rel="0051"><span>四川</span></a>
                                                                <a href="javascript:;" rel="0052"><span>贵州</span></a>
                                                                <a href="javascript:;" rel="0053"><span>云南</span></a>
                                                                <a href="javascript:;" rel="0054"><span>西藏</span></a>
                                                                <a href="javascript:;" rel="0061"><span>陕西</span></a>
                                                                <a href="javascript:;" rel="0062"><span>甘肃</span></a>
                                                                <a href="javascript:;" rel="0063"><span>青海</span></a>
                                                                <a href="javascript:;" rel="0064"><span>宁夏</span></a>
                                                                <a href="javascript:;" rel="0065"><span>新疆</span></a>
                                                                <a href="javascript:;" rel="2001"><span>香港</span></a>
                                                                <a href="javascript:;" rel="2002"><span>澳门</span></a>
                                                                <a href="javascript:;" rel="2003"><span>台湾</span></a>
                                                            </div>
                                                            <div class="tips-list tips-list-city"></div>
                                                        </div>
                                                    </div>
                                                </label>
                                                <label class="form-tips error required">
                                                    <div class="form-tips-arrow"></div>
                                                    <div class="form-tips-content">
                                                        <p>请选择银行卡的省份及城市</p>
                                                    </div>
                                                </label>
                                                <label class="form-tips okay">&nbsp;</label>
                                            </div>
                                            <div class="form-group">
                                                <label class="label">汇付交易密码:</label>
                                                <input type="password" class="form-unit" required="" maxlength="16"
                                                       pname="transPwd">
                                                <label class="form-tips error required">
                                                    <div class="form-tips-arrow"></div>
                                                    <div class="form-tips-content">
                                                        <p>汇付交易密码不能为空</p>
                                                    </div>
                                                </label>
                                                <a href="/muser/password/transpwd/forgetTransPwd?Test=test&amp;MerCustId=6000060141694317&amp;UsrCustId=6000060258814895&amp;CmdId=UserBindCard&amp;Version=10&amp;SourceId=00000037"
                                                   class="form-link" target="_blank">忘记汇付交易密码？</a>
                                            </div>
                                            <div class="form-group" style="margin-top:40px;">
                                                <label class="label label-top">&nbsp;</label>
                                                <label class="checkbox" for="Checkbox-1"
                                                       style="width:175px;display:inline-block">
                                                    <input type="checkbox" name="cashFlag" id="Checkbox-1" value="D"
                                                           checked="checked"> 将此卡设置为默认取现卡
                                                </label>
                                            </div>
                                        </dd>
                                    </dl>
                                    <div class="form-group form-btns">
                                        <a href="javascript:void(0)" class="btn btn-primary"><span>确定</span></a>
                                        <input type="submit" class="btn-submit">
                                    </div>
                                </div>
                            </div>
                            <input type="hidden" name="password_fake"><input type="hidden" name="transPwd"></form>
                    </div>
                </div>
                <div class="secure-tips">
                    <h2>汇付天下，全面保障您的资金安全<i></i></h2>
                    <div class="content">
                        <p>
                            汇付天下P2P账户系统托管，是汇付天下为P2P行业量身定制的账户系统与支付服务系统。一方面，为P2P平台开发定制账户系统，提供系统外包运营服务；另一方面，为P2P平台提供支付和结算服务，帮助平台和用户实现充值、取现、资金划拨等服务；投资人资金划入虚拟账户后，平台无法触碰资金，避免了资金池模式。但是，我们对投资风险（包括但不限于平台或其他借款人违约）不承担任何责任，投资需谨慎。</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="push"></div>
</div>
<div class="min-width-out">
    <div class="min-width-in">
        <div class="footer min-width">
            <div class="content">
                汇付天下有限公司版权所有 Copyright &copy; 2016 ChinaPnR All Right Reserved &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <a target="_blank" href="">
                    <img src="picture/babhtb.png" style="absolute:middle;"> 沪公网安备 31010402000137号</a>

                <br>
                <a href="">关于汇付天下</a>
                <a href="" target="_blank">安全保障</a>
                <a href="" target="_blank">帮助中心</a>
                <a href="" target="_blank">联系我们</a>
                <span style="position: absolute;left: 522px;">沪ICP备17052888号-2</span>
                <span class="phone">客服电话: <i>400 820 2819</i></span>
            </div>
        </div>
        <script type="text/javascript" src="<%=path%>/static/js/jquery.min.js"></script>
        <script type="text/javascript" src="<%=path%>/static/js/vue.min.js"></script>
        <script type="text/javascript" src="<%=path%>/static/js/axios.min.js"></script>
        <script type="text/javascript" src="<%=path%>/static/layui/layui.js"></script>
        <script type="text/javascript" src="<%=path%>/static/js/user/plugins.min.js"></script>
        <script type="text/javascript" src="<%=path%>/static/js/user/addBankCardMain.js"></script>
        <script>
            var conPath = '/muser';
            if ($('isDepoBank') && $('isDepoBank').value === 'Y') {
                $('logo-extra-img').src = 'https://lab.chinapnr.com/statics/common/images/bank/depo/' + document.getElementById('depoBankId').value + '.png';
                $('logo-extra').style.display = 'inline-block';
            }

            if ($.getElementById('merCustId')) {
                var merCustId = $('merCustId').value;
            }
            if (document.getElementById('MerCustId')) {
                var merCustId = $('MerCustId').value;
            }

            if (merCustId === '6000060004348157') {
                $('logo-extra-img').src = 'https://lab.chinapnr.com/statics/common/images/bank/depo/GZB.png';
                $('logo-extra').style.display = 'inline-block';
            }
        </script>
    </div>
</div>
<!-- no postbeCtlVo -->
</body>
</html>
