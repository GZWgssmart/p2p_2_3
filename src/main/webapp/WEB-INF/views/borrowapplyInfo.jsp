<%--
  Created by IntelliJ IDEA.
  User: Animo
  Date: 2017-12-27
  Time: 8:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/static/css/index/public.css">
    <link rel="stylesheet" href="/static/css/index/index.css">
</head>
<%@include file="common/top.jsp"%>
<div id="app">
<div class="subject">
    <div class="subject-submit">
        <div class="subject-submit-l" style="display: block;">
            <div class="subject-submit-title">
                <p id="borrowWayName">{{bzname}}</p>
                <h3 id="borrowTitle">{{borrowdetail.cpname}}</h3>
            </div>
            <div class="subject-submit-detail">
                <div class="subject-submit-rate">
                    <p>预期年化收益</p>
                    <p class="text color"><span class="color" id="rate">{{borrowdetail.nprofit}}</span>%</p>
                </div>
                <div class="subject-submit-date">
                    <p>项目期限</p>
                    <p class="text" id="date"><span>{{borrowapply.term}}</span>个月</p>
                </div>
                <div class="subject-submit-amt">
                    <p class="title_amt">募集总金额</p>
                    <p class="text"><span id="amt">{{borrowapply.money}}</span>元</p>
                </div>
            </div>
            <div class="subject-submit-bottom">
                <div class="subject-submit-b-l">
                    <p>还款方式：<span id="paymentMode">按月付息，到期还本</span></p>
                    <p>最小投标金额：<span id="minTenderedSum">100.00元</span></p>
                </div>
                <div class="subject-submit-b-l">
                    <p>总投标数：<span id="investNum">10</span></p>
                    <p>最大投标金额：<span id="maxTenderedSum">{{borrowapply.money-borrowdetail.money}}</span></p>
                </div>
                <div class="subject-submit-b-r">
                    <div class="line">
                        <p>投资进度：</p><p class="progress"><em style="width: 100%;"></em></p><p class="progress-text">100.00%</p>
                    </div>
                    <p>截止时间：<span id="publishTime">{{borrowapply.deadline}}</span></p>
                </div>
            </div>
        </div>
        <div class="subject-submit-r" style="display: block;">
            <div class="subject-s-r-u">

            </div>
            <div class="subject-s-r-c">
                <p>可用余额：<span id="canUseSum">
                    <p v-if="${sessionScope.get("USER")!=null}">可用余额</p>
                <p v-else>登录后查看余额</p>
                </span></p>
                <p class="rate">预期收益：<span class="color" id="reckon">0.00</span></p>
            </div>
            <div class="subject-s-r-c">
                <p>剩余可投：<span id="investAmount">{{borrowapply.money-borrowdetail.money}}元</span></p>
                <p class="rate active" id="increaseP">加息收益：<span class="color" id="increase">0.00</span></p>
            </div>
            <div class="input">
                <input type="text" placeholder="请输入投资金额" v-model="ktmoney">
                <button type="button" @click="touzi">全投</button>
            </div>
            <div class="quan">
                <select id="selectQuan">

                    <option value="0">当前没有可用的优惠券</option></select>
                <a href="calculator.html?repayWay=3&amp;showRate=9+1&amp;time=6" class="icon icon-cal" id="calculator">详细收益明细</a>
            </div>
            <button class="btn disabled" id="investBtn" type="button">还款中</button>
            <p class="agreement" style="height: 0;"></p>
            <div id="productJump"></div>
        </div>
    </div>
</div>
<div class="sub-about">
    <div class="sub-a-nav">
        <a href="javascript:void(0);" class="active" onclick="getDetail(this)">项目详情</a>
        <a href="javascript:void(0);" onclick="getFile(this)" id="getFile" class="">相关文件</a>
        <a href="javascript:void(0);" onclick="getPlan(this)" class="plan" id="getPlan" style="display: inline;">还款计划</a>
        <a href="javascript:void(0);" onclick="getInvest(this)" id="getInvest" class="">投资记录</a>
        <a href="javascript:void(0);" onclick="dangger(this)" class="">风险提示</a>
    </div>
    <em class="em-line"></em>
    <div class="sub-a-box" id="project" style="display: block;">
        <div class="detail cl">
            <p class="title">产品名称：</p><p class="content" id="projectTitle">{{borrowdetail.cpname}}</p>
        </div>
        <div class="detail cl">
            <p class="title">募集资金：</p><p class="content" id="projectAmount">{{borrowapply.money}}元</p>
        </div>
        <div class="detail cl">
            <p class="title">预期年化收益：</p><p class="content" id="projectRate">{{borrowdetail.nprofit}}%</p>
        </div>
        <div class="detail cl">
            <p class="title">起息日期：</p><p class="content">满标计息</p>
        </div>
        <div class="detail cl">
            <p class="title">资金用途：</p><p class="content" id="moneyPurposes">{{borrowdetail.mpurpose}}</p>
        </div>
        <div class="detail cl">
            <p class="title">收益方式：</p><p class="content" id="projectType">按月付息，到期还本</p>
        </div>
        <div class="detail cl">
            <p class="title">还款来源：</p><p class="content" id="retsource">{{borrowdetail.hksource}}</p>
        </div>
        <div class="detail cl">
            <p class="title">借款人介绍：</p><p class="content" id="projectIntro">{{borrowdetail.suggest}}</p>
        </div>
        <div class="detail cl">
            <p class="title">项目描述：</p><p class="content" id="projectDetail">{{borrowdetail.xmdescrip}}</p>
        </div>
        <div class="detail cl">
            <p class="title">保障措施：</p><p class="content" id="safeMeasures">{{borrowdetail.guarantee}}</p>
        </div>
    </div>
    <div class="sub-a-box files" id="files">
        <p class="icon icon-danger files-title">互联金融将以客观、公正的原则，最大程度地核实借入者信息的真实性，但不保证审核信息100%真实。如果借入者长期逾期，其提供的信息将被公布。</p>
        <ul class="files-box">
            <li class="">
                <img alt="" width="320" height="200" src="http://pic.3h3.com/up/2015-9/201599991030063384.jpg">
                <p>
                    <span class="icon icon-true">法人身份认证</span>
                </p>
                <a href="javascript:;" onclick="" style="display: inline;">点击查看大图</a>
            </li>
        </ul>
    </div>
    <div class="sub-a-box plan" id="plan">
        <ul class="">
            <li class="title"><div class="children0">序号</div><div class="children1">计划还款日期</div><div class="children2">实际还款日期</div><div class="children3">已还本息</div><div class="children4">待还本息</div><div class="children5">已付罚息</div><div class="children6">待还罚息</div><div class="children7">状态</div></li>
        </ul>
        <ul class="listData">
        </ul>
    </div>
    <div class="sub-a-box invest" id="invest">
        <ul class="">
            <li class="title"><div class="children0">投资人</div><div class="children1">金额</div><div class="children2">投资时间</div></li>
            <li v-for="item in tzbRow" class="title">
                <div class="children0">{{item.rname}}</div>
                <div class="children1">{{item.money}}</div>
                <div class="children2">{{item.tztime}}</div>
            </li>
        </ul>
        <ul class="listData">
        </ul>
        <ul class="paging"></ul>
    </div>
    <div class="sub-a-box dangger" id="tips">
        <p class="icon icon-danger tips-title"><b>普金资本郑重提示：</b>用户应自行对交易风险进行全面了解、充分认识、谨慎决策，用户应对其决策承担全部责任并承担全部风险。如用户通过普金资本平
            台进行下一步操作，即表示已经认真阅读本提示书并完全了解与接受。</p>
        <div class="content">
            <p class="title">一、政策风险</p>
            <p>因国家宏观政策和相关法律法规发生变化，可能引起价格方面的异常波动，用户可能因此遭受损失。</p>
            <p class="title">二、信用风险</p>
            <p> 普金资本不对本金和收益提供任何保证或承诺。若平台项目发生逾期还款，由平台合作机构保理公司或担保公司在 30 个工作日内进行债权回购。合作机构在发生
                最不利情况下（可能但并不一定发生），项目进入司法程序，可能不利于用户实现项目的预期收益甚至本金遭受损失。</p>
            <p class="title">三、信息传递风险</p>
            <p>普金资本将按协议约定进行信息披露，用户应充分关注并及时主动查询交易信息，如未及时查询，或由于通讯故障、系统故障以及其他不可抗力等因素的影响使得
                无法及时了解交易信息，由此产生责任和风险应由用户承担。</p>
            <p class="title">四、不可抗力及意外事件风险</p>
            <p>包括但不限于自然灾害、金融市场危机、战争、黑客攻击、病毒感染等不能预见、不能避免、不能克服的不可抗力事件，对于由于不可抗力及意外事件风险导致的
                任何损失，客户须自行承担。</p>
            <p class="title">五、流动性风险</p>
            <p>用户提以债权转让方式通过普金资本平台进行转让的，普金资本不对债权转让完成的时间以及债权转让能否全部成功实现做出任何承诺，债权未成功转让的，用户
                面临资金不能变现、丧失其他投资机会的风险。</p>
            <p class="icon icon-danger"><span>特别提示：</span>本风险提示书不能穷尽全部风险及市场的全部情形。</p>
        </div>

    </div>
</div>
<div class="files-more">
    <p class="title">其他资料</p>
    <a href="javascript:void(0);" class="close icon icon-close"></a>
    <ul class="files-more-list">

    </ul>
</div>
<div class="popup hasPWD">
    <p class="title left">输入投标密码</p>
    <a href="javascript:void(0);" class="close icon icon-close"></a>
    <div class="popup-from">
        <div class="label cl">
            <label>投标密码</label><input type="password" id="password" maxlength="30" placeholder="请输入投标密码"/>
        </div>
        <button type="button" class="btn" id="haspwd-submit">立即投标</button>
    </div>
</div>
<div class="popup AgreeMent">
    <p class="title left">普金资本服务协议</p>
    <a href="javascript:void(0);" class="close icon icon-close"></a>
    <div class="popup-area">

    </div>
</div>

<div id="ajaxFooter">
    <div class="mod-sidebar">
        <ul>
            <li><a target="_blank" href="" class="sidebar-qq"></a></li>
            <li><a href="javascript:;" class="sidebar-wx"></a></li>
            <li><a href="" class="sidebar-cl"></a></li>
            <li><a href="javascript:;" class="wenquan" title="填写即送5元代金券"></a></li>
            <li><a href="javascript:;" class="sidebar-top"></a></li>
        </ul>
        <div id="demo3"></div>
    </div>
    <div class="index-concat">
        <div class="wrap cl">
            <div class="index-concat-left">

            </div>
            <div class="index-concat-phone">
                <p>财富热线</p>
                <h3>400-606-2079</h3>
            </div>
            <div class="index-concat-channel">
                <p class="about_cel_text">
                    <a target="_blank" href="" class="about_wb"></a>
                    <a href="javascript:void(0);" class="about_wx line_02">
						<span class="line_l_h">
							<span class="line_l_sj"></span>
							<span class="line_l_text">关注普金资本公众号</span>
							<span class="line_l_pic"></span>
						</span>
                    </a>
                    <a target="_blank" href="" class="about_qq"></a>
                    <a href="javascript:void(0);" class="about_wx about_rr">
						<span class="line_l_j">
							<span class="line_l_sj"></span>
							<span class="line_l_texts">400-606-2079</span>
						</span>
                    </a>
                </p>
                <p class="about_cel_no">admin@pujinziben.com</p>
            </div>
            <div class="index-concat-link cl">
                <a href="javascript:;" class="title">友情链接</a>
                <a target="_blank" href="">网贷天眼</a>
                <a target="_blank" href="">网贷天下</a>
                <a target="_blank" href="">中国平安银行</a>
                <a target="_blank" href="">中国建设银行</a>
                <a target="_blank" href="">网贷东方</a>
                <a target="_blank" href="">第一网贷</a></div>
        </div>
    </div>
    <div class="footer">
        <div class="wrap">
            <p class="text">
                版权所有 © 普金资本运营（赣州）有限公司 All rights reserved <br>
                备案确认书：<a href="" target="_blank" class="beian">赣ICP备16004010号</a>
                <a href="" target="_blank"></a>&nbsp;&nbsp;&nbsp;&nbsp;
                <a target="_blank" href="" style="display:inline-block;text-decoration:none;height:20px;line-height:20px;" class="beian">
                    赣公网安备 36070202000195号</a>

            </p>

        </div>
    </div>
</div>

</div>
</body>
<script type="text/javascript" src="/static/js/jquery.min.js"></script>
<script type="text/javascript" src="/static/js/borrowapply/detail.js"></script>
<script src="/static/js/vue.min.js"></script>
<script src="/static/js/axios.min.js"></script>
<script src="/static/layui/layui.js"></script>
<script src="/static/js/qs.js"></script>
<script>

    var laypage;
    layui.use(['laypage','layer','element'], function(){
        var element = layui.element;
        laypage = layui.laypage
    });

    var vue = new Vue({
        el:'#app',
        data:{
            borrowapply:[],
            borrowdetail:[],
            tzbRow:[],
            bdid:${requestScope.get("bdid")},
            bzname:'${requestScope.get("bzname")}',
            tzb:{
                juid:'',
                money:0,
                nprofit:'',
                cpname:'',
                baid:${requestScope.get("baid")}
            }
        },
        created (){
            axios.all([getinfo(this.tzb.baid,this.bdid)]).then(axios.spread((borrowapplyDetail)=>{
                 this.borrowapply = borrowapplyDetail.data.data.borrowapply;
                 this.borrowdetail = borrowapplyDetail.data.data.borrowdetail;
            }));
        },
        methods:{
            touzi () {
                axios.post('/tzb/data/json/save',Qs.stringify(this.tzb)).then((response)=>{
                    alert(response.data.message);
                },(error)=>{

                });
            },
            getJsonShang(laypage){
                $.getJSON('/tzb/data/json/tzpager', {
                    pageNumber: 1,
                    pageSize: 2,
                    baid:this.tzb.baid
                }, function(res){
                    laypage.render({
                        elem: 'demo3',
                        count: res.total,
                        limit :2,
                        jump: function(e, first){
                            if (!first) {
                                vue.getJsonXia(e);
                            } else {
                                vue.getJsonXia(e);
                            }
                        }
                    });
                });
            },
            getJsonXia (e) {
                $.getJSON('/tzb/data/json/tzpager', {
                    pageNumber: e.curr,
                    pageSize: e.limit,
                    baid:this.tzb.baid
                }, function (res) {
                    vue.tzbRow = res.rows;
                });
            },
        },
        computed: {
            ktmoney: function () {
                this.tzb.money = this.borrowapply.money - this.borrowdetail.money;
                return this.tzb.money;
            }
        }
    })
</script>
</html>
