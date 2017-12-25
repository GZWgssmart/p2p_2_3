package com.animo.service.impl;

import com.animo.dao.ShborrowMapper;
import com.animo.service.ShborrowService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by Animo on 2017-12-22.
 */
@Service
public class ShborrowServiceImpl extends AbstractServiceImpl implements ShborrowService{

    private ShborrowMapper shborrowMapper;


    @Autowired
    public void setShborrowMapper(ShborrowMapper shborrowMapper) {
        super.setBaseMapper(shborrowMapper);
        this.shborrowMapper = shborrowMapper;
    }
}
