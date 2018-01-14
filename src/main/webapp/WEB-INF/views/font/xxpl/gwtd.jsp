<%--
  Created by IntelliJ IDEA.
  User: CHEN JX
  Date: 2018/1/12
  Time: 9:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <div class="about-right-nav">
        <div class="sub-a-nav">
            <a href="javascript:void(0);" class="active">顾问团队</a>
        </div>
        <em class="em-line"></em>
    </div>
    <div class="about-content">
        <div class="title-link">
            <a id="left" href="javascript:;" class="left active">法律顾问</a>
            <a id="right" href="javascript:;" class="right">律师事务所</a>
        </div>
        <div id="falv" class="content">
            <div class="content-photo">
                <div class="content-photo-left">
                    <img src="/static/js/font/images/guwen_01.png">
                    <p class="name">张齐敏</p>
                    <p class="jobs">首席法律顾问</p>
                </div>
                <div class="content-photo-right">
                    <p>就读于江西财经大学EMBA，2005始进入南芳律师事务所做专职律师，2014年5月至今在北京市中银（赣州）律师事务所工作。</p>
                    <p>先后担任赣州市规划建设局、赣州市交通局、瑞金市人民政府、龙南县人民政府、赣州外商协会、赣江源商会、赣州市盐业局、赣州市公路局大余分局、青峰药业、谱赛科（江西）生物技术有限公司、江西百福房地产、赣州长发置业有限公司、赣州华大置业有限公司、赣州新起点工贸有限公司、南康鑫南投资有限公司、赣州金地实业有限公司、江西贵竹房地产开发有限公司、赣州君嘉酒店集团、江西兴万家现代农业有限公司、赣州名忠汽车有限公司、赣州锦城建设开发有限公司、《赣南社会科学》杂志、《城市经纬》杂志、《赣州民营企业》杂志等四十余家行政、企事业单位的常年法律顾问。</p>
                </div>
            </div>
            <!-- <div class="content-photo">
                <div class="content-photo-left">
                    <img src="resources/front/v01/src/images/about/guwen_02.png"/>
                    <p class="name">李勇华</p>
                    <p class="jobs">项目主办人 / 律师</p>
                </div>
                <div class="content-photo-right">
                    <p>1999/09--2003/06 武汉大学法学、2006/09--2009/06 重庆大学经济法学 硕士，2009/08--2013/08就职于北京国枫凯文（深圳）律师事务所，2013/09--至今就职于北京市中银（赣州）律师事务所。</p>
                    <p>主要业务领域：合同法、公司法、知识产权法、劳动合同法等方面的法律问题。</p>
                    <p>执业期间代理众多物业服务合同纠纷、借款合同纠纷、劳动争议纠纷、建设工程合同纠纷等，并在公司并购、公司境内外上市及融资方面有丰富的经验积累，具备较强的法律专业知识和法律技能。</p>
                </div>
            </div> -->
        </div>
        <div id="shiwu" class="content" style="display: none;">
            <p class="text">中银律师事务所成立于1993年1月，是经司法部门批准的我国最早的合伙制律师事务所之一，也是我国最早从事证券法律业务的律师事务所，目前可在金融证券和公司法律风险管理、建筑与房地产、知识产权、国际业务领域提供全面的法律服务，在律师界和金融证券界已经牢固树立了“中银律师”的品牌。迄今，中银律师已为中国300余家企业的IPO及上市公司的配股、增发、并购与资产重组提供了优质法律服务。</p>
            <p class="text">中银律师总部设在北京，目前已在上海、天津、深圳等27个城市设有分支机构，现有律师和工作人员一千余人，绝大部分律师获得国内及国外著名学府的硕士和博士学位，且多数律师具有在政府、企业、知名律师事务所工作或执业的经历，在法律和商业领域具备了丰富的实务经验。中银律师事务所规模位列全国第三位。</p>
            <p class="text">中银赣州团队近30人，秉承总所办所宗旨，长期致力于金融资本法律业务与企业法律风险管理实务，先后为40余家市重点企业提供常年法律顾问服务，与政府经济职能部门、当地司法资源保持着良好、健康的合作关系；赢得了业内外的良好口碑及品牌影响力。本所实施专业分工、团队合作运作模式，即每位律师专攻1-2个专业领域，以达到“因为专注、所以专业”，再由全所集中统筹，形成团队合力，组成有机团队为委托方提供全方位的法律服务。本所现设：金融法律事务部、法律风险管理事务部、人力资源法律事务部、知识产权法律事务部、房地产建设工程法律事务部及民商事争议解决中心等专业部门。</p>
            <img class="img" src="/static/js/font/images/shiwu_03.png">
        </div>
    </div>
<script>
    $("#left").click(function(){
        $(this).addClass("active");
        $("#right").removeClass("active");
        $("#falv").show();
        $("#shiwu").hide();
    });
    $("#right").click(function(){
        $(this).addClass("active");
        $("#left").removeClass("active");
        $("#shiwu").show();
        $("#falv").hide();
    });
</script>