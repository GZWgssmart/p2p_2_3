package com.animo.service.impl;

import com.animo.common.Pager;
import com.animo.common.ServerResponse;
import com.animo.dao.BorrowapplyMapper;
import com.animo.service.BorrowapplyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;

/**
 * Created by Animo on 2017-12-24.
 */
@Service
public class BorrowapplyServiceImpl extends AbstractServiceImpl implements BorrowapplyService{


    private BorrowapplyMapper borrowapplyMapper;

    @Autowired
    public void setBorrowapplyMapper(BorrowapplyMapper borrowapplyMapper) {
        super.setBaseMapper(borrowapplyMapper);
        this.borrowapplyMapper = borrowapplyMapper;
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
}
