package com.animo.service.impl;

import com.animo.common.Pager;
import com.animo.common.ServerResponse;
import com.animo.common.ValidationResult;
import com.animo.dao.BorrowapplyMapper;
import com.animo.dao.BorrowdetailMapper;
import com.animo.pojo.Borrowapply;
import com.animo.pojo.Borrowdetail;
import com.animo.service.BorrowapplyService;
import com.animo.utils.ValidationUtils;
import com.animo.vo.BorrowApplyDetail;
import com.animo.vo.BorrowapplyMoneyVo;
import com.animo.vo.BorrowingVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

/**
 * Created by Animo on 2017-12-24.
 */
@Service
public class BorrowapplyServiceImpl extends AbstractServiceImpl implements BorrowapplyService{


    private BorrowapplyMapper borrowapplyMapper;

    private BorrowdetailMapper borrowdetailMapper;

    @Autowired
    public void setBorrowapplyMapper(BorrowapplyMapper borrowapplyMapper) {
        super.setBaseMapper(borrowapplyMapper);
        this.borrowapplyMapper = borrowapplyMapper;
    }

    @Autowired
    public void setBorrowdetailMapper(BorrowdetailMapper borrowdetailMapper) {
        this.borrowdetailMapper = borrowdetailMapper;
    }

    @Override
    public ServerResponse updateTime(Integer baid, Integer ckstatus, Date cktime) {
        Integer integer = borrowapplyMapper.updateTime(baid,ckstatus,cktime);
        return integer==1?ServerResponse.createBySuccess("更新成功"):ServerResponse.createByError("更新失败");
    }

    @Override
    public ServerResponse IndexBzBorrowapply(Integer bzid) {
        return ServerResponse.createBySuccess(borrowapplyMapper.three(bzid));
    }

    @Override
    public Pager listPagerCriteria(Integer pageNumber, Integer pageSize, Object object) {
        Pager pager = new Pager(pageNumber, pageSize);
        pager.setRows(borrowapplyMapper.listPagerCriteria(pager, object));
        pager.setTotal(borrowapplyMapper.countCriteria(object));
        return pager;
    }

    @Override
    public ServerResponse getMoneyAndYMoney(Integer baid) {
        BorrowapplyMoneyVo borrowapplyMoneyVo = (BorrowapplyMoneyVo) borrowapplyMapper.getById(baid);
        if(borrowapplyMoneyVo.getMmoney().compareTo(borrowapplyMoneyVo.getMoney())==0){
            return ServerResponse.createBySuccess("已投满");
        }
        return ServerResponse.createByError("未投满");
    }

    @Override
    public Pager listByJuid(Integer pageNo, Integer pageSize, Integer juid) {
        Pager pager = new Pager(pageNo,pageSize);
        pager.setRows(borrowapplyMapper.listByJuid(pager,juid));
        pager.setTotal(borrowapplyMapper.countByJuid(juid));
        return pager;
    }

    @Override
    public ServerResponse saveBorrow(Borrowapply borrowApply, Borrowdetail borrowDetail) {
        ValidationResult validationResult = ValidationUtils.validateEntity(borrowApply);
        if(validationResult.isHasErrors()) {
            return ServerResponse.createByError("保存失败");
        }
        validationResult = ValidationUtils.validateEntity(borrowDetail);
        if(validationResult.isHasErrors()) {
            return ServerResponse.createByError("保存失败");
        }
        if(borrowapplyMapper.insertSelective(borrowApply) == 0) {
            return ServerResponse.createByError("保存失败");
        }
        borrowDetail.setBaid(borrowApply.getBaid());
        borrowDetail.setMoney(BigDecimal.valueOf(0));
        borrowDetail.setCpname("PJ" + Calendar.getInstance().get(Calendar.YEAR) + "BZ" + getCpName(borrowApply.getBaid()));
        if(borrowdetailMapper.insertSelective(borrowDetail) == 0){
            return ServerResponse.createByError("保存失败");
        }
        return ServerResponse.createBySuccess("保存成功");
    }

    @Override
    public List<Borrowapply> list(Integer ckstatus) {
        return borrowapplyMapper.list(ckstatus);
    }

    @Override
    public List<BorrowApplyDetail> getByCkstaus(Integer ckstatus) {
        return borrowapplyMapper.getByCkstaus(ckstatus);
    }


    @Override
    public List<BorrowingVO> borrowingList() {
        return borrowapplyMapper.borrowingList();
    }

    private String getCpName(Integer baid) {
        if(baid / 1000 % 10 > 0) {
            return "" + baid;
        }
        if(baid / 100 % 10 > 0) {
            return "0" + baid;
        }
        if(baid / 10 > 0) {
            return "00" + baid;
        }
        if(baid % 10 > 0) {
            return "000" + baid;
        }
        return getCpName(Math.round(baid / 10));
    }
}
