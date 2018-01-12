<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--<div class="about-right">--%>
<div class="layui-tab layui-tab-brief" lay-filter="demo" style="float: left;">
    <ul class="layui-tab-title">
        <li class="layui-this">项目信息</li>
        <li>项目介绍</li>
        <li>借款人/机构信息</li>
    </ul>
    <div class="layui-tab-content" style="width: 900px">
        <div class="layui-tab-item layui-show">
            <div class="about-content" id="xmxxDiv" style="display: block;">
                <div class="tableDiv">
                    <table class="table2" style="width:900px;">
                        <tbody><tr>
                            <td class="th">信息内容</td>
                            <td class="th">信息说明</td>
                        </tr>
                        <tr>
                            <td class="tdLeft">项目名称</td>
                            <td class="tdRight">平台命名的项目名称，须代表项目的唯一性</td>
                        </tr>
                        <tr>
                            <td class="tdLeft">项目简介</td>
                            <td class="tdRight">指单笔借款项目的基本情况介绍</td>
                        </tr>
                        <tr>
                            <td class="tdLeft">项目金额</td>
                            <td class="tdRight">指标的总金额</td>
                        </tr>
                        <tr>
                            <td class="tdLeft">项目期限</td>
                            <td class="tdRight">指借款人借款的时间</td>
                        </tr>
                        <tr>
                            <td class="tdLeft">起投金额</td>
                            <td class="tdRight">指出借人对本项目的最低出借额度</td>
                        </tr>
                        <tr>
                            <td class="tdLeft">预期收益率</td>
                            <td class="tdRight">一般采用年化收益率表示</td>
                        </tr>
                        <tr>
                            <td class="tdLeft">预计起息日</td>
                            <td class="tdRight">指项目预计开始计算利息的日期</td>
                        </tr>
                        <tr>
                            <td class="tdLeft">还款方式</td>
                            <td class="tdRight">指借款人在合同中约定的还款方式</td>
                        </tr>
                        <tr>
                            <td class="tdLeft">项目状态</td>
                            <td class="tdRight">指项目实施的状态</td>
                        </tr>
                        <tr>
                            <td class="tdLeft">项目融资进度</td>
                            <td class="tdRight">指项目融资的进展情况，一般采用已参与融资项目金额占比或剩余可出借占比的方式表示</td>
                        </tr>
                        <tr>
                            <td class="tdLeft">还款保障措施</td>
                            <td class="tdRight">指为单笔融资项目提供的还款保障措施，如抵押、质押、保证、保险等措施</td>
                        </tr>
                        <tr>
                            <td class="tdLeft">项目风险提示</td>
                            <td class="tdRight">指针对单笔借款项目的风险出借人的风险提示信息</td>
                        </tr>
                        <tr>
                            <td class="tdLeft">资金用途</td>
                            <td class="tdRight">指获贷资金流向信息、使用信息及计划</td>
                        </tr>
                        <tr>
                            <td class="tdLeft">相关费用</td>
                            <td class="tdRight">指投资人投资该项目可能被收取的费用</td>
                        </tr>
                        <tr>
                            <td class="tdLeft">合同模板</td>
                            <td class="tdRight">指项目借款合同模板</td>
                        </tr>
                        <tr>
                            <td class="tdLeft">出借人或投资人<br>适当性管理提示</td>
                            <td class="tdRight">包括但不限于出借人与投资人风险提示，最低出借或起投金额</td>
                        </tr>
                        <tr>
                            <td class="tdLeft">限额管理</td>
                            <td class="tdRight">指同一自然人在该平台的借款余额是否超过人民币20万元；同一法人或其他组织在该平台的借款余额是否超过人民币100万元；同一自然人在不同网络借贷信息中介机构平台借款总余额是否超过人民币100万元；同一法人或其他组织在不同网络借贷信息中介机构平台借款总余额是否超过人民币500万元。</td>
                        </tr>
                        </tbody></table>
                </div>
            </div>
        </div>
        <div class="layui-tab-item">
            <div class="about-content" id="xmjsDiv" style="display: block;">
                <div class="tableDiv">
                    <div class="textItem">
                        <p class="text marginBottom" style="text-indent: 0;"><span class="textRight titleText">恒金保</span></p>
                        <p class="text" style="text-indent: 0;"><span class="textRight colorText">恒大商票以保理公司持有的大型知名企业签发并承兑的商业承兑汇票为还款保障的金融产品，借款到期时，保理公司以承兑企业无条件支付的票面</span></p>
                        <p class="text" style="text-indent: 0;"><span class="textRight colorText">资金用于归还借款本息。</span></p>
                        <img class="xmjsImg" src="/static/js/font/images/hengjin.png" alt="恒金保" width="900">
                    </div>
                    <div class="fgx"></div>
                    <div class="textItem">
                        <p class="text marginBottom" style="text-indent: 0;"><span class="textRight titleText">普金保</span></p>
                        <p class="text" style="text-indent: 0;"><span class="textRight colorText">基于供应链上下游的采购贸易，为采购方或项目方提供融资，融资方以应收账款质押、保证金担保等形式为借款提供担保。</span></p>
                        <img class="xmjsImg" src="/static/js/font/images/pujin.png" alt="普金保" width="900">
                    </div>
                    <div class="fgx"></div>
                    <div class="textItem">
                        <p class="text marginBottom" style="text-indent: 0;"><span class="textRight titleText">多金宝</span></p>
                        <p class="text" style="text-indent: 0;"><span class="textRight colorText">企业由于生产经营周转或项目投资需要资金，提供足值的不动产或动产作为抵质押物申请借款。</span></p>
                        <center><img class="xmjsImg" src="/static/js/font/images/duojin.png" alt="多金保" width="550"></center>
                    </div>
                </div>
            </div>
        </div>

        <div class="layui-tab-item">
            <div class="about-content" id="jkrxxDiv" style="display: block;">
                <div class="tableDiv">
                    <p class="text" style="float: right;"><span class="textRight">备：详情披露参见《借款详情》</span></p>
                    <div class="tableDiv">
                        <table class="zdssTable" style="width:900px;">
                            <tbody><tr>
                                <th class="tdLeft2" style="width:200px;">信息内容</th>
                                <th class="tdRight">信息说明</th>
                            </tr>
                            <tr>
                                <td class="tdLeft2" rowspan="9">借款人为自然人</td>
                            </tr>
                            <tr>
                                <td class="tdRight">借款人姓名（脱敏处理）</td>
                            </tr>
                            <tr>
                                <td class="tdRight">借款人证件号码（脱敏处理）</td>
                            </tr>
                            <tr>
                                <td class="tdRight">借款用途</td>
                            </tr>
                            <tr>
                                <td class="tdRight">在本平台逾期次数</td>
                            </tr>
                            <tr>
                                <td class="tdRight">在本平台逾期总金额</td>
                            </tr>
                            <tr>
                                <td class="tdRight">资产信息</td>
                            </tr>
                            <tr>
                                <td class="tdRight">其它借款信息</td>
                            </tr>
                            <tr>
                                <td class="tdRight">信用信息</td>
                            </tr>
                            <tr>
                                <td class="tdLeft2" rowspan="12">借款人为法人或其它组织</td>
                            </tr>
                            <tr>
                                <td class="tdRight">全称及简称（脱敏处理）</td>
                            </tr>
                            <tr>
                                <td class="tdRight">注册资本</td>
                            </tr>
                            <tr>
                                <td class="tdRight">注册地址（脱敏处理）</td>
                            </tr>
                            <tr>
                                <td class="tdRight">成立时间</td>
                            </tr>
                            <tr>
                                <td class="tdRight">法定代表人（脱敏处理）</td>
                            </tr>
                            <tr>
                                <td class="tdRight">借款用途</td>
                            </tr>
                            <tr>
                                <td class="tdRight">股东信息</td>
                            </tr>
                            <tr>
                                <td class="tdRight">法定代表人信用信息（脱敏处理）</td>
                            </tr>
                            <tr>
                                <td class="tdRight">实缴资本</td>
                            </tr>
                            <tr>
                                <td class="tdRight">办公地点（脱敏处理）</td>
                            </tr>
                            <tr>
                                <td class="tdRight">经营区域</td>
                            </tr>
                            </tbody></table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<%--
</div>--%>
