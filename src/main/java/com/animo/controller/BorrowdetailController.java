package com.animo.controller;

import com.animo.common.ServerResponse;
import com.animo.service.BorrowdetailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 借款详情
 * Created by Animo on 2017-12-25.
 */
@RestController
@RequestMapping("/borrowdetail/data/json")
public class BorrowdetailController {

    @Autowired
    private BorrowdetailService borrowdetailService;

    /**
     * 查看借款详情
     * @param bdid
     * @return
     */
    @GetMapping("info/{bdid}")
    public ServerResponse info(Integer bdid){
        return borrowdetailService.getById(bdid);
    }



}
