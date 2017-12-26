package com.animo.service.impl;

import com.animo.dao.LetterMapper;
import com.animo.service.LetterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by CHEN JX on 2017/12/25.
 */
@Service
public class LetterServiceImpl extends  AbstractServiceImpl implements LetterService{

    private LetterMapper letterMapper;
    @Autowired
    public void setLetterMapper(LetterMapper letterMapper) {
        super.setBaseMapper(letterMapper);
        this.letterMapper = letterMapper;
    }
}
