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
            <a href="javascript:void(0);" class="active">平台资质</a>
        </div>
        <em class="em-line"></em>
    </div>
    <div class="about-content">
        <div class="title-link">
            <a id="left" href="javascript:;" class="left active">公司证件</a>
            <a id="right" href="javascript:;" class="right">荣誉资质</a>
        </div>
        <div id="zhengjian" class="content">
            <div class="text-banner clearfix" style="display: block;">
                <!-- <div class="credit-left fl" style="width:259px;">
                    <p class="credit-pic" onclick="zjPicBanner(4)">
                        <img src="resources/front/v01/src/images/about/ptzz_10_big.jpg" width="259" height="400">
                        <span style="display: none;">
                            <span>营业执照</span>
                        </span>
                    </p>
                </div> -->
                <div class="credit-right fl" style="width:299px;margin-left:140px;">
                    <p class="credit-pic" onclick="zjPicBanner(0)">
                        <img src="/static/js/font/images/ptzz_06_big.jpg" width="299" height="190">
                        <span style="width: 299px; height: 190px; display: none;">
						<span>开户许可证</span>
					</span>
                    </p>
                    <p class="credit-pic" style="margin-top:20px;" onclick="zjPicBanner(1)">
                        <img src="/static/js/font/images/ptzz_07_big.jpg" width="299" height="190">
                        <span style="width: 299px; height: 190px; display: none;">
						<span>机构信用代码证</span>
					</span>
                    </p>
                </div>
                <div class="credit-right fl" style="width:299px;margin-left:19px;">
                    <p class="credit-pic" onclick="zjPicBanner(2)">
                        <img src="/static/js/font/images/ptzz_08_big.jpg" width="299" height="190">
                        <span style="width: 299px; height: 190px; display: none;">
						<span>汇付天下合同协议</span>
					</span>
                    </p>
                    <p class="credit-pic" style="margin-top:20px;" onclick="zjPicBanner(3)">
                        <img src="/static/js/font/images/ptzz_09_big.jpg" width="299" height="190">
                        <span style="width:299px;height:190px;display: none;">
						<span>国资委备案</span>
					</span>
                    </p>
                </div>
            </div>
        </div>
        <div id="zizhi" class="content" style="display: none;">
            <div class="text-banner clearfix text-banner-two" style="position: relative;">
                <p class="credit-pic">
                    <img src="/static/js/font/images/ptzz_001.jpg" width="265" height="182">
                    <span style="display: none;">
						<span>先进单位</span>
					</span>
                </p>
                <p class="credit-pic">
                    <img src="/static/js/font/images/ptzz_002.jpg" width="265" height="182">
                    <span style="display: none;">
						<span>先进单位</span>
					</span>
                </p>
                <p class="credit-pic">
                    <img src="/static/js/font/images/ptzz_003.jpg" width="265" height="182">
                    <span style="display: none;">
						<span>先进单位</span>
					</span>
                </p>
                <p class="credit-pic" style="margin-right:0;">
                    <img src="/static/js/font/images/ptzz_05.jpg" width="265" height="182">
                    <span style="display: none;">
						<span>信息工作先进单位</span>
					</span>
                </p>
            </div>
        </div>
    </div>
<script>
    $("#left").click(function(){
        $(this).addClass("active");
        $("#right").removeClass("active");
        $("#zhengjian").show();
        $("#zizhi").hide();
    });
    $("#right").click(function(){
        $(this).addClass("active");
        $("#left").removeClass("active");
        $("#zizhi").show();
        $("#zhengjian").hide();
    });
</script>