package com.animo.service.impl;

import com.animo.common.Pager;
import com.animo.common.ServerResponse;
import com.animo.dao.BorrowapplyMapper;
import com.animo.dao.HkbMapper;
import com.animo.dao.UsermoneyMapper;
import com.animo.enums.BorrowStatusEnum;
import com.animo.pojo.Borrowapply;
import com.animo.pojo.Hkb;
import com.animo.pojo.Usermoney;
import com.animo.service.HkbService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Calendar;

/**
 * Created by Animo on 2018-01-06.
 */
@Service
public class HkbServiceImpl extends AbstractServiceImpl implements HkbService {

    private HkbMapper hkbMapper;

    private UsermoneyMapper usermoneyMapper;

    private BorrowapplyMapper borrowapplyMapper;


    @Autowired
    public void setBorrowapplyMapper(BorrowapplyMapper borrowapplyMapper) {
        this.borrowapplyMapper = borrowapplyMapper;
    }

    @Autowired
    public void setUsermoneyMapper(UsermoneyMapper usermoneyMapper) {
        this.usermoneyMapper = usermoneyMapper;
    }

    @Autowired
    public void setHkbMapper(HkbMapper hkbMapper) {
        super.setBaseMapper(hkbMapper);
        this.hkbMapper = hkbMapper;
    }

    @Override
    public Pager pager(Integer pageNumber, Integer pageSize, Integer baid) {
        Pager pager = new Pager(pageNumber, pageSize);
        pager.setRows(hkbMapper.listPagerByBaid(pager,baid));
        pager.setTotal(hkbMapper.countByBaid(baid));
        return pager;
    }


    @Override
    @Transactional
    public ServerResponse confirm(Hkb hkb) {
        Usermoney userMoney = usermoneyMapper.selectByUid(hkb.getUid());
        if(Calendar.getInstance().getTimeInMillis() < hkb.getYtime().getTime()) {
            return ServerResponse.createByError("还未到还款时间");
        }
        if(userMoney.getKymoney().compareTo(hkb.getYbx()) == -1) {
            return ServerResponse.createByError("余额不足，请充值后操作");
        }
        userMoney.setKymoney(userMoney.getKymoney().subtract(hkb.getYbx()));
        userMoney.setZmoney(userMoney.getZmoney().subtract(hkb.getYbx()));
        usermoneyMapper.updateByPrimaryKeySelective(userMoney);
        // 更新单个
        hkb.setRbj(hkb.getYbj());
        hkb.setRbx(hkb.getYbx());
        hkb.setRlx(hkb.getYlx());
        hkb.setRtime(Calendar.getInstance().getTime());
        hkb.setStatus(1);
        hkbMapper.updateByPrimaryKeySelective(hkb);
        // 更新此标所有
        Hkb hkb1 = new Hkb();
        hkb1.setBaid(hkb.getBaid());
        hkb1.setUid(hkb.getUid());
        hkb1.setRnum(hkb.getRnum() + 1);
        hkbMapper.updateByBaid(hkb1);
        if(hkb1.getRnum().equals(hkb.getTnum())) {
            borrowapplyMapper.updateStatus(hkb.getBaid(),BorrowStatusEnum.COMPLETE.getCode());
        }
        return ServerResponse.createBySuccess("还款成功");
    }

}
