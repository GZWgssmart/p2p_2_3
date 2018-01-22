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
    <link rel="stylesheet" href="/static/layui/css/layui.css">
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
                    <p class="text"><span id="amt">{{borrowapply.money | money}}</span>元</p>
                </div>
            </div>
            <div class="subject-submit-bottom">
                <div class="subject-submit-b-l">
                    <p>还款方式：<span id="paymentMode">{{borrowdetail.way | wayFilter}}</span></p>
                    <p>最小投标金额：<span id="minTenderedSum">100.00元</span></p>
                </div>
                <div class="subject-submit-b-l">
                    <p>总投标数：<span id="investNum">10</span></p>
                    <p>最大投标金额：<span id="maxTenderedSum">{{borrowapply.money-borrowdetail.money}}</span></p>
                </div>
                <div class="subject-submit-b-r">
                    <div class="line">
                        <p>投资进度：</p>
                        <div class="layui-progress" style="float: left;width: 100px;margin-top: 13px" >
                            <div class="layui-progress layui-progress-bar layui-bg-red" v-bind:lay-percent="borrowdetail.money/borrowapply.money*100 + '%'" ></div>
                        </div>
                        {{borrowdetail.money/borrowapply.money*100 |formatNumber}}%
                    </div>
                    <p>截止时间：<span id="publishTime">{{borrowapply.deadline | formatDate}}</span></p>
                </div>
            </div>
        </div>
        <div class="subject-submit-r" style="display: block;">
            <div class="subject-s-r-u">

            </div>
            <div class="subject-s-r-c">
                <p>可用余额：<span id="canUseSum">
                <p v-if="${sessionScope.user!=null}">{{money |money}}元</p>
                <p v-else>登录后查看余额</p>
                </span></p>
            </div>
            <div class="subject-s-r-c">
                <p>剩余可投：<span id="investAmount">{{borrowapply.money-borrowdetail.money | money}}元</span></p>
            </div>
            <div class="input">
                <input type="text" placeholder="请输入投资金额" v-model="tzb.money">
                <button type="button" @click="touzi">投资</button>
            </div>
            <div class="quan">
                <select v-model="tzb.resint3">
                    <option value="0" selected>请选择优惠券</option>
                    <option v-for="item in tickets" :value="item.ukid">{{item.type |type}} 价值:{{item.tkmoney}}</option>
                </select>
                <a href="javaScript:;" class="icon icon-cal" @click="calc">详细收益明细</a>
            </div>
            <button v-if="borrowapply.ckstatus==2" class="btn"  type="button">投标中</button>
            <button v-else class="btn disabled"  type="button">还款中</button>
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
            <p class="title">募集资金：</p><p class="content" id="projectAmount">{{borrowapply.money |money}}元</p>
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
            <p class="title">收益方式：</p><p class="content" id="projectType">{{borrowdetail.way | wayFilter}}</p>
        </div>
        <div class="detail cl">
            <p class="title">还款来源：</p><p class="content" id="retsource">{{borrowdetail.hksource}}</p>
        </div>
        <div class="detail cl">
            <p class="title">借款人介绍：</p><p class="content" id="projectIntro">{{borrowdetail.suggest}}</p>
        </div>
        <div class="detail cl">
            <p class="title">项目描述：</p><p class="content" id="projectDetail">{{borrowdetail.xmdes}}</p>
        </div>
        <div class="detail cl">
            <p class="title">保障措施：</p><p class="content" id="safeMeasures">{{borrowdetail.guarantee}}</p>
        </div>
    </div>
    <div class="sub-a-box files" id="files">
        <p class="icon icon-danger files-title">互联金融将以客观、公正的原则，最大程度地核实借入者信息的真实性，但不保证审核信息100%真实。如果借入者长期逾期，其提供的信息将被公布。</p>
        <ul class="files-box">
            <li class="">
                <img alt="" width="320" height="200" :src="borrowdetail.fpic">
                <p>
                    <span class="icon icon-true">法人身份认证</span>
                </p>
            </li>
            <li class="">
                <img alt="" width="320" height="200" :src="borrowdetail.ypic">
                <p>
                    <span class="icon icon-true">营业执照</span>
                </p>
            </li>
            <li class="">
                <img alt="" width="320" height="200" :src="borrowdetail.qpic">
                <p>
                    <span class="icon icon-true">企业银行</span>
                </p>
            </li>
            <li class="">
                <img alt="" width="320" height="200" :src="borrowdetail.tpic">
                <p>
                    <span class="icon icon-true">其他资料</span>
                </p>
            </li>
        </ul>
    </div>
    <div class="sub-a-box plan" id="plan">
        <ul class="">
            <li class="title">
                <div class="children0">序号</div>
                <div class="children1">计划还款日期</div>
                <div class="children2">实际还款日期</div>
                <div class="children3">已还本息</div>
                <div class="children4">待还本息</div>
                <div class="children5">已付罚息</div>
                <div class="children6">待还罚息</div>
                <div class="children7">状态</div>
            </li>
        </ul>
        <ul class="listData">
            <li v-for="(item,index) in rows" :class="index%2==0?interval:''">
                <div class="children0">{{index+1}}</div><div class="children1">{{item.ytime}}</div><div class="children2">{{item.rtime}}&nbsp;</div><div class="children3">{{item.ybx}}</div><div class="children4">{{item.rbx}}</div><div class="children5">{{item.yfc}}</div><div class="children6">{{item.rfc}}</div><div class="children7">{{item.status |State}}</div>
            </li>
        </ul>
        <div id="demo2"></div>
    </div>
    <div class="sub-a-box invest" id="invest">
        <ul class="">
            <li class="title"><div class="children0">投资人</div><div class="children1">金额</div><div class="children2">投资时间</div></li>
            <li v-for="item in rows" class="title">
                <div class="children0">{{item.rname}}</div>
                <div class="children1">{{item.money}}</div>
                <div class="children2">{{item.tztime}}</div>
            </li>
        </ul>
        <div id="demo3"></div>
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
<script src="/static/js/jquery.min.js"></script>
<script type="text/javascript" src="/static/js/borrowapply/detail.js"></script>
<script src="/static/js/vue.min.js"></script>
<script src="/static/js/axios.min.js"></script>
<script src="/static/layui/layui.js"></script>
<script src="/static/js/qs.js"></script>
<script src="/static/js/common.js"></script>
<script>

    var laypage;
    layui.use(['laypage','layer','element'], function(){
        var element = layui.element;
        laypage = layui.laypage
    });

    var vue = new Vue({
        el:'#app',
        data:{
            money:'',
            interval:'interval',
            borrowapply:[],
            borrowdetail:[],
            rows:[],
            bdid:${requestScope.get("bdid")},
            bzname:'${requestScope.get("bzname")}',
            tzb:{
                money:'',
                baid:${requestScope.get("baid")},
                resint1:'',
                resint2:'',
                resint3:'0'
            },
            tickets:[],
            tkmoney:0,
            userTicket:[]
        },
        filters: {
            formatDate(time) {
                var date = new Date(time);
                return formatDate(date, 'yyyy-MM-dd');
            },
            wayFilter(way){
                return sway(way);
            },
            StringAndNull(value){
                if(value==0|| value==null){
                    return "无";
                }
            },
            State(value){
                if(value==0){
                    return "未还款";
                }else if(value==1){
                    return "已还款";
                }else if(value==2){
                    return "已逾期";
                }
            },
            formatNumber(value){
                if(value==Infinity){
                    return 0;
                }
                return value.toFixed(2);
            },
            money(value){
                return formatMoney(value,2);
            },
            type(value){
                if(value==0){
                    return"代金券";
                }else{
                    return"现金券";
                }
            }
        },
        created (){
            axios.all([getinfo(this.tzb.baid,this.bdid),getmoney(),getTicket()]).then(axios.spread((borrowapplyDetail,money,tickets)=>{
                 this.borrowapply = borrowapplyDetail.data.data.borrowapply;
                 this.borrowdetail = borrowapplyDetail.data.data.borrowdetail;
                 this.money = money.data.data.kymoney;
                 this.tickets = tickets.data.data;
            }));
        },
        methods:{
            touzi () {
                if(${sessionScope.user.idno==null}){
                    return alert('请到个人中心完善信息');
                }
                if(this.borrowapply.money ==this.borrowdetail.money){
                    alert("已投满");
                }else if(this.tzb.money==0){
                    alert("请输入投资金额");
                }else if(this.tzb.money>(this.borrowapply.money-this.borrowdetail.money)){
                    alert("投资大于剩余投资");
                }else if(this.tzb.money<100){
                    alert("最小投资100");
                }else{
                    this.tzb.resint1 = this.borrowapply.term;
                    this.tzb.resint2 = this.borrowdetail.way;
                    console.log(Qs.stringify(this.tzb));
                    if(this.tzb.resint3=='0'){
                        this.tzb.resint3=null;
                    }
                    if(this.tzb.resint3!=null && this.tzb.resint3!='0') {
                        axios.get('/userTicket/data/json/getMoney?ukid=' + this.tzb.resint3).then((response) => {
                            this.userTicket= response.data.data;
                        });
                    }
                    axios.post('/tzb/data/json/save', Qs.stringify(this.tzb)).then((response) => {
                        if(response.data.code==0){
                            this.money =parseInt(this.money) - parseInt(this.tzb.money)+this.userTicket.tkmoney;
                            this.borrowdetail.money=parseInt(this.borrowdetail.money)+parseInt(this.tzb.money);
                            this.tzb.resint3="0";
                            return alert(response.data.message);
                        }
                        alert(response.data.message)
                    });
                }
            },
            getJsonShang(laypage,url,demo){
                $.getJSON(url, {
                    page: 1,
                    limit: 6,
                    baid:this.tzb.baid
                }, function(res){
                    laypage.render({
                        elem: demo,
                        count: res.total,
                        limit :6,
                        jump: function(e, first){
                            if (!first) {
                                vue.getJsonXia(e,url);
                            } else {
                                vue.getJsonXia(e,url);
                            }
                        }
                    });
                });
            },
            getJsonXia (e,url) {
                $.getJSON(url, {
                    page: e.curr,
                    limit: e.limit,
                    baid:this.tzb.baid
                }, function (res) {
                    vue.rows= res.rows;
                });
            },
            calc () {
                window.location.href = "/borrowapply/calc"
            }
        }
    })
</script>
</html>
