package com.animo.service.impl;

import com.animo.common.Pager;
import com.animo.common.ServerResponse;
import com.animo.dao.LogMoneyMapper;
import com.animo.dao.LogTxMapper;
import com.animo.dao.TxCheckMapper;
import com.animo.dao.UsermoneyMapper;
import com.animo.pojo.*;
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

    private LogTxMapper logTxMapper;

    @Autowired
    public void setLogTxMapper(LogTxMapper logTxMapper) {
        this.logTxMapper = logTxMapper;
    }

    @Autowired
    public void setTxCheckMapper(TxCheckMapper txCheckMapper) {
        super.setBaseMapper(txCheckMapper);
        this.txCheckMapper = txCheckMapper;
    }
    @Autowired
    public void setUsermoneyMapper(UsermoneyMapper usermoneyMapper) {
        this.usermoneyMapper = usermoneyMapper;
    }

    @Autowired
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
    public ServerResponse save(Object object) {
        TxCheckVO txCheckvo = (TxCheckVO)object;
        if(txCheckvo.getStatus()==0){
            TxCheck txCheck = new TxCheck();
            txCheck.setExcuse(txCheckvo.getExcuse());
            txCheck.setHuid(1);
            txCheck.setIsok(txCheckvo.getStatus());
            txCheck.setTxid(txCheckvo.getTxid());
            txCheck.setCreatedTime(DateFormateUtils.Formate());
            Integer integer = txCheckMapper.insertSelective(txCheck);
            if(integer==1){
                //添加用户资金流向记录
                LogMoney logMoney = new LogMoney();
                logMoney.setUid(txCheckvo.getUid());
                logMoney.setType(1);
                logMoney.setOutlay(txCheckvo.getMoney());
                logMoney.setCreatedTime(DateFormateUtils.Formate());
                logMoneyMapper.insertSelective(logMoney);
                //修改提现记录状态
                logTxMapper.updateStatus(txCheckvo.getTxid(),1);
                return ServerResponse.createBySuccess("审核成功");
            }
        }else{
            //修改提现记录状态
            logTxMapper.updateStatus(txCheckvo.getTxid(),2);
            //修改用户资金
            Usermoney usermoney = usermoneyMapper.selectByUid(txCheckvo.getUid());
            usermoney.setZmoney(usermoney.getZmoney().add(txCheckvo.getMoney()));
            usermoney.setKymoney(usermoney.getKymoney().add(txCheckvo.getMoney()));
            usermoneyMapper.updateByPrimaryKeySelective(usermoney);
            return ServerResponse.createBySuccess("审核成功");
        }
        return ServerResponse.createByError("服务出错");
    }


    //    @Override
//    @Transactional
//    public ServerResponse updateUserMoneyAndLogMoney(Usermoney usermoney, LogMoney logMoney, TxCheckVO txCheckVO) {
//        if(txCheckVO.getStatus()==1){
//            usermoney = usermoneyMapper.selectByUid(txCheckVO.getUid());
//            //审核成功后对可用余额和总资产进行相应加减
//            if (usermoney.getKymoney().doubleValue() - txCheckVO.getMoney().doubleValue() > 0
//                    && usermoney.getZmoney().doubleValue() - txCheckVO.getMoney().doubleValue() > 0) {
//                usermoney.setZmoney(usermoney.getZmoney().subtract(txCheckVO.getMoney()));
//                usermoney.setKymoney(usermoney.getKymoney().subtract(txCheckVO.getMoney()));
//            }
//            //更新用户资金表
//            usermoneyMapper.updateUserMoney(usermoney);
//            logMoney.setUid(txCheckVO.getUid());
//            logMoney.setOutlay(txCheckVO.getMoney());
//            //1表示提现，0表示充值
//            logMoney.setType(1);
//            logMoney.setCreatedTime(DateFormateUtils.Formate());
//            //插入用户资金流向记录表
//            logMoneyMapper.insertSelective(logMoney);
//            return ServerResponse.createBySuccess("审核成功");
//        }else if(txCheckVO.getStatus()==2){
//            return ServerResponse.createBySuccess("您已拒绝用户的提现");
//        }else{
//            return ServerResponse.createByError("审核理由不充分");
//        }
//    }

}
