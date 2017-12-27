package com.animo.service.impl;

import com.animo.dao.BorrowdetailMapper;
import com.animo.service.BorrowdetailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by Animo on 2017-12-24.
 */
@Service
public class BorrowdetailServiceImpl extends AbstractServiceImpl implements BorrowdetailService {

   private BorrowdetailMapper borrowdetailMapper;

   @Autowired
    public void setBorrowdetailMapper(BorrowdetailMapper borrowdetailMapper) {
        super.setBaseMapper(borrowdetailMapper);
        this.borrowdetailMapper = borrowdetailMapper;
    }
}
