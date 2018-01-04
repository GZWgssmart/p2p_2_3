package com.animo.service.impl;

import com.animo.dao.BankcardMapper;
import com.animo.pojo.Bankcard;
import com.animo.service.BankCardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by qm on 2017/12/22.
 *
 * @author qm
 * @date 2017-12-22 9:13
 */
@Service
public class BankCardServiceImpl extends AbstractServiceImpl implements BankCardService {

    private BankcardMapper bankcardMapper;

    @Autowired
    public void setBankcardMapper(BankcardMapper bankcardMapper){
        super.setBaseMapper(bankcardMapper);
        this.bankcardMapper = bankcardMapper;
    }

    @Override
    public Bankcard getByUid(Integer id) {
        return bankcardMapper.getByUid(id);
    }
}
