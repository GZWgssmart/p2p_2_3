package com.animo.service.impl;

import com.animo.common.Pager;
import com.animo.common.ServerResponse;
import com.animo.dao.LogMoneyMapper;
import com.animo.dao.LogTxMapper;
import com.animo.dao.UsermoneyMapper;
import com.animo.pojo.LogMoney;
import com.animo.pojo.LogTx;
import com.animo.pojo.Usermoney;
import com.animo.service.LogTxService;
import com.animo.utils.DateFormateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by qm on 2017/12/25.
 *
 * @author qm
 * @date 2017-12-25 9:02
 *  0充值
 * 1提现
 */
@Service
public class LogTxServiceImpl extends AbstractServiceImpl implements LogTxService {

    private LogTxMapper logTxMapper;

    private LogMoneyMapper logMoneyMapper;

    private UsermoneyMapper usermoneyMapper;

    @Autowired
    public void setLogTxMapper(LogTxMapper logTxMapper) {
        super.setBaseMapper(logTxMapper);
        this.logTxMapper = logTxMapper;
    }

    @Autowired
    public void setLogMoneyMapper(LogMoneyMapper logMoneyMapper) {
        this.logMoneyMapper = logMoneyMapper;
    }

    @Autowired
    public void setUsermoneyMapper(UsermoneyMapper usermoneyMapper) {
        this.usermoneyMapper = usermoneyMapper;
    }

    @Override
    public Pager listPagerByUid(Integer pageNo, Integer pageSize, Integer uid) {
        Pager pager = new Pager(pageNo, pageSize);
        pager.setRows(logTxMapper.listPagerByUid(pager,uid));
        pager.setTotal(logTxMapper.countByUid(uid));
        return pager;
    }

    @Override
    public Pager listAll(Integer pageNo, Integer pageSize) {
        Pager pager = new Pager(pageNo, pageSize);
        pager.setRows(logTxMapper.listAll(pager));
        pager.setTotal(logTxMapper.count());
        return pager;
    }

    @Override
    public ServerResponse save(Object object) {
        LogTx logTx = (LogTx) object;
        logTx.setStatus(0);
        //保存用户提现记录
        logTxMapper.insertSelective(logTx);
        //修改用户资金
        Usermoney usermoney = usermoneyMapper.selectByUid(logTx.getUid());
        usermoney.setZmoney(usermoney.getZmoney().subtract(logTx.getMoney()));
        usermoney.setKymoney(usermoney.getKymoney().subtract(logTx.getMoney()));
        usermoneyMapper.updateByPrimaryKeySelective(usermoney);
        return ServerResponse.createBySuccess("等待提现审核");
    }


}
