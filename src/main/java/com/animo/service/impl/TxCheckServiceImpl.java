package com.animo.service.impl;

import com.animo.common.Pager;
import com.animo.common.ServerResponse;
import com.animo.dao.LogMoneyMapper;
import com.animo.dao.TxCheckMapper;
import com.animo.dao.UsermoneyMapper;
import com.animo.pojo.LogMoney;
import com.animo.pojo.LogTx;
import com.animo.pojo.Usermoney;
import com.animo.service.LogMoneyService;
import com.animo.service.LogTxService;
import com.animo.service.TxCheckService;
import com.animo.utils.DateFormateUtils;
import com.animo.vo.TxCheckVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;

/**
 * Created by qm on 2017/12/25.
 *
 * @author qm
 * @date 2017-12-25 11:06
 */
@Service
public class TxCheckServiceImpl extends AbstractServiceImpl implements TxCheckService {

    private TxCheckMapper txCheckMapper;

    private UsermoneyMapper usermoneyMapper;

    private LogMoneyMapper logMoneyMapper;
    @Autowired
    public void setTxCheckMapper(TxCheckMapper txCheckMapper) {
        super.setBaseMapper(txCheckMapper);
        this.txCheckMapper = txCheckMapper;
    }
    @Autowired
    public void setUsermoneyMapper(UsermoneyMapper usermoneyMapper) {
        this.usermoneyMapper = usermoneyMapper;
    }

    public void setLogMoneyMapper(LogMoneyMapper logMoneyMapper) {
        this.logMoneyMapper = logMoneyMapper;
    }

    /**
     * 分页查看提现审核记录
     * @param pageNo
     * @param pageSize
     * @return
     */
    @Override
    public Pager listPager(int pageNo, int pageSize) {
        Pager pager = new Pager(pageNo, pageSize);
        pager.setRows(txCheckMapper.listPager(pager));
        pager.setTotal(txCheckMapper.count());
        return pager;
    }

    @Override
    @Transactional
    public ServerResponse updateUserMoneyAndLogMoney(Usermoney usermoney, LogMoney logMoney, TxCheckVO txCheckVO) {
        usermoney =usermoneyMapper.selectByUid(txCheckVO.getUid());
        //审核成功后对可用余额和总资产进行相应加减
        usermoney.setKymoney(usermoney.getKymoney().subtract(txCheckVO.getMoney()));
        usermoney.setZmoney(usermoney.getZmoney().subtract(txCheckVO.getMoney()));
        //更新用户资金表
        usermoneyMapper.insertSelective(usermoney);
        logMoney.setUid(txCheckVO.getUid());
        logMoney.setOutlay(txCheckVO.getMoney());
        logMoney.setCreatedTime(DateFormateUtils.Formate());
        //插入用户资金流向记录表
        logMoneyMapper.insertSelective(logMoney);
        return ServerResponse.createBySuccess("审核成功");
    }

}
