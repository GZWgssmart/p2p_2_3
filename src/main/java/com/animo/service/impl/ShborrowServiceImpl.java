package com.animo.service.impl;

import com.animo.dao.ShborrowMapper;
import com.animo.service.ShborrowService;

/**
 * Created by Animo on 2017-12-22.
 */
public class ShborrowServiceImpl extends AbstractServiceImpl implements ShborrowService{

    private ShborrowMapper shborrowMapper;


    public void setShborrowMapper(ShborrowMapper shborrowMapper) {
        super.setBaseMapper(shborrowMapper);
        this.shborrowMapper = shborrowMapper;
    }
}
