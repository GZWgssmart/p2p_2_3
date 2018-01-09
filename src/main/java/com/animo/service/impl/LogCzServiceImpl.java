package com.animo.service.impl;

import com.animo.common.Pager;
import com.animo.common.ServerResponse;
import com.animo.dao.LogCzMapper;
import com.animo.dao.LogMoneyMapper;
import com.animo.dao.UsermoneyMapper;
import com.animo.pojo.LogCz;
import com.animo.pojo.LogMoney;
import com.animo.pojo.Usermoney;
import com.animo.service.LogCzService;
import com.animo.utils.DateFormateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * Created by qm on 2017/12/22.
 *
 * @author qm
 * @date 2017-12-22 15:53
 * 0充值
 * 1提现
 */
@Service
public class LogCzServiceImpl extends AbstractServiceImpl implements LogCzService {

    private LogCzMapper logCzMapper;

    private LogMoneyMapper logMoneyMapper;

    private UsermoneyMapper usermoneyMapper;

    @Autowired
    public void setLogCzMapper(LogCzMapper logCzMapper){
        super.setBaseMapper(logCzMapper);
        this.logCzMapper = logCzMapper;
    }

    @Autowired
    public void setLogMoneyMapper(LogMoneyMapper logMoneyMapper) {
        this.logMoneyMapper = logMoneyMapper;
    }

    @Autowired
    public void setUsermoneyMapper(UsermoneyMapper usermoneyMapper) {
        this.usermoneyMapper = usermoneyMapper;
    }

    /**
     * 分页显示充值记录
     * @param pageNo
     * @param pageSize
     * @return
     */
    @Override
    public Pager listPagerByUid(Integer pageNo, Integer pageSize, Integer uid) {
        Pager pager = new Pager(pageNo, pageSize);
        pager.setRows(logCzMapper.listPagerByUid(pager,uid));
        pager.setTotal(logCzMapper.countByUid(uid));
        return pager;
    }

    @Override
    @Transactional
    public ServerResponse save(Object object) {
        LogCz logCz = (LogCz)object;
        //保存用户充值记录
        logCzMapper.insertSelective(logCz);
        LogMoney logMoney = new LogMoney();
        logMoney.setUid(logCz.getUid());
        logMoney.setType(0);
        logMoney.setIncome(logCz.getMoney());
        logMoney.setCreatedTime(DateFormateUtils.Formate());
        //保存用户资金流向记录
        logMoneyMapper.insertSelective(logMoney);
        Usermoney usermoney = usermoneyMapper.selectByUid(logCz.getUid());
        usermoney.setKymoney(usermoney.getKymoney().add(logCz.getMoney()));
        usermoney.setZmoney(usermoney.getZmoney().add(logCz.getMoney()));
        usermoneyMapper.updateByPrimaryKeySelective(usermoney);
        return ServerResponse.createBySuccess("充值成功");
    }
}
