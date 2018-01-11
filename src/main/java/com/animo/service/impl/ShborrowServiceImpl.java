package com.animo.service.impl;

import com.animo.common.ServerResponse;
import com.animo.dao.BorrowapplyMapper;
import com.animo.dao.ShborrowMapper;
import com.animo.pojo.Shborrow;
import com.animo.service.ShborrowService;
import com.animo.utils.DateFormateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * Created by Animo on 2017-12-22.
 */
@Service
public class ShborrowServiceImpl extends AbstractServiceImpl implements ShborrowService{

    private ShborrowMapper shborrowMapper;

    private BorrowapplyMapper borrowapplyMapper;

    @Autowired
    public void setShborrowMapper(ShborrowMapper shborrowMapper) {
        super.setBaseMapper(shborrowMapper);
        this.shborrowMapper = shborrowMapper;
    }

    @Autowired
    public void setBorrowapplyMapper(BorrowapplyMapper borrowapplyMapper) {
        this.borrowapplyMapper = borrowapplyMapper;
    }

    @Override
    @Transactional
    public ServerResponse save(Object object) {
        Integer ckstatus=null;
        Shborrow shborrow = (Shborrow)object;
        shborrowMapper.insertSelective(object);
        if(shborrow.getIsok()==1){
            ckstatus=1;
        }else{
            ckstatus=2;
        }
        Integer integer = borrowapplyMapper.updateStatusAndTime(shborrow.getBaid(),ckstatus,DateFormateUtils.Formate());
        if(integer==1){
            return ServerResponse.createBySuccess("审核成功");
        }
        return ServerResponse.createByError("审核失败");
    }
}
