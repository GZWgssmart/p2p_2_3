package com.animo.controller;

import com.animo.calculate.ACMLoanCalculator;
import com.animo.calculate.ACPIMLoanCalculator;
import com.animo.calculate.Loan;
import com.animo.calculate.LoanUtil;
import com.animo.common.ServerResponse;
import com.animo.enums.WayEnum;
import com.animo.query.CalcQuery;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by qingfeng on 2018/1/8.
 */
@RestController
@RequestMapping("/data/calc")
public class CalcController {

    @PostMapping("calc")
    public ServerResponse getPlan(CalcQuery calcQuery) {
        List<Object> objects = new ArrayList<>();
        //等额本息
        if(WayEnum.EQUAL_BX.getCode().equals(calcQuery.getType()+"")) {
            Loan loan = new ACPIMLoanCalculator().calLoan(calcQuery.getTotalMoney(), calcQuery.getMonth(), calcQuery.getNprofit(), LoanUtil.RATE_TYPE_YEAR);
            objects.addAll(loan.getAllLoans());
           return ServerResponse.createBySuccess(objects);
        } else {
            Loan loan = new ACMLoanCalculator().calLoan(calcQuery.getTotalMoney(), calcQuery.getMonth(), calcQuery.getNprofit(), LoanUtil.RATE_TYPE_YEAR);
            objects.addAll(loan.getAllLoans());
            return ServerResponse.createBySuccess(objects);
        }
    }
}
